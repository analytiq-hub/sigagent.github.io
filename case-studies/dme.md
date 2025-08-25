---
layout: case-study
title: DME - Medical Necessity Review
subtitle: Zero-to-one healthcare AI implementation
permalink: /case-studies/dme/
---

For a stealth startup, we implemented an intelligent system to streamline complex healthcare processes, for Medical Necessity Review.

## The Challenge

The customer needed a zero-to-one cloud implementation, around which they could build an engineering team. They had deep industry knowledge and could identify multiple pilot partners, but needed to bootstrap their product implementation.

## The Solution

We architected and implemented the core system, establishing the foundation that enables the AI-driven solution to operate efficiently and reliably.

## Key Features

Our approach was designed to handle vast amounts of data and to integrate seamlessly with existing healthcare infrastructures. The design supported:

* Download faxes (from RightFax, FaxAge, iFax) containing medical orders, chart notes, lab results, insurance claim information
* Extracting structured information with OCR and LLMs
* Allowing the operator/human-in-the-loop to review and update the extracted information in the UI
* Creating the DME order in the EHR (Brightree, HDMS)

## How It Works
The system was built around several key components:

### Intelligent Data Ingestion & Processing {#intelligent-data-ingestion}

A critical first step is getting the right data in. We utilize **Robotic Process Automation (RPA)** and **APIs** to connect to customer EHR systems and fax portals. This allows us to extract essential information such as:

- **Fax PDFs** (in near real-time, every minute)
- **Patient and order databases** (daily)

All documents are then securely saved to **S3**, processed with **Optical Character Recognition (OCR)** using tools like **Textract**, then with a suite of **Large Language Models** for further intelligent analysis, including page classification, extraction of patient demographics (e.g., first name, last name, DOB, gender, address, phone), insurance details (e.g., payer name, ID, plan, deductible, co-insurance), prescription information (e.g., product category, physician details, NPI, diagnosis codes), and supporting documents.

The system scales horizontally and handles thousands of documents a day, using **Prefect** for thread-level orchestration with up to 25 parallel threads, achieving 50% CPU utilization under max load.

### A Multi-Faceted Tech Strategy {#tech-strategy}

To manage the diverse types of data involved, we designed a sophisticated tech stack:

- **S3** is used for storing raw PDFs, OCR output, and image files
- **MongoDB** is utilized for storing LLM pipeline steps output, providing flexibility for semi-structured data, including collections for documents, images, Textract blocks/text/pages, and LLM extractions
- **Postgres** serves as the UI backend and system of record, providing a reliable and structured data store for patient and order data
- **Databricks** is leveraged for big data batch processing, analytics, and job/workflows
- **Prefect** for orchestration and parallelization of jobs, to achieve horizontal scaling
- **Terraform** to control all cloud infrastructure, including VPC setup, DNS, ECS, EKS, databases, Databricks installation, LabelStudio installation, AWS Lambda functions, Github runners and other services

### Leveraging Large Language Models (LLMs) {#leveraging-llms}

Our design harnesses the power of **LLMs** to perform critical extraction and decision-making tasks, with human in the loop. LLMs are instrumental in:

- **Accurately extracting** patient names, dates of birth, doctor names/NPIs, lab results, chart notes and order information directly from documents
- **Driving specific aspects** of the business logic, making the system highly intelligent and adaptable, including classification of documents (e.g., fax cover, insurance document) and enrichment/post-processing
- **Supporting offline evaluation** with datasets in LabelStudio for annotations, and eval jobs testing modified prompts, with results in MLFlow

**ERP integrations** handle order creation via APIs for Brightree and HDMS, with schemas for patient demographics, insurance (including multiple insurances with coverage order, deductibles, co-insurance), prescriptions, and supporting documents.

## Impact & The Future
All four customer pilots were successful, and converted their business to run on top of the stealth startup product. The stealth startup grew their engineering team to 8-10 people, and were able to transform and scale the technology to begin to cover other use cases.
