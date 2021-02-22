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

A sequence $$(x_n)_{n >= 0}$$ converges to limit $$x$$ if, for any $$\epsilon > 0$$, there exists $$n_0$$ such that, for any $$n \ge n_0$$, we have $$x - \epsilon < x_n < x + \epsilon$$. We write

$$
\begin{align}
\underset{n \rightarrow \infty}{lim} \, x_n = x
\end{align}
$$

A sequence has the *Cauchy property* if for any $$\epsilon > 0$$ there exists $$n_0$$ such that for any $$n, n' \ge n_0$$ we have $$\vert x_n - x_{n'} \vert \lt \epsilon$$, in other words, if $$\underset{n, n' \rightarrow \infty}{lim} \, (x_n - x_{n'}) = 0$$.

A sequence has the Cauchy property if and only if it is covergent.

Similarly, a series $$\sum_{n = 0}^N x_n$$ is convergent, by definition, if $$\underset{N \rightarrow \infty}{lim} \, \sum_{n = 0}^N x_n$$ exists, in which case, the limit of the series is denoted $$\sum_{n = 0}^\infty x_n$$.

The Cauchy property of the series can be written as: for any $$\epsilon > 0$$ there exists $$n_0 \ge 0$$ such that for any $$n_0 \le n \le n'$$ we have $$\vert x_n + ... + x_{n'} \vert \lt \epsilon$$.

Since the series is a sequence, a series has the Cauchy property if and only if it is convergent.

## Convergence for Return of a Trajectory

When MDP returns are bounded $$-M \lt r_t \lt M$$ for all $$t \ge 0$$, and the discount factor $$\gamma \in [0, 1)$$, the return of a trajectory $$r_1 + \gamma r_2 + ... + \gamma^{t-1}r_t$$ has the Cauchy property because
$$
\begin{align}
\underset{n, n' \rightarrow \infty}{lim} \, \vert \sum_{t=n}^{n'} \gamma^{t-1} r_t\vert\le  \underset{n, n' \rightarrow \infty}{lim} \, (\sum_{t=n}^{n'} \gamma^{t-1} M) \le \underset{n, n' \rightarrow \infty}{lim} \, (\gamma^{n-1} \frac{M}{1-\gamma}) = 0
\end{align}
$$

This means that, for an infinite state-action-reward trajectory

$$
\begin{align}
\overline{\tau} = (s_0, a_0, r_1, ... , s_{T-1}, a_{T-1}, r_T, s_T)
\end{align}
$$

the return of the trajectory $$r(\overline{\tau}) = \sum_{t=0}^{\infty} \gamma^{t-1} r_t$$ is convergent (and, in fact, uniformly convergent for any choice of trajectory $$\overline{\tau}$$, meaning that for any $$\epsilon > 0$$ the choice of $$n_0$$ such that for any $$n_0 \le t \le t'$$ we have $$\vert \gamma^{t-1} r_t + ... + \gamma^{t'-1} r_{t'} \vert \lt \epsilon$$ is independent of the trajectory $$\overline{\tau}$$).