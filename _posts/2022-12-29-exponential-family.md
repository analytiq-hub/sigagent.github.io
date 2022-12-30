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
p(y, \eta) = b(y) e^{\eta^T \cdot T(y) - a(\eta)}
\end{align*}
$$

Here $$T(y)$$, the _sufficient statistics_. and $$\eta$$, the _natural_ or _canonical_ parameter, are column vectors in $$\mathbb{R}^n$$. $$a(\eta)$$ is the _log partition_ function.

Usually $$T(y) = y$$.

As we vary $$\eta$$ with fixed $$a, b, T$$ we het a family of distributions parametrized by the canonical parameter $$\eta$$.

## The Bernoulli distribution as exponential family

The Bernoulli distribution with mean $$\phi$$ is

$$
\begin{align*}
Bernoulli(y \vert \phi) &= \phi^y \cdot (1-\phi)^{1-y} \\
                        &= e^{y \ln \phi + (1-y) ln (1-\phi)} \\
                        &= e^{(\ln \frac{\phi}{1-\phi}) y + \ln(1-\phi)}
\end{align*}
$$

We get the exponential family form with

$$
\begin{align*}
\eta    &= \ln \frac{\phi}{1-\phi} & \iff & \phi = \frac{e^\eta}{1+ e^\eta} \\
b(y)    &= 1 \\
T(y)    &= y \\
a(\eta) &= \ln(1+e^\eta)
\end{align*}
$$

## The Gaussian distribution as exponential family

The Gaussian distribution with mean $$\mu$$ and variance $$\sigma^2$$ is

$$
\begin{align*}
p(y \vert \mu, \sigma^2) &= \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{1}{2}(\frac{y-\mu}{\sigma})^2} \\
                         &= \frac{1}{\sigma \sqrt{2 \pi}} e^{[-\frac{1}{2\sigma^2}, \frac{\mu}{\sigma}][y^2, y] - a(\eta)}
\end{align*}
$$

where we define $$\eta = \left[-\frac{1}{2\sigma^2}, \frac{\mu}{\sigma}\right]$$ and define the log partition function $$a(\eta)$$ to ensure the distribution integrates over $$y$$ to 1.



