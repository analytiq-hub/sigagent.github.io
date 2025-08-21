---
description: Create a new Jekyll blog post with proper front matter and structure
allowed-tools: [Write, Read, Bash, WebSearch, WebFetch, Grep, Glob, TodoWrite]
---

Create a new Jekyll blog post with the title "$ARGUMENTS".

Please:

1. **Generate the filename** using the current date and a URL-friendly slug from the title
2. **Create the blog post file** in the `_posts/` directory with:
   - Proper Jekyll front matter (layout: post, title, date, categories)
   - Add `mathjax: true` if the topic might benefit from mathematical expressions
   - Include appropriate categories based on the topic (choose from: tech, programming, webdev, jekyll, tailwind, ai, tutorials, reviews)
3. **Structure the content** with:
   - An engaging introduction (start directly with content, NO title repetition)
   - Clear section headings using ## and ###
   - Placeholder content that matches the style of other posts on bitdribble.github.io
   - A conclusion
   - DO NOT include the title as an H1 in the markdown body (Jekyll layouts handle this)
4. **Add relevant code examples** if the topic is technical
5. **Use Tailwind CSS** for any custom HTML layouts if needed
6. **Follow the writing style** of existing posts - technical but accessible, with practical examples

After creating the file, open it for editing and provide suggestions for the content structure and key points to cover.

Example usage: `/new-blog Understanding Quantum Computing Basics`