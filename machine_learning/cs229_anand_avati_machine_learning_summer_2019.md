---
layout: page
title: CS229 Machine Learning
mathjax: true
---

* CS229 Machine Learning
  * Andrew Ng, Fall 2018 [video](https://www.youtube.com/playlist?list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU), [slides](http://cs229.stanford.edu/syllabus-autumn2018.html)
  * Anand Avati, Summer 2019 [video](https://www.youtube.com/playlist?list=PLoROMvodv4rNH7qL6-efu_q2_bPuy0adh), [slides](http://cs229.stanford.edu/syllabus-summer2019.html)

Andrei's notes:

2018
* [L3](https://www.youtube.com/watch?v=het9HFqo1TQ)
  * Locally Weighted Regression
  * Parametric vs NonParametric Learning Algos
  * Maximum Likelihood Estimation for Linear Regression assuming IID errors implies minimizing Square Error
  * Logistic Regression
  * Newton's Method: quicker iteration than gradient ascent
* [L4](https://www.youtube.com/watch?v=iZTeva0WSTQ&list=RDCMUCBa5G_ESCn8Yd4vw5U-gIcg&index=2)
  * Perceptron
  * Exponential Family
    * See Berkeley 260 Lecture Notes, [Chap 8](https://people.eecs.berkeley.edu/~jordan/courses/260-spring10/other-readings/chapter8.pdf) for
      * Exponential family
      * What is $$A(\nu)$$ term for multinomial distribution written as exponential family
  * Generalized Linear Model
* [L5](https://www.youtube.com/watch?v=nt63k3bfXS0&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU&index=5)
  * Generative vs Discriminative Algorithms
  * Gaussian Distributed Analysis (GDA)
    * Comparison with Logistic Regression
  * Naive Bayes
  * Class Notes
    * [Generative Learning algorithms](http://cs229.stanford.edu/summer2019/cs229-notes2.pdf)

2019
* [L19](https://www.youtube.com/watch?v=i6d5QTmPXiw&list=PLoROMvodv4rNH7qL6-efu_q2_bPuy0adh&index=19)
  * Topics
    * Definition of KL-Divergence: $$D_{KL}(P \vert\vert Q) = \sum_x P(x) log \frac{P(X)}{Q(X)} = \mathbb{E}_P [log \frac{P}{Q} ]$$
    * Definition of Entropy: $$H(P) = - \sum_x P(x) log P(x) = \mathbb{E}_P [ log \frac{1}{P}]$$
    * Definition of Cross Entropy $$H(P,Q)== - \sum_x P(x) log Q(x) = \mathbb{E}_P [ log \frac{1}{Q}]$$
    * $$D_{KL}(P \vert\vert Q) = H(P,Q) - H(P)$$
    * Maximum Entropy and Exponential Family
      * Exponential Family: $$f(y \vert \nu) = h(y) e^{\nu . T(y) - a(\nu)}$$
      * Maximum Likelyhood Estimate (MLE) of Exponential Family: obtained when gradient $$\nabla_\nu$$ of distribution is zero. By calculation, this is when $$a^\prime(\nu) = \frac{1}{n} \sum_{i=1, ..., n} T(y^{(i)})$$
      * Maximum Entropy Principle
        * We want to estimate prob density $$p(y)$$, with max entropy, given $$m$$ constraints $$\sum_i T_j(y_i)p(y_i) = c_j$$
        * By convention, $$p(y_i)$$ is denoted $$p_i$$ (vector notation)
        * Typically want $$T_j(y)=y^k$$, the $$k$$-th momentum
        * $$p$$ will turn out to be the exponential family
        * Most times, $$c_j$$ arises from observed data $$c_j = \frac{1}{n} \sum_i Tj(y_i)p_i$$
        * Solve using Lagrangian $$\mathcal{L}(p, \eta, \lambda) = H(p) + <\eta, Tp-c> + \lambda(<1, p>-1)$$, zeroing the partial derivative with respect to $$p_i$$ for all $$i$$.
    * KL-Divergence
    * Calibration and Proper Scoring Rules
  * Class notes
    * [Max Entropy](http://cs229.stanford.edu/summer2019/MaxEnt.pdf)
  * References
     * Wikipedia: [Principle of maximum entropy](https://en.wikipedia.org/wiki/Principle_of_maximum_entropy)
* [L20](https://www.youtube.com/watch?v=-TPFg-RG-KY&list=PLoROMvodv4rNH7qL6-efu_q2_bPuy0adh&index=20)
  * Variational Inference
  * EM Variants
  * Variational Autoencoder
  * Class notes
    * [VAE (Sec 4)](http://cs229.stanford.edu/summer2019/cs229-notes8.pdf)
  * References
    * Wikipedia: [Feature Learning](https://en.wikipedia.org/wiki/Feature_learning)

