---
layout: page
mathjax: true
title: Gareth Tribello - MathNet - Statistics
---
Notes on [MathNet](http://gtribello.github.io/mathNET)

This is a multi-part post:
* [MathNet - Classical Thermodynamics](gareth_tribello_mathnet_classical_thermodynamics.md)
* [MathNet - Statistical Mechanics](gareth_tribello_mathnet_statistical_mechanics.md)
* [MathNet - Statistics](gareth_tribello_mathnet_statistics.md)

[Markov chains - Definition and Transition Matrix](http://gtribello.github.io/mathNET/markov-property-video.html)

[Markov chains - Chapman Kolmogorov relation](http://gtribello.github.io/mathNET/chapman-kolmogorov-video.html)
* Given a stationary Markov chain with transition matrix $$A$$, the transition matrix for going $$n$$ steps is $$A^n$$

[Markov chains - Transient and Recurrent states](http://gtribello.github.io/mathNET/transient-recurrent-video.html)
* Transient states are those where $$P(R_i \le \infty) \lt 1$$
* Recurrent states are those where $$P(R_i \le \infty) = 1$$
  * Here, $$R_i$$ is the number of steps it takes to return to state $$i$$,

[Ergodic Markov chains - Derivation of the Ergodic theorem](http://gtribello.github.io/mathNET/limiting-stationary-dist-video1.html)
* If all states are recurrent, then $$\lim_{n \rightarrow \infty} A^n$$ has identical rows.
  * The transition probabilities for all states in $$A^n$$, at the limit, settle to the same values
* A chain is ergodic if it has a limiting stationary distribution and if none of the elements of this distribution are zero
  * Ergodic Markov chains cannot have transient states
* Notation:
  * $$M_i(n)$$ is the number of visits to state $$i$$, $$n$$ is the number of steps in chain
  * $$T_i$$ is the return time to state $$i$$
* Ergodic Theorem:
  * $$\lim_{n \rightarrow \infty} \frac{M_i(n)}{n} = \frac{1}{\mathbb{E}(T_i)}$$, for recurrent states $$i$$
    * (Andrei) For some reason, Gareth changes notation $$R_i \rightarrow T_i$$
    * If the state $$i$$ is transient, then $$P(R_i \le \infty) \lt 1$$, and $$R_i$$ is not a proper random variable. So we can't compute $$\mathbb{E}(R_i)$$.

[Ergodic Markov chains - Why the limiting stationary distribution can be found from the principal left eigenvector of the transition matrix](http://gtribello.github.io/mathNET/limiting-stationary-dist-video2.html)

[Monte Carlo Simulation - Brief Introduction](http://gtribello.github.io/mathNET/monte-carlo-video.html)

[Monte Carlo Simulation - Using Block Averages to Calculate the Statistical Error](http://gtribello.github.io/mathNET/block_averaging_video.html)

[Markov Chains in Continuous Time](http://gtribello.github.io/mathNET/continuous-time-markov.html)