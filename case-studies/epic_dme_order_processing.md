---
layout: case-study
title: Epic EHR Integration
subtitle: Intelligent Epic order processing automation
permalink: /case-studies/epic_dme_order_processing/
---

## The Challenge

A Durable Medical Equipment (DME) provider faced inefficiencies in processing orders from Epic EHR systems used by hospitals like Albany Med and St. Peters. Previously, orders were manually pulled from Epic's In Basket every few hours, with supporting documents like facesheets, sleep studies, office notes, and encounters requiring manual searches and downloads. This process was time-consuming, prone to errors, and involved handling duplicates across various chart types such as office visits, patient messages, and routed reports. Additionally, accessing raw sleep studies and ensuring compliance with requirements (e.g., Medicare's need for office notes preceding sleep studies) added complexity. With 50% of CPAP orders originating from Epic, scaling this manual workflow was unsustainable, especially as offices shifted away from faxing documents and relied on the DME provider to retrieve them directly.

## The Solution

We implemented an automated Epic connector system to streamline order ingestion and processing. This zero-touch solution uses Robotic Process Automation (RPA) via Selenium for Epic login, integrates with AWS services for secure MFA handling, and leverages Databricks jobs for scraping, reassembly, OCR, and LLM-based parsing. The system polls for new orders, downloads and caches files, processes them through queues, and integrates with existing fax workflows, ensuring idempotent and deduplicated handling of DME-related documents.

## Key Features

* **Automated Epic Login with MFA:** Uses Selenium to log in, polls MongoDB for 6-character codes forwarded from Gmail via AWS SES, enabling secure, unattended access.
* **Comprehensive Data Scraping:** Retrieves patient facesheets, orders, notes, media, and encounters for patients CC'd to the DME provider, with caching in MongoDB to skip retries.
* **File Reassembly and OCR Integration:** Fragments are reassembled into PDFs, processed via OCR, and routed to Temporal orchestrators for further handling.
* **LLM-Driven Parsing and Deduplication:** Employs prompts to extract structured data from orders, notes, and encounters; deduplicates based on length, content similarity, and LLM checks.
* **Idempotent Processing:** Updates MongoDB records during processing to prevent reprocessing, discarding non-DME files.
* **Seamless Integration:** Aligns with existing fax pipelines, supporting various Epic chart types like office visits, patient messages, and routed reports.

## How It Works
### Intelligent Data Ingestion & Processing
The Epic connector Databricks job uses Selenium to initiate login to Epic's web interface. Epic sends a 6-character MFA code to a dedicated Gmail address, which forwards it to AWS SES. SES saves the email to S3 and triggers a Lambda function to store the code in the prod_ses MongoDB collection. The job polls this collection to retrieve the code and complete login.

Once authenticated, the system scrapes lists of CC'd patients and downloads relevant files (facesheets, orders, notes, media, encounters), caching steps in epic_step_cache MongoDB for efficiency. Downloaded files are queued to prod_ocr via SQS, with metadata stored separately.

Reassembly occurs via another Databricks job triggered by the epic_reassembly SQS queue, producing a unified PDF. This PDF undergoes OCR processing like standard faxes, then routes to a Temporal orchestrator for orchestration.

### A Multi-Faceted Tech Strategy

* **Storage and Databases:** AWS S3 for email and file storage; MongoDB collections (prod_ses, epic_step_cache, epic_order_files) for MFA codes, caching, and order metadata.
* **Orchestration and Processing:** Databricks for jobs handling scraping, reassembly, and OCR; SQS queues for asynchronous messaging.
* **Infrastructure Management:** Terraform deploys AWS SES, Lambda, and related modules.
* **Security and Compliance:** Handles Epic's vendor requirements, FHIR compliance considerations, and RPA for credential-based access.

### Leveraging Large Language Models (LLMs)
LLMs parse OCR outputs using specific prompts for orders, notes, media, and encounters. For example, orders use dedicated prompts, while deduplication checks content similarity, ignoring minor differences like dates. Non-DME files are filtered out, ensuring only relevant data proceeds.

## Impact & The Future
This implementation automates what was once a manual, error-prone process, reducing processing time from hours to minutes and enabling real-time handling of Epic orders. By integrating with Brightree's MyForms, it has improved accuracy in medical necessity reviews, reduced duplicates, and ensured compliance with payer requirements like Medicare. Looking ahead, the system scales to additional EHR integrations, can add support for FHIR APIs for real-time data, and expand to other DME use cases.
