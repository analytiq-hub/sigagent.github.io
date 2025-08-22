---
layout: case-study
title: DME - Medical Necessity Review
subtitle: Intelligent systems to streamline complex healthcare processes
permalink: /case-studies/dme/
---


At a stealth startup, we're building intelligent systems to streamline complex healthcare processes, particularly in areas like Medical Necessity Review. My work with Ashvin has involved significant contributions to the core system design, establishing the foundational architecture that enables our AI-driven solutions to operate efficiently and reliably.

Our approach to medical necessity review at a system level is a comprehensive one, designed to handle vast amounts of data and integrate seamlessly with existing healthcare infrastructures. Drawing insights from our detailed feature specifications, the online system is built around several key components:

## Intelligent Data Ingestion & Processing {#intelligent-data-ingestion}

A critical first step is getting the right data in. We utilize **Robotic Process Automation (RPA)** and **APIs** to connect to customer ERP systems and fax portals. This allows us to extract essential information such as:

- **Fax PDFs** (in near real-time)
- **Patient and order databases** (daily)

All documents are then securely saved to **S3** and processed with **Optical Character Recognition (OCR)**, laying the groundwork for further intelligent analysis.

## The Power of the Event Loop {#event-loop}

At the heart of our system is a robust **event loop**. This component is responsible for:

- **Dispatching operations**
- **Implementing intricate business logic** required for medical necessity review
- **Acting as the orchestrator**, ensuring data flows correctly through various processing stages

## A Multi-Faceted Database Strategy {#database-strategy}

To manage the diverse types of data involved, we employ a sophisticated database storage strategy:

- **S3** is used for storing raw PDFs, OCR output, and image files
- **Postgres** serves as the UI backend, providing a reliable and structured data store for our user interfaces
- **Databricks** is leveraged for big data batch processing and analytics, enabling advanced machine learning capabilities and, in the future, supporting Revenue Cycle Management (RCM) KPIs
- **MongoDB** is utilized for storing pipeline output, providing flexibility for semi-structured data from our processing workflows

## Leveraging Large Language Models (LLMs) {#leveraging-llms}

Our system harnesses the power of **LLMs** to perform critical extraction and decision-making tasks. LLMs are instrumental in:

- **Accurately extracting** patient names, dates of birth, doctor names/NPIs, and order information directly from documents
- **Driving specific aspects** of the business logic, making our system highly intelligent and adaptable

## Looking Ahead: Refining Intelligence and Integration {#looking-ahead}

As with any cutting-edge system, we're continuously evolving. Key areas of ongoing development and refinement include:

1. **Determining the optimal balance** for business logic residency—whether it primarily resides within LLMs or is distributed between LLMs and the Event Loop
2. **Strategizing the implementation** of LLM prompts—whether they are embedded inline or managed within a dedicated LLM prompt library
3. **Exploring the best approaches** for LLM orchestration

Through this carefully designed and continuously refined architecture, Ashvin AI is empowering healthcare organizations to achieve greater efficiency, accuracy, and compliance in their operations. It's an exciting time to be at the forefront of healthcare technology, and I'm proud to contribute to building these transformative solutions.
