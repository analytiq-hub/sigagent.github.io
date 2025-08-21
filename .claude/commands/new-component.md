---
description: Create a reusable Tailwind component for Jekyll that can be used in markdown files
allowed-tools: [Write, Read, Bash, WebSearch, WebFetch, Grep, Glob]
---

Create a new Tailwind CSS component based on "$ARGUMENTS" that can be integrated into Jekyll markdown files.

Please:

1. **Parse the arguments** to understand:
   - Component name (first word/phrase)
   - Additional description or context (everything after the name)
   - What type of component this should be (card, button, alert, layout, etc.)
   - Specific requirements mentioned in the description
   - Common use cases for this component
   - What props/parameters it might need

2. **Create the component file** in `_includes/components/` directory:
   - Use semantic HTML structure
   - Apply appropriate Tailwind utility classes
   - Make it responsive with mobile-first design
   - Include accessibility features (ARIA labels, semantic tags)
   - Support common variants (colors, sizes, states)

3. **Make it parameterizable** using Jekyll's Liquid templating:
   - Accept useful parameters via `include` statement
   - Provide sensible defaults
   - Support optional content blocks

4. **Create usage documentation** in the component file as HTML comments:
   - Show basic usage examples
   - Document all available parameters
   - Provide markdown integration examples
   - Include variant examples

5. **Follow design patterns** from existing site:
   - Use consistent color schemes (grays, blues, etc.)
   - Match typography scale and spacing
   - Use established shadow and border patterns
   - Ensure it works with prose styling

6. **Test integration** by showing how to use it in markdown:
   - Basic include syntax
   - Parameter passing examples
   - Integration with markdown content

Example usage: 
- `/new-component alert-box for warnings and notifications`
- `/new-component feature-card showcasing 3-column benefits with icons`
- `/new-component code-demo with syntax highlighting and copy button`
- `/new-component testimonial-quote with author photo and company logo`
- `/new-component step-by-step for tutorial workflows with numbered steps`