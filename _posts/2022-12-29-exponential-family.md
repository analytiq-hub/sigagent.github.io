---
title: "The Exponential Family"
categories: probabilities staristics
author:
- Andrei Radulescu-Banu
layout: post
mathjax: true
---

A distribution is in the _exponential family_ if it is of the form

$$
\begin{align*}
p(y, \nu) = b(y) e^{\nu^T \cdot T(y) - a(\nu)}
\end{align*}
$$

Here $$T(y)$$, the _sufficient statistics_. and $$\nu$$, the _natural_ or _canonical_ parameter, are column vectors in $$\mathbb{R}^n$$. $$a(\nu)$$ is the _log partition_ function.

Usually $$T(y) = y$$.

As we vary $$\nu$$ with fixed $$a, b, T$$ we het a family of distributions parametrized by the canonical parameter $$\nu$$.

## The Bernoulli distribution as exponential family
