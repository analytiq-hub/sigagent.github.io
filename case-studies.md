---
layout: default
title: Case Studies & Success Stories
subtitle: See how we've helped businesses transform their operations
permalink: /case-studies/
---

<!-- Header Section with Gray Background -->
<div class="bg-gray-50 py-8 md:py-12">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8">
        <header class="text-center">
            <h1 class="text-3xl md:text-4xl font-bold text-gray-900 mb-4">{{ page.title }}</h1>
            <p class="text-lg md:text-xl text-gray-600">{{ page.subtitle }}</p>
        </header>
    </div>
</div>

<!-- Content Section with White Background -->
<div class="bg-white py-8 md:py-12">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8">
        <main>
            <!-- Case Studies Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 justify-items-center max-w-5xl mx-auto">
            {% include case-study-card.html 
                title="DME" 
                description="Durable Medical Equipment - full stack AI for processing and compliance." 
                url="/case-studies/dme/" %}
            
            {% include case-study-card.html 
                title="Epic EHR Integration" 
                description="Automated order processing with zero-touch RPA and intelligent document handling." 
                url="/case-studies/epic_dme_order_processing/" %}
            
            {% include case-study-card.html 
                title="Insurance" 
                description="Automate claims processing and risk assessment." 
                url="/case-studies/insurance_wholesaler/" %}
            
            {% include case-study-card.html 
                title="DocRouter.AI" 
                description="Leveraging AI coding tools and expertise to develop an intelligent document processing platform." 
                url="/case-studies/docrouter-ai/" %}
            
            {% include case-study-card.html 
                title="Supply Chain" 
                description="Document processing for trade documents and security compliance in global supply chains." 
                url="/case-studies/supply-chain/" %}
            </div>
        </main>
    </div>
</div>