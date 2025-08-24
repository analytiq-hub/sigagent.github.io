---
layout: case-study
title: Automating Insurance Submission Processing
subtitle: Intelligent systems to streamline complex healthcare processes
permalink: /case-studies/insurance_wholesaler/
---

## Overview
A specialty insurance wholesaler handles property and casualty insurance submissions, primarily via email attachments in PDF format (e.g., ACORD forms for homeowners, personal auto, dwelling fire, etc.). They use ALIS (Agency Lifecycle Insurance System) by Dyad Tech as their Agency Management System (AMS), which includes features for submission creation, clearance checks, policy issuance, and document management.

The pilot with [DocRouter.AI](http://docrouter.ai) aims to automate the ingestion, extraction, and population of data from unstructured insurance submissions into ALIS, reducing manual data entry while maintaining compliance and accuracy through human-in-the-loop reviews. This addresses high-volume processing (approximately 7,000 submissions per year, with 50% handwritten), with potential to save an estimated 7-14 hours per day by automating 75% of the clearance workflow.

The project focuses on precise document understanding using LLMs (e.g., GPT/Claude) combined with OCR (e.g., AWS Textract) for handling handwritten/typed forms, checkboxes, and tables. Data is extracted into structured JSON schemas and planned to be pushed to ALIS via APIs for CRUD operations (create, read, update, delete). The pilot is in the development and testing phase, with integration to ALIS and OFAC automation as key next steps.

## Client Background
The wholesaler processes submissions from retail agents, categorizing them as personal or commercial lines. Key workflows include:
- Receiving emails with attachments (e.g., ACORD 80 for homeowners, ACORD 140 for commercial property).
- Performing "clearance" searches in ALIS to check for existing insureds (using fields like name, address, state).
- Creating new submissions or updating existing records.
- Sending acknowledgment letters.
- Generating applications and assigning to underwriters (UW).
- Planning for OFAC searches (via public API) for compliance, though not yet automated.

Their current manual process involves 10-15 staff members, with two primary handlers, leading to inefficiencies in data entry, classification, and review. ALIS supports email-triggered workflows via "email listeners" (e.g., forwarding to designated inboxes like Outlook), but lacks native AI-driven extraction for unstructured PDFs.

## Challenges
- **High Volume and Variability**: 600 submissions per month, with attachments often combining multiple forms (e.g., 1-3 PDFs per email). 50% are handwritten, including ambiguities like crossed-out text or non-standard layouts.
- **Manual Clearance and Data Entry**: Users manually review PDFs, extract key fields (e.g., insured name, address, DOB, occupation, agency info), and perform searches in ALIS. This is time-intensive and error-prone.
- **Classification and Routing**: Human classification (personal vs. commercial, binding vs. brokerage) before forwarding to workflows; no automation for document type detection.
- **Compliance and Accuracy**: Need for human oversight on low-confidence extractions (e.g., handwriting, potential false positives in planned OFAC checks). Data privacy requires temporary storage and deletion post-processing.
- **Integration Limitations**: ALIS APIs exist for CRUD but are not publicly documented; Dyad provides access via partner accounts. No built-in OCR/AI for forms.
- **Cost and Scalability**: Manual processes cost time equivalent to full staff hours; goal is time savings, not direct cost reduction, with regulatory need for human-in-the-loop.

## Solution
DocRouter.AI provides a flexible, schema-driven platform that ingests unstructured documents, extracts data using LLMs and OCR, flags low-confidence items for review, and plans integration with ALIS via APIs. The solution is deployed as SaaS (with VPC options for privacy) and uses tools like n8n for workflow orchestration.

Key components:
- **Ingestion**: Emails forwarded to a DocRouter "email listener" or via Outlook extension/API. Attachments are automatically uploaded.
- **Extraction**: OCR (AWS Textract) handles handwriting/tables/checkboxes; LLMs (GPT/Claude) extract structured data based on prompts/schemas (e.g., applicant info, policy details, property specifics).
- **Classification**: LLM determines form type (e.g., personal auto/homeowner) and flags issues (e.g., "N/A" fields, low confidence).
- **Clearance and Population**: Extracted data planned to query ALIS APIs for existing insureds. If no match, create new profile; if match, update submission. Push data to ALIS (e.g., populate fields like name, address, DOB).
- **Human-in-the-Loop**: UI for review shows flagged fields (e.g., color-coded: green=high confidence, yellow/red=needs attention) with linked source document sections. Corrections planned to push back to ALIS.
- **Automation Triggers**: Send acknowledgment emails; plan OFAC API integration for automated searches with manual override for false positives.
- **Data Handling**: Temporary storage (e.g., hours) with auto-deletion post-processing to avoid duplication in DMS (Document Management System).

## Key Features
- **Schema-Driven Extraction**: Custom schemas for ACORD forms (e.g., insured name, mailing address, zip, state, agency name/address, effective date, coverages, limits, deductibles).
- **Confidence Scoring**: LLMs act as "judges" to score extractions (e.g., >80% confidence = auto-proceed; lower = flag for review).
- **UI for Review**: Split-screen interface (PDF on one side, editable form fields on the other) with lookup function highlighting source text.
- **API Integration**: Planned CRUD for ALIS (e.g., search/create submissions); JSON for data transfer.
- **Workflow Orchestration**: Email-triggered automation; role-based access (e.g., producers review extractions, UW handles assignment).
- **Security and Compliance**: Data deletion APIs; VPC deployment; idempotency to prevent duplicates.
- **Scalability**: Handles multi-attachment emails; processes in chunks for large docs.

## Implementation
The pilot is being implemented in phases:
1. **Discovery (June-August 2025)**: Analyzed wholesaler's SOPs, sample PDFs, and ALIS screenshots. Generated synthetic docs for testing.
2. **Ingestion Setup**: Configured email forwarding to DocRouter; API for direct uploads.
3. **Extraction Pipeline**: Built LLM prompts for key fields; integrated OCR for handwriting. Tested on personal lines first (e.g., homeowners), then commercial.
4. **Integration Planning**: Accessing ALIS APIs via Dyad (e.g., for clearance searches, submission creation). Using n8n for end-to-end workflows.
5. **Review UI**: Developed simplified interface with color-coding and source linking.
6. **Testing and Iteration**: Handling edge cases (e.g., multi-language docs). OFAC automation and Agency Management System (AMS) integration in planning.

Collaboration involves close feedback loops with the wholesaler, focusing on user-friendly design (e.g., table-like UI over string displays).

## Initial Findings and Projected Results
- **Efficiency Gains**: Early tests show potential to automate 75% of clearance work, reducing manual entry from hours to minutes per submission. Projected savings: 7-14 staff hours/day.
- **Accuracy**: LLM+OCR achieved >90% accuracy on typed forms, 80% on handwritten (with human review for the rest). Reduced errors in clearance searches.
- **Scalability**: Handled 600+ monthly submissions in simulations; classified docs accurately (personal vs. commercial).
- **Compliance**: Human oversight ensures no full automation without review; planned OFAC to reduce manual searches.

Next steps include full integration with ALIS APIs and completion of OFAC automation.

## Conclusion
The DocRouter.AI pilot demonstrates how AI can streamline insurance workflows in regulated environments for specialty wholesalers using ALIS, with planned seamless integration while prioritizing human oversight. This use case is reusable across specialty insurance, with potential expansions to full Agency Management System (AMS) integration.

For more details, contact Andrei Radulescu-Banu at andrei@analytiqhub.com. Platform demo available at [app.docrouter.ai](https://app.docrouter.ai)