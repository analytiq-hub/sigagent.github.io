---
description: Create a new Jekyll blog post with proper front matter and structure
allowed-tools: [Write, Read, Bash, Grep, Glob]
---

Create a new Jekyll blog post with the title "$ARGUMENTS".

Please:

1. **Generate the filename** using the current date and a URL-friendly slug from the title
2. **Create the blog post file** in the `_posts/` directory with:
   - Proper Jekyll front matter (layout: post, title, date, categories)
   - Add `mathjax: true` if the topic might benefit from mathematical expressions
   - Include appropriate categories based on the topic (choose from: tech, programming, webdev, jekyll, tailwind, ai, tutorials, reviews)
3. **Do not create content** beyond the yaml header
5. **Use Tailwind CSS** for any custom HTML layouts if needed
6. **Follow the writing style** of existing posts

Example usage: `/new-blog Understanding Quantum Computing Basics`