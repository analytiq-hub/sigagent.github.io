# Analytiq Hub Website

A Jekyll-based website with Tailwind CSS integration that powers [analytiq-hub.github.io](https://analytiq-hub.github.io).

## Overview

This is a Jekyll sandbox project that combines:
- **Jekyll** - Static site generator
- **Tailwind CSS** - Utility-first CSS framework
- **GitHub Pages** - Automated deployment

## Getting Started

- For complete development setup and workflow instructions, see [Local Development](http://analytiqhub.com/docs/local_development/).
- For DNS setup see [DNS Setup](http://analytiqhub.com/docs/dns_setup)

## Quick Start

```bash
# Install dependencies
make install

# Start development server
make dev

# Build for production
make build
```

## Site Structure

- `_posts/` - Blog posts and articles
- `_layouts/` - Page templates
- `_includes/` - Reusable components
- `assets/` - Static assets (CSS, JS, images)
- `case-studies/` - Case study pages

## Deployment

The site automatically deploys to GitHub Pages when changes are pushed to the main branch via GitHub Actions.