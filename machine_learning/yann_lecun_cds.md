---
layout: page
mathjax: true
title: Yann LeCun - CDS Machine Learning Course
---
Notes on [Deep Learning Course at CDS](https://cds.nyu.edu/deep-learning/)

#### [05L - Joint embedding method and latent variable energy based models (LV-EBMs)](https://www.youtube.com/watch?v=xIn-Czj1g2Q)
  * Energy based models (EBM) vs Discriminative models
    * Energy $$F(x, y)$$, where $$x$$ is observed variable, and we'd like to predict variable $$y$$.
    * Find $$y(x)=argmin_y F(x, y)$$ (energy is minimized)
    * Choice of energy function does not matter if minimum is achieved for same value $$y$$. For example, if we add a constant to $$F$$, the minimum does not change.
    * Can compute if $$y$$ is discrete, or if there is a dynamic-programming-style way to compute $$y$$
    * If $$F$$ is a smooth function of $$y$$, can use gradient descent

<p align="center">
<img src="/machine_learning/diagrams/energy_model.drawio.png" width="50%" height="50%"/>
</p>

  * Factor Graphs
  * Conditional EBM: $$F(x, y)$$ has conditional variable $$x$$
  * Unconditional EBM: $$F(y)$$. Here, $$x$ does not exist.
    * PCA
    * k-means clustering
    * Any unsupervised algorithm can be cast as unconditional EBM
  * Both $$x$$, $$y$$ are inputs to model $$F$$.
  * Connection to probabilistic models
    * Probabilistic models are special case of EBM
    * Energies are like un-normalized negative log probabilities
  * Why use EBM instead of probabilistic models?
    * EBM gives more flexibility in
      * Choice of scoring function
      * Choice of objective function for learning

From energy to probability: Gibbs-Boltzmann distribution

$$
\begin{align*}
P(y \vert x) = \frac{e^{-\beta F(x, y)}}{\int_{y'} e^{-\beta F(x, y')}}
\end{align*}
$$

* Softmax is an instance of the Gibbs-Boltzmann distribution
* You pick $$\beta$$, it is arbitrary
  * For physicists, this constant is aking to temperature.
* The exponential makes numbers positive. Gives high values to low energy (which is what you want - likely configurations have low energy)
* Denominator is normalization factor
* LeCun does not say it - but $$P(y \vert x)$$ can be seen as number of configurations with energy $$F(x, y)$$ (but normalized)
  * Compare with [Statistical mechanics - a set of lectures](https://www.amazon.com/Statistical-Mechanics-Lectures-Frontiers-Physics/dp/0201360764), R. Feynman (1981), 1st lecture where he derives Boltzmann's equation in statistical mechanics from properties of energy and temperature
* Energy function is like a cost we want to minimize
* Inference becomes optimization problem to find $$y$$

EBM architectures:
* Joint embeddings
* Variational models

<p align="center">
<img src="/machine_learning/diagrams/joint_embedding.drawio.png" width="25%" height="25%"/>
</p>

* In joint embedding, inputs can be both images.
  * $$G(y)$$ can be invariant to changes of luminosity, for example.
  * This means we get multiple values of $$y$$ with same $$h'$$.
  * Specific case: siamese nets, when $$F,G$$ are identical

<p align="center">
<img src="/machine_learning/diagrams/latent_models.drawio.png" width="50%" height="50%"/>
</p>

* General setup for latent variable: $$E(x, z, y$$ where $$z$$ latent
  * Find $$argmin_y argmin_z E(x, z, y$$
  * Can eliminate z replacing $$E$$ with free energy: $$F_\beta(x, y) = - \frac{1}{\beta} \log \int_z e^{- \beta E(x, y, z)} dz$$
    

* We use energy models when marginal probability in Gibbs-Boltzmann distribution is intractable