# Claude Code Development Notes

This file tracks development decisions, patterns, and conventions for this Jekyll site.

## Include File Architecture

### Overview
The site uses a modular include file structure that separates theme-specific components from site-specific customizations.

### File Structure
```
_includes/
├── head.html           → custom-head.html
├── header.html         → custom-header.html  
└── footer.html         → custom-footer.html
```

### Theme vs. Custom Content Division

#### Theme Files (Reusable/Portable)
**`head.html`:**
- Tailwind CSS CDN and configuration
- Highlight.js syntax highlighting setup
- Responsive viewport meta tags
- Jekyll SEO and feed meta tags
- Core fonts (JetBrains Mono, Inter)
- Standard Jekyll integrations

**`header.html`:**
- Responsive navigation structure
- Mobile hamburger menu with JavaScript
- Dropdown menu functionality
- Tailwind utility classes for layout
- Navigation component architecture

**`footer.html`:**
- Responsive grid layout
- RSS feed integration
- Social media hooks
- Standard author/contact patterns

#### Custom Files (Site-Specific)
**`custom-head.html`:**
- Google Analytics (moved from head.html)
- Site-specific meta tags
- Custom favicons
- Additional tracking codes
- Site-specific fonts/styling

**`custom-header.html`:**
- Site announcements
- Additional navigation items
- Search functionality
- Custom branding elements

**`custom-footer.html`:**
- Copyright notices
- Privacy/terms links
- Newsletter signup
- Legal disclaimers
- Additional contact info

### Usage Guidelines
1. **Keep theme files portable** - Avoid site-specific content
2. **Use custom files for personalization** - Analytics, branding, site-specific features
3. **Maintain consistent patterns** - Each major section has theme + custom pair
4. **Document customizations** - Add comments explaining site-specific additions

This architecture allows for easy theme updates while preserving site customizations.