---
layout: default
title: "SigAgent.AI Documentation"
---

<div class="max-w-4xl mx-auto px-4 sm:px-6 md:px-8 py-8">
    <header class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">SigAgent.AI Documentation</h1>
        <p class="text-xl text-gray-600">
            Quick start guide for monitoring your Claude Agents with SigAgent.AI
        </p>
    </header>

    <main>
        <!-- Quick Start Section -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Quick Start</h2>
            
            <div class="mb-8 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                <p class="text-blue-800">
                    <strong>Step 1:</strong> Create an organization access token by visiting your 
                    <a href="https://app.sigagent.ai/settings/user/developer/organization-access-tokens" 
                       class="text-blue-600 hover:text-blue-800 underline" 
                       target="_blank" 
                       rel="noopener noreferrer">
                        organization access tokens page
                    </a>
                    and use it in step 4 below.
                </p>
            </div>

            <p class="text-gray-600 mb-6">
                Configure the following environment variables before starting Claude Code:
            </p>

            <div class="bg-gray-900 rounded-lg p-6 text-green-400 font-mono text-sm overflow-x-auto">
                <div class="mb-4">
                    <span class="text-gray-400"># 1. Enable telemetry</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">CLAUDE_CODE_ENABLE_TELEMETRY</span>=<span class="text-green-300">1</span>
                </div>
                
                <div class="mb-4">
                    <span class="text-gray-400"># 2. Enable exporters</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">OTEL_METRICS_EXPORTER</span>=<span class="text-green-300">otlp</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">OTEL_LOGS_EXPORTER</span>=<span class="text-green-300">otlp</span>
                </div>
                
                <div class="mb-4">
                    <span class="text-gray-400"># 3. Configure OTLP endpoint</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">OTEL_EXPORTER_OTLP_PROTOCOL</span>=<span class="text-green-300">grpc</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">OTEL_EXPORTER_OTLP_ENDPOINT</span>=<span class="text-green-300">https://app.sigagent.ai:4317</span>
                </div>
                
                <div>
                    <span class="text-gray-400"># 4. Set authentication (replace with your org access token)</span><br/>
                    <span class="text-blue-400">export</span> <span class="text-yellow-400">OTEL_EXPORTER_OTLP_HEADERS</span>=<span class="text-green-300">"Authorization=Bearer YOUR_ORG_ACCESS_TOKEN"</span>
                </div>
            </div>
        </section>

        <!-- Getting Started Section -->
        <section class="bg-blue-50 rounded-lg p-8 mb-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Getting Started</h2>
            <div class="space-y-6">
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">1</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Create Your Account</h3>
                        <p class="text-gray-600">Sign up at <a href="https://app.sigagent.ai" class="text-blue-600 hover:text-blue-800">app.sigagent.ai</a> to get started for free.</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">2</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Generate Access Token</h3>
                        <p class="text-gray-600">Create an organization access token from your account settings.</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">3</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Configure Environment</h3>
                        <p class="text-gray-600">Set up the environment variables as shown in the Quick Start section above.</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">4</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Start Monitoring</h3>
                        <p class="text-gray-600">Launch Claude Code and begin monitoring your agents with real-time telemetry.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Support Section -->
        <section class="bg-white rounded-lg shadow-lg p-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Need Help?</h2>
            <div class="grid md:grid-cols-2 gap-8">
                <div>
                    <h3 class="text-xl font-medium text-gray-900 mb-4">Contact Support</h3>
                    <p class="text-gray-600 mb-4">
                        Get in touch for technical support, questions, or assistance with setup.
                    </p>
                    <ul class="text-gray-600 space-y-2">
                        <li>Email: <a href="mailto:andrei@analytiqhub.com" class="text-blue-600 hover:text-blue-800">andrei@analytiqhub.com</a></li>
                        <li>Website: <a href="https://analytiqhub.com" class="text-blue-600 hover:text-blue-800">analytiqhub.com</a></li>
                    </ul>
                </div>
                <div>
                    <h3 class="text-xl font-medium text-gray-900 mb-4">Resources</h3>
                    <ul class="text-gray-600 space-y-2">
                        <li><a href="https://github.com/analytiq-hub/sig-agent" class="text-blue-600 hover:text-blue-800">GitHub Repository</a></li>
                        <li><a href="/blog" class="text-blue-600 hover:text-blue-800">Blog Posts</a></li>
                        <li><a href="/talks" class="text-blue-600 hover:text-blue-800">Talks & Presentations</a></li>
                    </ul>
                </div>
            </div>
        </section>
    </main>
</div>
