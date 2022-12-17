---
layout: page
title: CS229 Machine Learning
mathjax: true
---

* CS229 Machine Learning, Anand Avati, Summer 2019
* Course [video, slides](http://cs229.stanford.edu/syllabus-summer2019.html)

Course notes:
* [L19](https://www.youtube.com/watch?v=i6d5QTmPXiw&list=PLoROMvodv4rNH7qL6-efu_q2_bPuy0adh&index=19)
  * Topics
    * Maximum Entropy and Exponential Family
      * Exponential Family: $$f(y \vert \nu) = h(y) e^{\nu . T(y) - a(\nu)}$$
      * Maximum Likelyhood Estimate (MLE) of Exponential Family: obtained when gradient $$\nabla_\nu$$ of distribution is zero. By calculation, this is when $$a^\prime(\nu) = \frac{1}{n} \sum_{i=1, ..., n} T(y^{(i)})$$
    * KL-Divergence
    * Calibration and Proper Scoring Rules
  * Class notes
    * [Max Entropy](http://cs229.stanford.edu/summer2019/MaxEnt.pdf)

