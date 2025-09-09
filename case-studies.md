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

<!-- People Header Image -->
<div class="bg-white py-4">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8">
        <div class="text-center">
            <img src="/assets/images/people header 1.png" alt="People Header" class="mx-auto max-w-full h-auto rounded-lg shadow-sm">
        </div>
    </div>
</div>

<!-- Content Section with White Background -->
<div class="bg-white py-8 md:py-12">
    <div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8">
        <main>
            <!-- Case Studies Grid -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 justify-items-center max-w-5xl mx-auto">
            {% include case-study-card.html 
                title="Healthcare Automation That Delivers ROI" 
                description="How we built a zero-to-ten DME automation platform that enabled 4x team growth and secured funding" 
                url="/case-studies/dme/" %}
            
            {% include case-study-card.html
                title="Epic EHR Integration That Reduces Errors" 
                description="Zero-touch Epic automation reducing processing time by 90% while ensuring 100% compliance" 
                url="/case-studies/epic_dme_order_processing/" %}
            
            {% include case-study-card.html 
                title="Insurance Automation That Reduces Manual Work" 
                description="AI-powered submission processing reducing manual work by 75% while ensuring compliance" 
                url="/case-studies/insurance_wholesaler/" %}
            
            {% include case-study-card.html 
                title="DocRouter.AI - Document Processing Platform" 
                description="AI-powered document understanding for enterprise workflows" 
                url="/case-studies/docrouter-ai/" %}
            
            {% include case-study-card.html 
                title="Supply Chain Automation That Delivers Results" 
                description="AI-powered trade document processing reducing manual work from hours to minutes" 
                url="/case-studies/supply-chain/" %}
            </div>
        </main>
    </div>
</div>