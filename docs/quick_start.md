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
        <!-- Client Setup Section (mirrors app homepage) -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Client Setup</h2>

            <div class="mb-6 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                <ol class="list-decimal list-inside text-blue-800 text-sm space-y-2">
                    <li>
                        <a 
                          href="https://app.sigagent.ai/settings/user/developer/organization-access-tokens"
                          class="text-blue-600 hover:text-blue-800 underline"
                          target="_blank"
                          rel="noopener noreferrer"
                        >
                          Create an organization access token
                        </a>
                    </li>
                    <li>
                        Run the following and provide the org token when prompted:
                        <div class="mt-3 bg-gray-900 rounded-lg p-4 text-green-400 font-mono text-sm overflow-x-auto">
                          <span class="text-white">npx</span> <span class="text-green-300">-y</span> <span class="text-white">@sigagent/cli</span> <span class="text-yellow-400">setup</span>
                        </div>
                    </li>
                    <li>
                        Restart Claude Code.
                    </li>
                </ol>
            </div>
        </section>

        <!-- Plugin setup section removed to match simplified instructions -->

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
