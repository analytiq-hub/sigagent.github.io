---
layout: page
mathjax: true
title: Yann LeCun - CDS Machine Learning Course
---
Notes on [Deep Learning Course at CDS](https://cds.nyu.edu/deep-learning/)
* [05L - Joint embedding method and latent variable energy based models (LV-EBMs)](https://www.youtube.com/watch?v=xIn-Czj1g2Q)
  * Energy based models (EBM) vs Discriminative models
    * Energy $$F(x, y)$$, where $$x$$ is observed variable, and we'd like to predict variable $$y$$.
    * Find $$y(x)=argmin_y F(x, y)$$ (energy is minimized)
    * Choice of energy function does not matter if minimum is achieved for same value $$y$$. For example, if we add a constant to $$F$$, the minimum does not change.
    * Can compute if $$y$$ is discrete, or if there is a dynamic-programming-style way to compute $$y$$
    * If $$F$$ is a smooth function of $$y$$, can use gradient descent
  * Factor Graphs
  * Conditional EBM: $$F(x, y)$$ has conditional variable $$x$$
  * Unconditional EBM: $$F(y)$$. Here, $$x$ does not exist.
    * PCA
    * k-means clustering
    * Any unsupervised algorithm can be cast as unconditional EBM
