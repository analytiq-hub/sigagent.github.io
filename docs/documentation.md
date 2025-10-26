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
                    and use it in the configuration below.
                </p>
            </div>

            <p class="text-gray-600 mb-6">
                Add the following configuration to your <code>~/.claude/settings.json</code> file:
            </p>

            <div class="bg-gray-900 rounded-lg p-6 text-green-400 font-mono text-sm overflow-x-auto">
                <div class="mb-2">
                    <span class="text-gray-400">// ~/.claude/settings.json</span>
                </div>
                <div class="mb-2">
                    <span class="text-yellow-400">{</span>
                </div>
                <div class="ml-4 mb-2">
                    <span class="text-blue-400">"$schema"</span><span class="text-white">: </span><span class="text-green-300">"https://json.schemastore.org/claude-code-settings.json"</span><span class="text-white">,</span>
                </div>
                <div class="ml-4 mb-2">
                    <span class="text-blue-400">"env"</span><span class="text-white">: </span><span class="text-yellow-400">{</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"CLAUDE_CODE_ENABLE_TELEMETRY"</span><span class="text-white">: </span><span class="text-green-300">"1"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"OTEL_METRICS_EXPORTER"</span><span class="text-white">: </span><span class="text-green-300">"otlp"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"OTEL_LOGS_EXPORTER"</span><span class="text-white">: </span><span class="text-green-300">"otlp"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"OTEL_EXPORTER_OTLP_PROTOCOL"</span><span class="text-white">: </span><span class="text-green-300">"grpc"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"OTEL_EXPORTER_OTLP_ENDPOINT"</span><span class="text-white">: </span><span class="text-green-300">"https://app.sigagent.ai:4317"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"OTEL_EXPORTER_OTLP_HEADERS"</span><span class="text-white">: </span><span class="text-green-300">"Authorization=Bearer YOUR_ORG_ACCESS_TOKEN"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"SIGAGENT_URL"</span><span class="text-white">: </span><span class="text-green-300">"https://app.sigagent.ai/fastapi"</span><span class="text-white">,</span>
                </div>
                <div class="ml-8 mb-2">
                    <span class="text-blue-400">"SIGAGENT_TOKEN"</span><span class="text-white">: </span><span class="text-green-300">"YOUR_ORG_ACCESS_TOKEN"</span>
                </div>
                <div class="ml-4 mb-2">
                    <span class="text-yellow-400">}</span>
                </div>
                <div>
                    <span class="text-yellow-400">}</span>
                </div>
            </div>
        </section>

        <!-- Claude Plugin Setup Section -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Enable Claude Plugin Monitoring</h2>
            
            <p class="text-gray-600 mb-6">
                Set up the <strong>sig-agent-marketplace</strong> directly in Claude to monitor tool usage and interactions. 
                The environment variables are already configured above in the Client Setup section.
            </p>
            
            <div class="space-y-6">
                <div>
                    <h3 class="text-lg font-medium text-gray-900 mb-3">1. Add the sig-agent-marketplace to Claude</h3>
                    <p class="text-gray-600 mb-3">
                        In Claude, run the following command:
                    </p>
                    <div class="bg-gray-900 rounded-lg p-4 text-green-400 font-mono text-sm overflow-x-auto">
                        <span class="text-blue-400">/plugin</span> <span class="text-yellow-400">marketplace</span> <span class="text-yellow-400">add</span> <span class="text-green-300">https://github.com/analytiq-hub/sig-agent-marketplace.git</span>
                    </div>
                </div>

                <div>
                    <h3 class="text-lg font-medium text-gray-900 mb-3">2. Enable the sig-agent-plugin in Claude</h3>
                    <p class="text-gray-600 mb-3">
                        In Claude, use the <strong>/plugin</strong> command to enable the <strong>sig-agent-plugin</strong>.
                    </p>
                </div>
            </div>

            <div class="mt-6 p-4 bg-green-50 border border-green-200 rounded-lg">
                <div class="flex items-start">
                    <div class="flex-shrink-0">
                        <svg class="h-5 w-5 text-green-400" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm3.707-9.293a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <div class="ml-3">
                        <p class="text-green-800 text-sm">
                            <strong>That's it!</strong> Your environment variables are already configured above. 
                            Claude will automatically start sending monitoring data to SigAgent.AI.
                        </p>
                    </div>
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
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Configure Claude Settings</h3>
                        <p class="text-gray-600">Add the configuration to your <code>~/.claude/settings.json</code> file as shown in the Quick Start section above.</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">4</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Enable Plugin Monitoring</h3>
                        <p class="text-gray-600">Add the sig-agent-marketplace to Claude and enable the plugin as shown in the Plugin Setup section above.</p>
                    </div>
                </div>
                <div class="flex items-start">
                    <div class="bg-blue-600 text-white rounded-full w-8 h-8 flex items-center justify-center font-bold mr-4 flex-shrink-0">5</div>
                    <div>
                        <h3 class="text-lg font-medium text-gray-900 mb-2">Start Monitoring</h3>
                        <p class="text-gray-600">Launch Claude Code and begin monitoring your agents with real-time telemetry and tool usage.</p>
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
