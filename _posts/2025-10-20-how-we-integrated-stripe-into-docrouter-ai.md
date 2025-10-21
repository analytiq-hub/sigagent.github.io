---
layout: post
title: "How We Integrated Stripe Into DocRouter.AI"
date: 2025-10-20 00:00:00 +0000
image: /assets/images/how_to_integrate_stripe.png
categories: [tech, programming, ai, tutorials]
---

At [DocRouter.AI](http://docrouter.ai), we build an AI app for processing documents using LLMs. As our user base grew, we needed a reliable way to handle billing. This post explains our Stripe integration, focusing on key design choices. We'll cover why we chose Stripe, how we keep things flexible, pricing decisions, APIs used, and more.

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

- **Free Tier**: New orgs get 100 granted SPUs (no card needed). Limits checked locally in MongoDB—`check_payment_limits` blocks ops if exceeded, raising a `402` error.
- **Individual Plan**: $250/month for 5,000 SPUs ($0.05 per SPU) with basic document processing. Additional SPUs at $0.05 each.
- **Team Plan**: $1,000/month for 25,000 SPUs ($0.04 per SPU) with advanced document processing and team collaboration features. Additional SPUs at $0.05 each.
- **Enterprise Plan**: Custom pricing with dedicated support and custom document processing. Contact sales for details.
- **A-La-Carte Credits**: Users can purchase additional SPUs beyond their plan allowance as one-time Checkout sessions. Credits add to `purchased_credits` on success.

This mix uses Stripe for revenue capture but local tracking for instant checks. Consumption waterfall: allowance first, then purchased, then granted. Keeps costs low for light users, upsell for heavy ones.

## How We Came Up With Pricing

Pricing was trial-and-error. We ran scenarios in Grok.com (xAI's tool) to model revenue at different SPU rates—e.g., $0.001/SPU vs. $0.005, projecting churn at 5–20% usage thresholds. Grok helped simulate 1,000-user cohorts over 12 months.

We also benchmarked competitors in AI document processing:

- **Docparser**: Starter $39/mo for ~300 docs (effective ~$0.13/doc).