---
layout: post
title: "How We Integrated Stripe Into DocRouter.AI"
date: 2025-10-20 00:00:00 +0000
image: /assets/images/how_to_integrate_stripe.png
categories: [tech, programming, ai, tutorials]
---

At [DocRouter.AI](http://docrouter.ai), we build an AI app for processing documents using LLMs. As our user base grew, we needed a reliable way to handle billing. This post explains our Stripe integration, focusing on key design choices. We'll cover why we chose Stripe, how we keep things flexible, pricing decisions, APIs used, and more.

## Table of Contents

- [Why Use Stripe?](#why-use-stripe)
- [DocRouter.AI Components](#docrouterai-components)
- [Free Tier, Plans, and A-La-Carte Credits](#free-tier-plans-and-a-la-carte-credits)
- [Prices for Large vs. Small Customers](#prices-for-large-vs-small-customers)
- [Price Changing Flexibility](#price-changing-flexibility)
- [The Stripe Product and Price Metadata](#the-stripe-product-and-price-metadata)
- [Python APIs for Retrieving Products and Prices](#python-apis-for-retrieving-products-and-prices)
- [Stripe Checkout and Billing Portal](#stripe-checkout-and-billing-portal)
- [Webhooks and Synchronization](#webhooks-and-synchronization)
- [MongoDB Schema](#mongodb-schema)
- [Tracking SPU Usage](#tracking-spu-usage)
- [Environment Variables](#environment-variables)
- [Development and Testing with Stripe](#development-and-testing-with-stripe)

## Why Use Stripe?

Stripe handles payments securely and scales with our app. It supports __subscriptions__ for recurring plans, __one-time charges__ for credits, and __webhooks__ for real-time updates.

Customers are able to purchase credits we call __SPUs__ (Service Processing Units) - this is our abstraction for LLM usage like token counts. Many other SAAS companies use the same credit-purchase based mechanism. Our inspiration came from Databricks, which measures credits as __DBUs__ (Databricks Processing Units).

As long as the credit units are tied to predictable units of operation - for example, number of pages processed in a document - a credit purchase mechanism is a good choice.

Stripe reduces fraud risks with built-in tools like Radar and handles global currencies/taxes. For an AI app with variable usage, it's essential — manual billing would be error-prone and slow.

## [DocRouter.AI](http://docrouter.ai) components
Our front end is __Next.JS__, with user authentication implemented through __Next.Auth__. Our back end is __Fast API__. The database is __MongoDB__. 

DocRouter [supports __MCP__](https://docrouter.ai/docs/mcp/), and agentic __Claude Code__ integration - allowing document workflows to be controlled through a simple chat interface.

Users can create an account or organization token, and can control all DocRouter.AI functions through [__REST APIs__](https://docrouter.ai/docs/rest-api/). A [__Python SDK__](https://docrouter.ai/docs/python-sdk/) and a [__Typescript SDK__](https://docrouter.ai/docs/typescript-sdk/) are available.

Having the flexibility to control DocRouter programmatically, either through agentic interfacing, or through APIs is great. 

However, use tracking has to be automated, and the customer needs to be charged a small overhead over what DocRouter.AI itself is charged by the underlying LLM and cloud providers.

Stripe integration is, thus, an essential ingredient in making this kind of programmatic integration possible.

## Free Tier, Plans, and A-La-Carte Credits

We want users to start free, upgrade to plans, and be able to buy extra credits without friction. Here's how:

![DocRouter Pricing Plans](/assets/images/docrouter_pricing.png)

New orgs get 100 granted SPUs (no card needed). Additional credits can be purchased. Users can subscribe to an __Individual__ or __Team__ plan, at a discount over the a-la-carte credits price. Or, they can select the __Enterprise__ plan, which is invoiced outside of Stripe.

## Prices for large vs. small customers

The __business__ challenge here is for the pricing scheme to be flexible enough to accommodate large __enterprise__ usage, at custom prices - while also allowing __self-onboarded__ customers. 

Consumption waterfall: allowance first, then purchased, then granted. Keeps costs low for light users, upsell for heavy ones.

The prices need to be in line with what is usually charged for document AI processing - while also capturing the value of more advanced, custom document workflows.

## Price changing flexibility

The __engineering__ challenge is, on the other hand, in how to create this pricing structure in __Stripe__, and ensure the variable part of the config (amounts, utilization thresholds) resides in __Stripe__ configuration rather than local __DocRouter.AI__ code. 

Updating amounts or utilization thresholds at a later time should not require coding changes in DocRouter.AI. These updates should be possible by merely chaging price configuration in __Stripe__.

Pricing updates, however, does not impact existing customers.

How does it all work?

## The Stripe Product and Price metadata

We use Product and Price __metadata__ in __Stripe__:
- We create a Stripe __DocRouter Product__ 
![DocRouter Product](/assets/images/stripe_product.png)

- And we assign it a `product=doc_router` key/value in the __price metadata__. The __DocRouter.AI__ software detects the product using the Stripe Python API, filtering all products to find specifically the one with this key/value.
![DocRouter Product Metadata](/assets/images/stripe_product_metadata.png)

__Stripe__ uses the following 'objects': __Products__, __Prices__ (multiple per product), __Users__ (one per customer), and __Subscriptions__ (each with one or more __Prices__.

- We create two _recurring_ __Prices__ we'll use for monthly subscriptions: the __Individual Price__, and the __Team Price__. We again use _metadata_ to auto-detect the prices:
  - The __Individual Price__ has metadata __included_spus=5000__, __price_type=base__, __tier=individual__.
  - The __Team Price__ has __included_spus=25000__, __price_type=base__, __tier=team__

<div class="flex justify-center my-4">
  <img src="/assets/images/stripe_price_metadata.png" alt="DocRouter Price Metadata" class="w-1/2">
</div>

The DocRouter.AI detects the prices and the tier limits from the metadata.

## Python APIs for Retrieving Products and Prices

DocRouter.AI uses the Stripe Python SDK to dynamically fetch pricing configuration at startup. Here's how:

### Retrieving All Prices with Product Data

```python
prices = stripe.Price.list(active=True, expand=['data.product'])
```

The `expand=['data.product']` parameter loads the full product object (including metadata) alongside each price in a single API call.

### Filtering by Product Metadata

```python
product_prices = [
    price for price in prices.data
    if price.product.metadata.get('product') == 'doc_router'
]
```

This filters prices to only those belonging to our DocRouter product.

### Parsing Price Metadata

```python
for price in product_prices:
    metadata = price.metadata
    price_type = metadata.get('price_type')

    if price_type == 'base':
        tier = metadata.get('tier')
        included_spus = metadata.get('included_spus')
        # Store tier limits for subscription plans
```

All pricing configuration lives in Stripe—we can update prices and tier limits without code changes.

### Wrapping Stripe APIs for Async

Since DocRouter.AI uses FastAPI (an async framework), we wrap Stripe's synchronous API calls to run in a thread pool:

```python
async def _run_in_threadpool(func, *args, **kwargs):
    loop = asyncio.get_event_loop()
    return await loop.run_in_executor(None, partial(func, *args, **kwargs))
```

This prevents blocking the event loop. In practice, we call:

```python
prices = await _run_in_threadpool(
    stripe.Price.list,
    active=True,
    expand=['data.product']
)
```

The wrapper runs the synchronous `stripe.Price.list()` in a separate thread, keeping our async FastAPI endpoints responsive.

## Stripe Checkout and Billing Portal

### Purchasing Credits

When users buy a-la-carte credits, we create a Stripe Checkout session:

```python
session = stripe.checkout.Session.create(
    customer=stripe_customer_id,
    payment_method_types=['card'],
    line_items=[{...}],
    success_url=success_url,
    cancel_url=cancel_url,
    metadata={'org_id': org_id, 'credits': credits}
)
```

<div class="flex justify-center my-4">
  <img src="/assets/images/stripe_payment_portal.png" alt="Stripe Payment Portal">
</div>

Users are redirected to Stripe's hosted checkout page—we never see their credit card details. Stripe handles all payment security.

### Managing Subscriptions

For subscription management, we use Stripe's Billing Portal:

```python
session = stripe.billing_portal.Session.create(
    customer=stripe_customer_id,
    return_url=return_url
)
```

The portal lets users update payment methods, view invoices, and cancel subscriptions—all handled by Stripe.

<div class="flex justify-center my-4">
  <img src="/assets/images/stripe_doc_router_diagram.png" alt="Stripe DocRouter.AI Diagram">
</div>

## Webhooks and Synchronization

Stripe sends webhooks for important events. We verify and process them:

```python
event = stripe.Webhook.construct_event(
    payload,
    signature_header,
    webhook_secret
)
```

Key events we handle:
- `checkout.session.completed` - Add purchased credits
- `customer.subscription.updated` - Sync subscription changes
- `customer.subscription.deleted` - Clear subscription data
- `invoice.payment_succeeded` - Record successful payments

To prevent double-crediting, we track processed transactions in the `db.payments_credit_transactions` collection.

On startup and via webhooks, we sync __Stripe__ data to __MongoDB__. This keeps local data fresh without constant API calls.

## MongoDB Schema

We store payment data in MongoDB collections:

**`payments_customers`** - One document per organization:
```javascript
{
  org_id: "...",
  user_id: "...",
  stripe_customer_id: "cus_...",
  user_name: "...",
  user_email: "...",

  // Subscription fields
  subscription_type: "individual" | "team" | "enterprise",
  subscription_spu_allowance: 5000,
  subscription_spus_used: 1234,  // Reset each billing period
  stripe_subscription_id: "sub_...",
  stripe_subscription_item_id: "si_...",
  stripe_subscription_status: "active",
  stripe_current_billing_period_start: 1234567890,
  stripe_current_billing_period_end: 1237246290,

  // Credit fields
  purchased_credits: 10000,
  purchased_credits_used: 5000,
  granted_credits: 100,
  granted_credits_used: 50,

  // Metadata
  created_at: ISODate(...),
  updated_at: ISODate(...),
  subscription_updated_at: ISODate(...)
}
```

Subscription SPU usage (`subscription_spus_used`) is atomically reset each billing period. Subscription allowances renew monthly. Purchased and granted credits persist until consumed.

**`payments_credit_transactions`** - Audit trail for credit purchases:
```javascript
{
  session_id: "cs_...",
  org_id: "...",
  credits: 1000,
  processed_at: ISODate(...)
}
```

**`payments_usage_records`** - Log of all SPU usage:
```javascript
{
  org_id: "...",
  spus: 42,
  operation: "document_processing",
  source: "backend",
  timestamp: ISODate(...),
  llm_provider: "anthropic",
  llm_model: "claude-3-5-sonnet-20241022",
  prompt_tokens: 1234,
  completion_tokens: 567,
  total_tokens: 1801,
  actual_cost: 0.023
}
```

## Tracking SPU Usage

When LLM calls are made, we increment SPU usage:

```python
async def record_payment_usage(org_id, spus):
    # Consumption order: subscription → purchased → granted
    balances = await get_current_balances(db, org_id)
    consumption = calculate_consumption_breakdown(spus, balances)

    # Update balances atomically
    await update_customer_balances(db, customer_id, consumption)

    # Save usage record
    await save_complete_usage_record(db, org_id, spus, consumption)
```

The consumption waterfall ensures subscription credits are used first, then purchased, then granted.

Users view their credit utilization on the usage page. All data comes from MongoDB — no Stripe API calls needed to track usage, keeping the UI fast.

## Environment Variables

Three Stripe-related environment variables configure the integration:

**`STRIPE_SECRET_KEY`** - Your Stripe API key for authentication. Required to enable Stripe integration.

**`STRIPE_WEBHOOK_SECRET`** - Secret for verifying webhook signatures. Ensures webhook events are legitimate and not forged.

**`STRIPE_PRODUCT_TAG`** - The product identifier in metadata (default: `"doc_router"`). Allows filtering prices to find only those belonging to your product.

If `STRIPE_SECRET_KEY` is not set, Stripe integration is disabled and DocRouter operates in local-only mode.

## Development and Testing with Stripe

Stripe provides separate test and production environments. During development, we use **test mode** keys:

```bash
# .env for development
STRIPE_SECRET_KEY=sk_test_...
STRIPE_WEBHOOK_SECRET=whsec_...
STRIPE_PRODUCT_TAG=doc_router
```

Test mode keys (`sk_test_*`) access a completely separate sandbox with its own customers, subscriptions, and products. You can:

- Create test products and prices in the Stripe Dashboard
- Use test credit cards (like `4242 4242 4242 4242`) for checkout
- Trigger webhooks manually to test event handling
- View all transactions without affecting production data

For production, swap to live keys (`sk_live_*`). The same code works in both modes—Stripe automatically routes API calls to the correct environment based on the key prefix.

This separation lets us develop and debug payment flows safely without risking real customer data or charges.

