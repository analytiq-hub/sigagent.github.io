---
layout: post
mathjax: true
categories: math
title: "Gradient. Curl. Divergence."
---
In [Lecture 9](https://www.youtube.com/watch?v=WJn6h-6MMa8&list=PL47F408D36D4CF129&index=9), Leonard Susskind reviews gradient, curl and divergence. He says that the curl of a gradient is zero; and, furthermore, if the curl of a vector field is 0, then that vector field is a gradient.

Why is that?

The [wiki page for curl](https://en.wikipedia.org/wiki/Curl_(mathematics)#cite_note-8) explains this indirectly. Let's spell this out.

Gradient is defined for functions $$f \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ as $$\nabla f = (f_x, f_y, f_z)$$, which is a vector field on $$\mathbb{R}^3$$.

The operator $$\nabla$$ is called *nabla*, or, abbreviated, *del*, and is written as an upside-down triangle. The gradient is intepreted as the direction and rate of fastest increase.

Another way to write it is $$\nabla f = (\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z})$$.