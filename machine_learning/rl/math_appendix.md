---
layout: post
mathjax: true
title: Math Appendix to Reinforcement Learning
author:
- Andrei Radulescu-Banu
---

This post is part of a [Series dealing with Reinforcement Learning](/machine_learning/rl/introduction_to_reinforcement_learning).

## Probability sample, Expected value

In general, if $$p$$ is a probability distribution, we denote $$x \sim p$$ for a sample selected with that probability. The expectation of a function $$f(x)$$ over a probability density $$p(x)$$ is defined as

$$
\begin{align}
\mathbb{E}_p (f) = \int_{x \sim p} f(x) p(x) dx
\end{align}
$$

In most examples, the sample space for $$x$$ is finite, in which case the integral $$\int$$ becomes a sum $$\sum$$.

## Convergence

A sequence $$(x_n)_{n >= 0}$$ converges to a limit $$x$$ (we write: $$\underline{n \rightarrow \infty}{lim \, x_n} = x$$), by definition, if for any $$\eps > 0$$ there exists $$n_0$$ such that for any $$n \ge n_0$$ we have $$x - \eps < x_n < x + \eps$$.