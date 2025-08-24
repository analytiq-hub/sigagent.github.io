---
layout: case-study
title: DME - Medical Necessity Review
subtitle: Intelligent systems to streamline complex healthcare processes
permalink: /case-studies/dme/
---


For a stealth startup, we implemented an intelligent systems to streamline complex healthcare processes, for Medical Necessity Review. 

## The Challenge

The customer needed a zero-to-one cloud implementation, around which they could build an engineering team. They had deep industry knowledge and could identify multiple pilot partners, but needed to bootstrap their product implementation.

## The Solution

We architected and implemented the core system, establishing the foundation that enables the AI-driven solution to operate efficiently and reliably.

## Key Features

Our approach was designed to handle vast amounts of data and to integrate seamlessly with existing healthcare infrastructures. 

## How It Works
The system was built around several key components:

### Intelligent Data Ingestion & Processing {#intelligent-data-ingestion}

A critical first step is getting the right data in. We utilize **Robotic Process Automation (RPA)** and **APIs** to connect to customer EHR systems and fax portals. This allows us to extract essential information such as:

- **Fax PDFs** (in near real-time)
- **Patient and order databases** (daily)

All documents are then securely saved to **S3**, processed with **Optical Character Recognition (OCR)**, then with a suite of **Large Language Models** for further intelligent analysis.

The system scales horizontally and handle thousands of documents a day.

### A Multi-Faceted Tech Strategy {#tech-strategy}

To manage the diverse types of data involved, we designed a sophisticated tech stack:

- **S3** is used for storing raw PDFs, OCR output, and image files
- **MongoDB** is utilized for storing LLM pipeline steps output, providing flexibility for semi-structured data
- **Postgres** serves as the UI backend and system of record, providing a reliable and structured data store
- **Databricks** is leveraged for big data batch processing and analytics, enabling advanced machine learning capabilities and, in the future, supporting Revenue Cycle Management (RCM) KPIs
- **Prefect** for orchestration
- **Terraform** to control all cloud infrastructure, including VPC setup, databases, Databricks installation and other services


### Leveraging Large Language Models (LLMs) {#leveraging-llms}

Our design harnesses the power of **LLMs** to perform critical extraction and decision-making tasks, with human in the loop. LLMs are instrumental in:

- **Accurately extracting** patient names, dates of birth, doctor names/NPIs, lab results, chart notes and order information directly from documents
- **Driving specific aspects** of the business logic, making the system highly intelligent and adaptable

## Impact & The Future
All four customer pilots were successful, and converted their business to run on top of the stealth startup product. The stealth startup grew their engineering team to 8-10 people, and were able to transform and scale the technology to begin to cover other use cases.
