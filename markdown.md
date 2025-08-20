---
layout: page
title: Markdown Test Page
---

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6

## Text Formatting

This is a paragraph with **bold text**, *italic text*, and ***bold italic text***.

You can also use __bold__ and _italic_ formatting.

Here's some ~~strikethrough text~~.

Here's some `inline code` in a sentence.

Here's a paragraph with a line break.  
This line appears after a line break.

## Lists

### Unordered Lists
- Item 1
- Item 2
  - Nested item 2.1
  - Nested item 2.2
    - Deeply nested item 2.2.1
- Item 3

### Ordered Lists
1. First item
2. Second item
   1. Nested item 2.1
   2. Nested item 2.2
      1. Deeply nested item 2.2.1
3. Third item

### Mixed Lists
1. Ordered item
   - Unordered nested item
   - Another unordered nested item
2. Another ordered item

## Links and Images

[Link to Google](https://www.google.com)

[Link with title](https://www.google.com "Google Homepage")

[Internal link](/about)

[Reference link][1]

[1]: https://www.example.com "Example Website"

Auto-link: https://www.github.com

## Code Blocks

### Inline Code
Use `git status` to check repository status.

### Fenced Code Blocks

```javascript
function greet(name) {
    console.log(`Hello, ${name}!`);
}

greet("World");
```

```python
def fibonacci(n):
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

print(fibonacci(10))
```

```bash
#!/bin/bash
echo "Hello, World!"
ls -la
```

### Indented Code Block

    This is an indented code block
    It preserves whitespace
    And shows code formatting

## Blockquotes

> This is a blockquote.
> It can span multiple lines.

> This is a blockquote with **bold text** and *italic text*.

> ## Blockquote with heading
> 
> This blockquote contains a heading and multiple paragraphs.
> 
> - It can also contain lists
> - And other markdown elements

### Nested Blockquotes

> This is a blockquote.
> 
> > This is a nested blockquote.
> > It's indented further.
> 
> Back to the first level.

## Tables

| Header 1 | Header 2 | Header 3 |
|----------|----------|----------|
| Cell 1   | Cell 2   | Cell 3   |
| Cell 4   | Cell 5   | Cell 6   |
| **Bold** | *Italic* | `Code`   |

### Table with Alignment

| Left Aligned | Center Aligned | Right Aligned |
|:-------------|:--------------:|--------------:|
| Left         | Center         | Right         |
| Text         | Text           | Text          |
| More content | More content   | More content  |

## Horizontal Rules

---

***

___

## Task Lists

- [x] Completed task
- [ ] Incomplete task
- [x] Another completed task
  - [x] Nested completed task
  - [ ] Nested incomplete task

## Special Characters and Escaping

\*This text is not italic\*

\`This is not code\`

\# This is not a heading

## HTML Elements

<kbd>Ctrl</kbd> + <kbd>C</kbd>

<mark>Highlighted text</mark>

<sub>Subscript</sub> and <sup>Superscript</sup>

<details>
<summary>Click to expand</summary>

This content is hidden by default and can be expanded.

It can contain **markdown** too!

</details>

## Math (if MathJax is enabled)

Inline math: $E = mc^2$

Block math:

$$
\int_{-\infty}^{\infty} e^{-x^2} dx = \sqrt{\pi}
$$

Matrix:

$$
\begin{pmatrix}
a & b \\
c & d
\end{pmatrix}
$$

## Footnotes

Here's a sentence with a footnote[^1].

Here's another footnote[^note].

[^1]: This is the first footnote.
[^note]: This is a named footnote.

## Definition Lists

Term 1
: Definition 1

Term 2
: Definition 2a
: Definition 2b

## Abbreviations

*[HTML]: Hyper Text Markup Language
*[CSS]: Cascading Style Sheets

HTML and CSS are web technologies.

## Line Breaks and Spacing

This is the first paragraph.

This is the second paragraph with some space above.


This paragraph has extra space above it.

## Emphasis Combinations

**Bold text with *italic inside* it**

*Italic text with **bold inside** it*

***All bold and italic***

## Special Lists

### Checklist with Various States
- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] List syntax required (any unordered or ordered list supported)
- [x] This is a complete item
- [ ] This is an incomplete item

### Definition List Style
Apple
: A red fruit

Orange
: An orange fruit

## Edge Cases

### Empty Elements
- 
- Item with content
- 

### URLs and Emails
Contact: email@example.com
Website: https://example.com

### Long Lines
This is a very long line that should wrap properly in the browser and demonstrate how the markdown renderer handles text that exceeds the normal line length and needs to be wrapped to fit within the content area.

## Conclusion

This markdown test file contains most standard markdown elements to verify proper rendering and styling.