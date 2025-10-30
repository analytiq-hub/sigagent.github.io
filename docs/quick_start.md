---
layout: default
title: "Getting Started"
---

<div class="max-w-4xl mx-auto px-4 sm:px-6 md:px-8 py-8">
    <header class="mb-8">
        <h1 class="text-4xl font-bold text-gray-900 mb-4">Getting Started</h1>
        <p class="text-xl text-gray-600">
            Quick start guide for monitoring your Claude Agents with SigAgent.AI
        </p>
    </header>

    <main>
        <!-- Client Setup Section (mirrors app homepage) -->
        <section class="bg-white rounded-lg shadow-lg p-8 mb-8">
            <h2 class="text-3xl font-semibold text-gray-900 mb-6">Steps</h2>

            <div class="mb-6 p-4 bg-blue-50 border border-blue-200 rounded-lg">
                <ol class="list-decimal list-inside text-blue-800 text-sm space-y-2">
                    <li>
                    Sign up at 
                    <a 
                        href="https://app.sigagent.ai"
                        class="text-blue-600 hover:text-blue-800 underline"
                        target="_blank"
                        rel="noopener noreferrer"
                    >
                        app.sigagent.ai
                    </a>
                    to get started for free.
                    </li>
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
                        On your workstation, run the following and provide the org token when prompted:
                        <div class="mt-3 bg-gray-900 rounded-lg p-4 text-green-400 font-mono text-sm overflow-x-auto">
                          <span class="text-white">npx</span> <span class="text-green-300">-y</span> <span class="text-white">@sigagent/cli</span> <span class="text-yellow-400">setup</span>
                        </div>
                    </li>
                    <li>
                        Restart Claude Code.
                    </li>
                    <li>
                        Monitor the logs and the dashboard to ensure Claude Code is traced.
                    </li>
                </ol>
            </div>
        </section>

        <div class="mb-6 p-4 bg-yellow-50 border border-yellow-200 rounded-lg text-yellow-800">
            <strong>Note:</strong> Claude Code hooks and traces are only supported with
            Claude Code <span class="font-semibold">Pro</span> and <span class="font-semibold">Max</span> subscriptions.
        </div>

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
