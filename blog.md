---
layout: default
title: Blog
---

<div class="max-w-6xl mx-auto px-4 sm:px-6 md:px-8 py-4 md:py-12">
    <!-- Header -->
    <header class="mb-8">
        <h1 class="text-2xl md:text-3xl font-semibold text-gray-800 mb-2">
            Blog
        </h1>
        <p class="text-gray-600 text-lg">
            Technical insights, tutorials, and thoughts on AI, software engineering, and technology
        </p>
    </header>

    <div class="flex flex-col lg:flex-row gap-8">
        <!-- Main Content -->
        <main class="flex-1">
            <div class="space-y-8">
            {% for post in site.posts %}
                <article class="bg-white rounded-lg shadow-lg hover:shadow-xl transition-shadow duration-300 overflow-hidden">
                    <div class="flex flex-col md:flex-row">
                        {%- if post.image -%}
                            <div class="md:w-1/3 flex-shrink-0 bg-gray-50 rounded-lg overflow-hidden">
                                <div class="aspect-video h-48 md:h-auto flex items-center justify-center p-2">
                                    <img src="{{ post.image | relative_url }}" alt="{{ post.title | escape }}" class="w-full h-full object-contain">
                                </div>
                            </div>
                        {%- endif -%}
                        <div class="flex-1 p-6">
                            <header class="mb-4">
                                <h2 class="text-xl md:text-2xl font-bold text-gray-900 mb-2">
                                    <a href="{{ post.url | relative_url }}" class="text-gray-900 hover:text-blue-600 transition-colors">
                                        {{ post.title }}
                                    </a>
                                </h2>
                                <div class="flex flex-wrap items-center gap-3 text-sm text-gray-600">
                                    <time datetime="{{ post.date | date: '%Y-%m-%d' }}">
                                        {{ post.date | date: '%B %d, %Y' }}
                                    </time>
                                    {% if post.categories %}
                                        <span class="text-gray-400">•</span>
                                        <div class="flex flex-wrap gap-2">
                                            {% for category in post.categories %}
                                                <span class="bg-blue-100 text-blue-700 px-2 py-1 rounded-md text-xs font-medium">
                                                    {{ category | replace: '_', ' ' | capitalize }}
                                                </span>
                                            {% endfor %}
                                        </div>
                                    {% endif %}
                                </div>
                            </header>
                            
                            {% if post.excerpt %}
                                <div class="text-gray-700 leading-relaxed mb-4">
                                    {{ post.excerpt | strip_html | truncate: 200 }}
                                </div>
                            {% endif %}
                            
                            <footer>
                                <a href="{{ post.url | relative_url }}" 
                                   class="inline-flex items-center gap-1 text-blue-600 hover:text-blue-800 font-medium transition-colors">
                                    Read more
                                    <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"/>
                                    </svg>
                                </a>
                            </footer>
                        </div>
                    </div>
                </article>
            {% endfor %}
            
            {% if site.posts.size == 0 %}
                <div class="text-center py-12">
                    <p class="text-gray-600 text-lg">No blog posts available yet.</p>
                </div>
            {% endif %}
            </div>
        </main>

        <!-- Sidebar - Hidden on mobile -->
        <aside class="hidden lg:block lg:w-80 flex-shrink-0">
            {% include blog-sidebar.html %}
        </aside>
    </div>
</div>
