---
layout: default
title: "SigAgent Architecture"
---

<div class="max-w-7xl mx-auto px-4 sm:px-6 md:px-8 py-8">
  <header class="mb-8">
    <h1 class="text-4xl font-bold text-gray-900 mb-4">SigAgent Architecture</h1>
    <p class="text-gray-700">
      SigAgent gives you two simple ways to see what Claude Code and Claude Agents are doing:
    </p>
    <ul class="list-disc list-inside mt-3 text-gray-700">
      <li><strong>OpenTelemetry</strong> – for overall usage and cost tracking across your team</li>
      <li><strong>SigAgent hooks</strong> – for clear, step‑by‑step logs of every prompt, tool call, and result</li>
    </ul>
  </header>


  <section class="mb-8">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
      <div class="bg-white rounded-lg shadow-lg p-6 md:p-8">
        <h2 class="text-2xl font-semibold text-gray-900 mb-4">OpenTelemetry</h2>
        <p class="text-gray-700 mb-3">OpenTelemetry is great for company‑wide monitoring:</p>
        <ul class="list-disc list-inside text-gray-700 space-y-2">
          <li><strong>What you get</strong>: high‑level token usage, cost, and tool breakdown per session and project.</li>
          <li><strong>What you do not get</strong>: raw prompts, responses, or tool parameters/results. Message contents are not exported by Claude via OTel.</li>
          <li><strong>Included utility</strong>: a code‑change counter that estimates lines changed across edits (exported as an OTel metric).</li>
          <li><strong>Best for</strong>: organization‑wide visibility into Claude Code and Claude Agents usage and spend.</li>
          <li><strong>Agents parity</strong>: Claude Agents (CLI, Python SDK, TypeScript SDK) report via the same OTel interfaces as Claude Code.</li>
        </ul>
      </div>
      <div class="bg-white rounded-lg shadow-lg p-6 md:p-8">
        <h2 class="text-2xl font-semibold text-gray-900 mb-4">SigAgent Hooks</h2>
        <p class="text-gray-700 mb-4">Hooks allow full tracing of prompts and tool calls:</p>
        <ul class="list-disc list-inside text-gray-700 space-y-2">
          <li><strong>Installation</strong>: sigagent cli installs the <em>sig-agent-marketplace</em>, which includes the <em>sig-agent-plugin</em>.</li>
          <li><strong>Marketplace sandbox</strong>: see the repository for the CLI implementation and marketplace sandbox
            (<a class="text-blue-600 hover:text-blue-800 underline" href="github.com/analytiq-hub/sig-agent-marketplace" target="_blank" rel="noopener noreferrer">sig-agent-marketplace repository</a>).</li>
          <li><strong>Coverage</strong>: built‑in tools (e.g., ToDoWrite, Skills) and add‑on tools provided by MCP servers.</li>
          <li><strong>Captured data</strong>: full prompt text and model responses, tool parameters and results, plus timing and error data.</li>
          <li><strong>Upload path</strong>: hooks post traces to <a class="text-blue-600 hover:text-blue-800 underline" href="https://app.sigagent.ai" target="_blank" rel="noopener noreferrer">app.sigagent.ai</a>; records are stored per‑organization in MongoDB and visualized in the UI.</li>
          <li>Claude subscriber needs to use <strong>Pro</strong> or <strong>Max</strong> plan for hooks to be enabled.</li>
        </ul>
      </div>
    </div>
  </section>

  <section class="bg-white rounded-lg shadow-lg p-6 md:p-8 mb-8">
    <h2 class="text-2xl font-semibold text-gray-900 mb-4">Configuration with sig-agent CLI</h2>
    <p class="text-gray-700">Use the CLI to set org tokens and install the marketplace plugin:</p>
    <ol class="list-decimal list-inside mt-2 space-y-2 text-gray-700">
      <li>Run <span class="bg-gray-900 text-green-300 rounded px-2 py-1 font-mono text-sm">npx -y @sigagent/cli setup</span> and provide your organization access token.</li>
      <li>Enable OpenTelemetry export and install the <em>sig-agent-plugin</em> from the marketplace prompts.</li>
      <li>Restart Claude Code; verify traces and logs appear in the SigAgent dashboard.</li>
    </ol>
  </section>

  <section class="bg-white rounded-lg shadow-lg p-6 md:p-8 mb-8">
    <h2 class="text-2xl font-semibold text-gray-900 mb-4">APIs & Ingestion</h2>
    <div class="grid md:grid-cols-2 gap-6 text-gray-700">
      <div>
        <h3 class="text-xl font-medium text-gray-900">Claude & Hooks</h3>
        <ul class="list-disc list-inside mt-2 space-y-1">
          <li><code>POST /v0/claude/log</code> – transcript and hook events</li>
          <li><code>POST /v0/claude/hook</code> – single hook execution</li>
          <li><code>GET /v0/orgs/{org_id}/claude/logs</code> and <code>/claude/hooks</code> – query & manage</li>
        </ul>
      </div>
      <div>
        <h3 class="text-xl font-medium text-gray-900">OpenTelemetry (OTLP)</h3>
        <ul class="list-disc list-inside mt-2 space-y-1">
          <li><code>POST /v0/otlp/v1/traces</code>, <code>/metrics</code>, <code>/logs</code> (HTTP)</li>
          <li>gRPC: TracesService.Export, MetricsService.Export, LogsService.Export</li>
        </ul>
      </div>
    </div>
  </section>

  <section class="bg-white rounded-lg shadow-lg p-6 md:p-8">
    <h2 class="text-2xl font-semibold text-gray-900 mb-4">Diagrams</h2>
    <figure class="mb-6">
      <img class="rounded-lg border border-gray-200" src="/assets/images/sig_agent_claude_architecture.png" alt="Claude + SigAgent configuration overview" />
      <figcaption class="text-sm text-gray-500 mt-2">Claude configuration via CLI, marketplace plugin install, and reporting paths.</figcaption>
    </figure>
    <figure>
      <img class="rounded-lg border border-gray-200" src="/assets/images/sig_agent_architecture.png" alt="SigAgent Architecture" />
      <figcaption class="text-sm text-gray-500 mt-2">Current system overview. A dedicated end‑to‑end flow diagram for the two monitoring paths will be added here.</figcaption>
    </figure>
    <p class="text-sm text-gray-600 mt-3">
      Download the Excalidraw source: <a class="text-blue-600 hover:text-blue-800 underline" href="/assets/js/sig_agent_architecture.excalidraw">sig_agent_architecture.excalidraw</a>
    </p>
    <p class="text-sm text-gray-600">
      Additional flow diagram: <a class="text-blue-600 hover:text-blue-800 underline" href="/assets/js/claude_code_otel_hooks_flow.excalidraw">claude_code_otel_hooks_flow.excalidraw</a>
    </p>
  </section>
</div>


