---
layout: post
title: "How to create commands in Claude Code for Jekyll-Tailwind projects"
date: 2025-08-21
categories: [tech, programming, jekyll, tailwind, ai]
mathjax: false
---

# How to create commands in Claude Code for Jekyll-Tailwind projects

## Introduction

Working with Jekyll and Tailwind CSS can involve repetitive tasks like creating new blog posts, setting up proper front matter, and ensuring consistent formatting. Claude Code's custom command system provides an elegant solution to streamline these workflows by creating project-specific automation that understands your Jekyll structure and Tailwind styling.

In this post, I'll show you how to create powerful Claude Code commands that can accelerate your Jekyll-Tailwind development workflow, using real examples from my own blogging setup.

## Understanding Claude Code Commands

Claude Code commands are custom prompts saved as Markdown files that can be executed during interactive sessions. They come in two flavors:

### Project Commands vs Personal Commands

**Project Commands** (`.claude/commands/`)
- Stored in your project repository
- Shared with team members through version control
- Perfect for project-specific workflows
- Shown with "(project)" in the help menu

**Personal Commands** (`~/.claude/commands/`)
- Stored in your home directory
- Available across all your projects
- Great for general-purpose utilities
- Shown with "(user)" in the help menu

### Command Features

Claude Code commands support several powerful features:

- **Arguments**: Use `$ARGUMENTS` placeholder to pass parameters
- **Tool permissions**: Specify `allowed-tools` in frontmatter
- **File references**: Include context with `@filename` syntax
- **Bash execution**: Run shell commands with `!` prefix
- **Metadata**: Add descriptions and model preferences

## Creating Your First Jekyll Blog Command

Let's create a command that generates new blog posts with proper Jekyll front matter and structure.

### Step 1: Set up the commands directory

```bash
mkdir -p .claude/commands
```

### Step 2: Create the blog post command

Create `.claude/commands/new-blog.md`:

```markdown
---
description: Create a new Jekyll blog post with proper front matter and structure
allowed-tools: [Write, Read, Bash]
---

Create a new Jekyll blog post with the title "$ARGUMENTS".

Please:

1. **Generate the filename** using the current date and a URL-friendly slug from the title
2. **Create the blog post file** in the `_posts/` directory with:
   - Proper Jekyll front matter (layout: post, title, date, categories)
   - Add `mathjax: true` if the topic might benefit from mathematical expressions
   - Include appropriate categories based on the topic
3. **Structure the content** with:
   - An engaging introduction
   - Clear section headings
   - Placeholder content that matches the style of other posts
   - A conclusion
4. **Add relevant code examples** if the topic is technical
5. **Use Tailwind CSS** for any custom HTML layouts if needed

After creating the file, open it for editing and provide suggestions for the content structure.
```

### Step 3: Using the command

Now you can create new blog posts with:

```
/new-blog Understanding Quantum Computing Basics
```

The command will generate a properly formatted Jekyll post with appropriate front matter, categories, and structure.

## Advanced Jekyll-Tailwind Commands

Here are some additional commands that can supercharge your Jekyll-Tailwind workflow:

### Preview and Validate Posts

`.claude/commands/check-post.md`:

```markdown
---
description: Validate the latest blog post for common issues
allowed-tools: [Read, Grep, Bash]
---

Check the most recent blog post in `_posts/` for:

1. **Front matter validation**
   - Required fields (layout, title, date)
   - Category consistency
   - MathJax configuration

2. **Content quality**
   - Heading structure (H1, H2, H3)
   - Code block formatting
   - Internal link validation
   - Image references

3. **Tailwind CSS usage**
   - Proper utility class syntax
   - Responsive design patterns
   - Accessibility considerations

Provide a checklist of issues found and suggestions for improvement.
```

### Component Generator

`.claude/commands/new-component.md`:

```markdown
---
description: Create a reusable Tailwind component for Jekyll
allowed-tools: [Write, Read]
---

Create a new Tailwind CSS component with the name "$ARGUMENTS".

Generate:

1. **HTML structure** in `_includes/components/`
2. **Usage documentation** with examples
3. **Responsive behavior** using Tailwind utilities
4. **Accessibility features** (ARIA labels, semantic HTML)
5. **Integration guide** for Jekyll layouts

Example: `/new-component blog-card`
```

### Development Workflow Commands

`.claude/commands/dev-setup.md`:

```markdown
---
description: Set up the Jekyll-Tailwind development environment
allowed-tools: [Bash, Read]
---

Prepare the development environment by:

1. **Checking dependencies**
   - Ruby and Jekyll installation
   - Tailwind CLI availability
   - Bundle status

2. **Starting development servers**
   - Run `make dev` or equivalent
   - Check for port conflicts
   - Verify live reload functionality

3. **Validating configuration**
   - Tailwind config paths
   - Jekyll configuration
   - Asset pipeline setup

Provide troubleshooting steps if any issues are detected.
```

## Best Practices for Jekyll-Tailwind Commands

### 1. Make Commands Context-Aware

Your commands should understand your project structure:

```markdown
Before creating a post, check existing categories in @_posts/ and suggest relevant ones based on the title.
```

### 2. Include Quality Checks

Build validation into your commands:

```markdown
After creating the post, validate the front matter format and check for required fields.
```

### 3. Provide Examples and Documentation

Include usage examples in your command descriptions:

```markdown
Example usage: 
- `/new-blog Building REST APIs with Node.js`
- `/new-blog CSS Grid vs Flexbox Comparison`
```

### 4. Leverage Tailwind Patterns

Commands should promote consistent Tailwind usage:

```markdown
When adding HTML layouts, use established Tailwind patterns:
- `grid md:grid-cols-2 gap-8` for two-column layouts
- `prose prose-lg max-w-none` for content areas
- `bg-white rounded-lg shadow-lg p-8` for card components
```

## Organizing Your Command Library

As your command collection grows, organize them logically:

```
.claude/commands/
├── content/
│   ├── new-blog.md
│   ├── new-page.md
│   └── check-post.md
├── development/
│   ├── dev-setup.md
│   ├── build-check.md
│   └── deploy-preview.md
└── components/
    ├── new-component.md
    ├── test-component.md
    └── document-component.md
```

## Integration with Existing Workflows

Claude Code commands work beautifully with your existing Jekyll-Tailwind setup:

### Makefile Integration

Commands can trigger your existing Make targets:

```markdown
After creating the blog post, run `!make dev` to start the development server and preview the new post.
```

### Git Workflow

Commands can include version control steps:

```markdown
After validating the post, suggest appropriate git commit messages and staging commands.
```

### Deployment Pipeline

Commands can check deployment readiness:

```markdown
Before suggesting publication, verify:
- All images are optimized and properly referenced
- Internal links resolve correctly
- Tailwind classes are being used efficiently
```

## Conclusion

Claude Code commands transform Jekyll-Tailwind development from a series of manual steps into a streamlined, intelligent workflow. By creating project-specific commands that understand your structure, styling patterns, and quality requirements, you can:

- **Accelerate content creation** with automated post generation
- **Maintain consistency** across your blog posts and pages
- **Reduce errors** through built-in validation and checks
- **Share workflows** with team members through version control

The key is starting simple with basic commands like `new-blog`, then gradually building more sophisticated automation as you identify repetitive patterns in your workflow.

Start by creating a few essential commands for your most common tasks, and you'll quickly discover how much time and mental overhead they save in your Jekyll-Tailwind projects.

---

*Want to see more Jekyll and Tailwind tips? Check out my other posts on [building modern static sites](https://bitdribble.github.io) and [AI-assisted development workflows](https://bitdribble.github.io).*