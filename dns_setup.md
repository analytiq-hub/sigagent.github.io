---
layout: page
title: DNS Setup for GitHub Pages
---

<div class="bg-white rounded-lg shadow-lg p-8">
  <h1 class="text-3xl font-bold text-gray-900 mb-6">How to Point Your Domain to GitHub Pages</h1>
  
  <div class="prose max-w-none">
    <p class="text-gray-600 mb-6 leading-relaxed">
      This guide walks you through the process of configuring your custom domain to point to your GitHub Pages site.
    </p>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Step 1: Configure GitHub Pages Settings</h2>
    
    <ol class="list-decimal list-inside space-y-3 mb-6">
      <li class="text-gray-700">Navigate to your repository on GitHub</li>
      <li class="text-gray-700">Go to <strong>Settings</strong> → <strong>Pages</strong></li>
      <li class="text-gray-700">Under "Custom domain", enter your domain name (e.g., <code class="bg-gray-100 px-2 py-1 rounded">example.com</code>)</li>
      <li class="text-gray-700">Click <strong>Save</strong></li>
    </ol>

    <div class="bg-blue-50 border-l-4 border-blue-400 p-4 mb-6">
      <p class="text-blue-700">
        <strong>Note:</strong> GitHub will create a CNAME file in your repository root. Don't delete this file.
      </p>
    </div>

    <div class="bg-yellow-50 border-l-4 border-yellow-400 p-4 mb-6">
      <p class="text-yellow-700">
        <strong>Important:</strong> Do NOT enable "Enforce HTTPS" yet. This must be done after DNS configuration is complete and verified.
      </p>
    </div>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Step 2: Configure DNS Records</h2>

    <p class="text-gray-600 mb-4">
      The DNS configuration depends on whether you're using an apex domain (example.com) or a subdomain (www.example.com).
    </p>

    <h3 class="text-xl font-semibold text-gray-800 mt-6 mb-3">For Apex Domains (example.com)</h3>
    
    <p class="text-gray-600 mb-3">Create the following A records in your DNS provider:</p>
    
    <div class="bg-gray-100 p-4 rounded-lg mb-4">
      <pre class="text-sm"><code>Type: A    Name: @    Value: 185.199.108.153
