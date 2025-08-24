---
layout: default
title: "Analytiq Hub - Data+AI Solutions"
---

<div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8 py-4 md:py-12">
    <!-- Hero Section -->
    <header class="text-center md:mb-12 mb-8">
        <h1 class="text-4xl md:text-5xl font-bold text-gray-900 mb-6">
            Boost Your Business with AI and Data
        </h1>
        <div class="text-xl md:text-2xl text-gray-600 mb-8">
            <p class="mb-4">Custom AI solutions and expert guidance for biotech and healthtech</p>
            <p class="text-lg">We help startups and businesses save time and cut costs</p>
        </div>
        <div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
            <a href="/contact/" class="inline-block bg-blue-600 hover:bg-blue-700 text-white px-8 py-4 rounded-lg font-semibold text-lg transition-colors duration-200">
                Contact Us
            </a>
            <a href="/use-cases/" class="inline-block border-2 border-blue-600 text-blue-600 hover:bg-blue-50 px-8 py-4 rounded-lg font-semibold text-lg transition-colors duration-200">
                Success Stories
            </a>
        </div>
    </header>

    <main>
        <!-- Services Section -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6 text-center">Our Services</h2>
            <div class="grid md:grid-cols-3 gap-8">
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <span class="text-2xl">👔</span>
                    </div>
                    <h3 class="text-xl font-medium text-gray-900 mb-2">Fractional CTO</h3>
                    <p class="text-gray-600">Strategic technology leadership and AI adoption guidance for startups and growing companies</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <span class="text-2xl">🏗️</span>
                    </div>
                    <h3 class="text-xl font-medium text-gray-900 mb-2">Full Stack Implementation</h3>
                    <p class="text-gray-600">End-to-end development of AI solutions and custom platforms across Azure, AWS, and Databricks</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-100 rounded-full w-16 h-16 flex items-center justify-center mx-auto mb-4">
                        <span class="text-2xl">🧠</span>
                    </div>
                    <h3 class="text-xl font-medium text-gray-900 mb-2">AI and Data Solutions</h3>
                    <p class="text-gray-600">Design AI systems that streamline operations and meet regulatory requirements</p>
                </div>
            </div>
        </section>

        <!-- Why Choose Us -->
        <section class="bg-gradient-to-r from-blue-600 to-blue-800 rounded-lg shadow-lg p-8 mb-12">
            <div class="text-center">
                <h2 class="text-3xl font-semibold text-white mb-6">Why Analytiq Hub?</h2>
                <p class="text-xl text-blue-100 mb-8">
                    Specialized expertise in biotech and healthtech with comprehensive AI solutions
                </p>
                <div class="grid md:grid-cols-2 gap-8 max-w-4xl mx-auto">
                    <div class="bg-white bg-opacity-10 rounded-lg p-6">
                        <h3 class="text-xl font-medium text-white mb-3">Industry Focus</h3>
                        <ul class="text-blue-100 space-y-2 text-left">
                            <li>• Biotech and healthtech specialization</li>
                            <li>• Lab informatics expertise</li>
                            <li>• Medical equipment sector knowledge</li>
                            <li>• Startup-focused approach</li>
                        </ul>
                    </div>
                    <div class="bg-white bg-opacity-10 rounded-lg p-6">
                        <h3 class="text-xl font-medium text-white mb-3">Technical Excellence</h3>
                        <ul class="text-blue-100 space-y-2 text-left">
                            <li>• AI and machine learning expertise</li>
                            <li>• Multi-cloud platform experience</li>
                            <li>• Custom AI solution development</li>
                            <li>• Strategic technology partnership</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <!-- Success Stories Section -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-12">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6 text-center">Success Stories</h2>
            <div class="max-w-3xl mx-auto text-center">
                <p class="text-lg text-gray-600 mb-6">
                    See how we've helped businesses like yours streamline operations with AI
                </p>
                <div class="grid md:grid-cols-2 gap-8">
                    {% include case-study-card.html 
                        title="DME" 
                        description="Durable Medical Equipment - full stack AI for processing and compliance." 
                        url="/case-studies/dme/" %}
                    
                    {% include case-study-card.html 
                        title="Insurance" 
                        description="Automate claims processing and risk assessment." 
                        url="/case-studies/insurance_wholesaler/" %}
                </div>
                <div class="text-center mt-6">
                    <a href="/use-cases/" class="text-blue-600 hover:text-blue-800 font-medium">View All Use Cases →</a>
                </div>
            </div>
        </section>
    </main>
</div>