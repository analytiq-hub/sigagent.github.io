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
p(y; \eta) = b(y) e^{\eta^T \cdot T(y) - a(\eta)}
\end{align*}
$$

- $$T(y)$$ is called the _sufficient statistics_
- $$\eta$$ is the _natural_ or _canonical_ parameter.
- Both $$T(y)$$ and $$\eta$$ are column vectors in $$\mathbb{R}^n$$.
- Usually $$T(y) = y$$.
- $$a(\eta)$$ is called the _log partition_ function, or the _cumulant_ function. 


As we vary $$\eta$$ with fixed $$a, b, T$$ we get a family of distributions parametrized by the canonical parameter $$\eta$$.

## The Bernoulli distribution is in the exponential family

The Bernoulli distribution with mean $$\phi$$ is

$$
\begin{align*}
Bernoulli(y; \phi) &= \phi^y \cdot (1-\phi)^{1-y} \\
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

## The Gaussian distribution is in the exponential family

The Gaussian distribution with mean $$\mu$$ and variance $$\sigma^2$$ is

$$
\begin{align*}
\mathcal{N}(y; \mu, \sigma^2) &= \frac{1}{\sigma \sqrt{2 \pi}} e^{-\frac{1}{2}(\frac{y-\mu}{\sigma})^2} \\
                         &= \frac{1}{\sigma \sqrt{2 \pi}} e^{\left[-\frac{1}{2\sigma^2}, \frac{\mu}{\sigma}\right][y^2, y] - a(\eta)}
\end{align*}
$$

where we define the canonical parameter $$\eta = \left[-\frac{1}{2\sigma^2}, \frac{\mu}{\sigma}\right]$$, and we define the log partition function $$a(\eta)$$ such that the distribution integrates over $$y$$ to 1.

Similarly, the multivariate Gaussian is in the exponential family.

## The Poisson distribution is in the exponential family

The Poisson distribution with mean and variance $$\lambda$$ is

$$
\begin{align*}
Poisson(k ; \lambda) &= \frac{\lambda^k}{k!} e^{-\lambda} \\
                     &= \frac{1}{k!} e^{ k \ln \lambda - \lambda}
\end{align*}
$$

where we define

$$
\begin{align*}
\eta &= \ln \lambda \\
T(k) &= k \\
a(\eta) &= \eta \\
b(k) &= \frac{1}{k!} \\
\end{align*}
$$

## The Gamma distribution is in the exponential family

The Gamma distribution generalizes the Poisson distribution, and is defined as:

$$
\begin{align*}
Gamma(x; \alpha, \beta) &= \frac{x^{\alpha-1} e^{-\beta x} \beta^\alpha}{\Gamma(\alpha)}
\end{align*}
$$

for $$\alpha, \beta \gt 0$$. The $$\Gamma(a)$$ function extends the factorial - for natural numbers $$a$$, we have $$\Gamma(a) = (a-1)!$$.