Type: A    Name: @    Value: 185.199.109.153
Type: A    Name: @    Value: 185.199.110.153
Type: A    Name: @    Value: 185.199.111.153</code></pre>
    </div>

    <p class="text-gray-600 mb-4">
      Also create a CNAME record for the www subdomain:
    </p>

    <div class="bg-gray-100 p-4 rounded-lg mb-6">
      <pre class="text-sm"><code>Type: CNAME    Name: www    Value: yourusername.github.io</code></pre>
    </div>

    <h3 class="text-xl font-semibold text-gray-800 mt-6 mb-3">For Subdomains (www.example.com)</h3>
    
    <p class="text-gray-600 mb-3">Create a single CNAME record:</p>
    
    <div class="bg-gray-100 p-4 rounded-lg mb-6">
      <pre class="text-sm"><code>Type: CNAME    Name: www    Value: yourusername.github.io</code></pre>
    </div>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Step 3: Common DNS Providers</h2>

    <div class="grid md:grid-cols-2 gap-6 mb-6">
      <div class="border rounded-lg p-4">
        <h4 class="font-semibold text-gray-800 mb-2">Cloudflare</h4>
        <ul class="text-sm text-gray-600 space-y-1">
          <li>Go to DNS → Records</li>
          <li>Add A/CNAME records as above</li>
          <li>Set Proxy status to "DNS only" (gray cloud)</li>
        </ul>
      </div>

      <div class="border rounded-lg p-4">
        <h4 class="font-semibold text-gray-800 mb-2">Namecheap</h4>
        <ul class="text-sm text-gray-600 space-y-1">
          <li>Go to Advanced DNS</li>
          <li>Add A/CNAME records</li>
          <li>TTL can be set to Automatic</li>
        </ul>
      </div>

      <div class="border rounded-lg p-4">
        <h4 class="font-semibold text-gray-800 mb-2">GoDaddy</h4>
        <ul class="text-sm text-gray-600 space-y-1">
          <li>Go to DNS → Manage Zones</li>
          <li>Add A/CNAME records</li>
          <li>Use @ for apex domain</li>
        </ul>
      </div>

      <div class="border rounded-lg p-4">
        <h4 class="font-semibold text-gray-800 mb-2">Route 53 (AWS)</h4>
        <ul class="text-sm text-gray-600 space-y-1">
          <li>Go to Hosted Zones</li>
          <li>Create A/CNAME records</li>
          <li>Use root domain for Name field</li>
        </ul>
      </div>
    </div>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Step 4: Verify DNS Configuration</h2>

    <ol class="list-decimal list-inside space-y-3 mb-6">
      <li class="text-gray-700">Visit your domain to confirm it loads your GitHub Pages site</li>
      <li class="text-gray-700">Wait for DNS propagation (can take up to 24 hours, usually much faster)</li>
      <li class="text-gray-700">If needed check DNS propagation at <a href="https://www.whatsmydns.net/" target="_blank" class="text-blue-600 hover:text-blue-800">whatsmydns.net</a></li>
    </ol>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Step 5: Enable HTTPS (After DNS is Working)</h2>

    <div class="bg-green-50 border-l-4 border-green-400 p-4 mb-4">
      <p class="text-green-700">
        <strong>Only proceed with this step after your domain is successfully loading your GitHub Pages site.</strong>
      </p>
    </div>

    <ol class="list-decimal list-inside space-y-3 mb-6">
      <li class="text-gray-700">Return to your repository's <strong>Settings</strong> → <strong>Pages</strong></li>
      <li class="text-gray-700"><strong>Refresh the page</strong> to update the DNS check status</li>
      <li class="text-gray-700">Verify that GitHub shows "DNS check successful" or similar confirmation</li>
      <li class="text-gray-700">Now check <strong>"Enforce HTTPS"</strong></li>
      <li class="text-gray-700">Click <strong>Save</strong></li>
      <li class="text-gray-700">Wait for SSL certificate provisioning (can take several hours)</li>
      <li class="text-gray-700">Verify HTTPS is working by visiting your site and checking for the padlock icon</li>
    </ol>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Troubleshooting</h2>

    <div class="space-y-4">
      <div class="bg-yellow-50 border-l-4 border-yellow-400 p-4">
        <h4 class="font-semibold text-yellow-800 mb-2">Site not loading?</h4>
        <ul class="text-yellow-700 text-sm space-y-1">
          <li>Check that DNS records are correct</li>
          <li>Wait for DNS propagation (up to 24 hours)</li>
          <li>Verify the CNAME file exists in your repository</li>
        </ul>
      </div>

      <div class="bg-red-50 border-l-4 border-red-400 p-4">
        <h4 class="font-semibold text-red-800 mb-2">HTTPS not working?</h4>
        <ul class="text-red-700 text-sm space-y-1">
          <li>Ensure "Enforce HTTPS" is enabled in GitHub Pages settings</li>
          <li>Wait for SSL certificate provisioning (can take several hours)</li>
          <li>Try disabling and re-enabling "Enforce HTTPS"</li>
        </ul>
      </div>
    </div>

    <h2 class="text-2xl font-bold text-gray-900 mt-8 mb-4">Testing Commands</h2>

    <p class="text-gray-600 mb-3">Use these commands to test your DNS configuration:</p>

    <div class="bg-gray-900 text-gray-100 p-4 rounded-lg mb-4">
      <pre class="text-sm"><code># Check A records
dig yourdomain.com A

# Check CNAME records  
dig www.yourdomain.com CNAME

# Check from specific DNS server
dig @8.8.8.8 yourdomain.com A</code></pre>
    </div>

    <div class="bg-green-50 border-l-4 border-green-400 p-4 mt-6">
      <p class="text-green-700">
        <strong>Success!</strong> Once configured properly, your custom domain will point to your GitHub Pages site with HTTPS enabled automatically.
      </p>
    </div>
  </div>
</div>