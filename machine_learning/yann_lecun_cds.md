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

* General setup for latent variable: $$E(x, y, z)$$ where $$z$$ latent
  * Find $$argmin_y min_z E(x, y, z)$$
  * Can eliminate z replacing $$E$$ with free energy: $$F_\beta(x, y) = - \frac{1}{\beta} \log \int_z e^{- \beta E(x, y, z)} dz$$
  * When $$\beta=\infty$$, this becomes $$F_\infty(x, y) = min_z E(x, y, z)$$
  * Called free energy by physicists

* We use energy models when marginal probability in Gibbs-Boltzmann distribution is intractable
* We diminish our ambitions here! Use energy as fundamental underlying object.
* Where does energy come from?

$$
\begin{align*}
P(y, z \vert x) = \frac{e^{- \beta E(x, y, z)}}{\int_{y, z}e^{- \beta E(x, y, z)}dydz}
\end{align*}
$$

$$
\begin{align*}
P(y \vert x) &= \int_z P(y, z \vert x) \\
             &= \frac{\int_z e^{- \beta E(x, y, z)}dz}{\int_{y, z}e^{- \beta E(x, y, z)}dydz} \\
             &= \frac{e^{-\beta \left[ -\frac{1}{\beta}\ln \int_z e^{- \beta E(x, y, z)}dz\right]}} {\int_y e^{-\beta \left[ -\frac{1}{\beta}\ln \int_{z}e^{- \beta E(x, y, z)}dz\right]}dy} \\
             &= \frac{e^{-\beta F_\beta(x, y)}} {\int_y e^{-\beta F_\beta(x, y)}dy}
\end{align*}
$$

* That's where the free energy formula comes from.
* K-means as energy model
* Limiting the capacity of the latent variable $$z$$
  * k-means solves this by setting $$z$$ to be discrete
* Training EBM
  * Give it an architecture/energy function $$F(x, y)$$
  * For each datapoint $$(x[i], y[i])$$, tweak $$F$$ so energy is as small as possible
  * Then, we need the energy of other $$(x[i], y')$$ to be as large as possible
  * Keep $$F$$ smoothxs
  * Two methods:
    * Contrastive method: push down $$F(x[i], y[i])$$, push up other points $$F(x[i], y')$$
    * Regularized/Architectural methods: build $$F(x, y)$$ so that volume of low energy regions is minimized through regularization
  * _Contrastive_
    * C1: push down energy of data points, push up everything else
      * Max likelihood
    * C2: push down energy of data points, push up chosen locations
      * Max likelihood with MC/MMC/HMC
      * Contrastive divergence
      * Metric learning/Siamese nets
      * Ratio matching
      * Noise contrastive estimation
      * Min probability flow
      * Adversarial generation/GAM
    * C3: train a function that maps points off the data manifold to points on the data manifold:
      * Denoising autoencoder
      * Masked autoencoder (e.g. BERT)
  * _Regularized/Architectural_
    * A1: build the machine so the volume of low energy space is bounded:
      * PCA
      * K-means
      * Gaussian mixture model
      * Square ICA
      * Normalizing flows
    * A2: use a regularization term that measures the volume of space that has low energy:
      * Sparse coding
      * Sparse auto-encoder
      * LISTA
      * Variational auto-encoders
      * Discretization/VQ/VQVAE
    * A3: $$F(x, y)=C(y, G(x, y))$$, make $$G(x, y)$$ as "constant" as possible with respect to $$y$$
      * Contracting auto-encoder
      * Saturating auto-encoder
    * A4: minimize the gradient and maximize the curvature around data points: score matching

Why is max likelihood a contrastive method: we want to pick weights $$w$$ to maximize

$$
\begin{align*}
p_w(y \vert x) &= \frac{e^{- \beta F_w(x, y)}}{\int_{y'}e^{- \beta F_w(x, y')}dy'} \\
\end{align*}
$$

Taking logs, this is same as to minimize:

$$
\begin{align*}
\mathcal{L}(x, y, w) &= F_w(x, y) + \frac{1}{\beta} \log \int_{y'}e^{- \beta F_w(x, y')}dy'
\end{align*}
$$

Taking gradient w/ respect to $$w$$:

$$
\begin{align*}
\frac{\partial}{\partial w}\mathcal{L}(x, y, w) &= \frac{\partial}{\partial w} F_w(x, y) + \frac{1}{\beta} \frac{\partial}{\partial w}  \log \int_{y'}e^{- \beta F_w(x, y')}dy'\\

&= \frac{\partial}{\partial w} F_w(x, y) + \frac{1}{\beta} \frac{\frac{\partial}{\partial w} \int_{y'}e^{- \beta F_w(x, y')}dy'}{\int_{y'}e^{- \beta F_w(x, y')}dy'} \\

&= \frac{\partial}{\partial w} F_w(x, y) + \frac{1}{\beta} \frac{ \int_{y'}\frac{\partial}{\partial w}e^{- \beta F_w(x, y')}dy'}{\int_{y'}e^{- \beta F_w(x, y')}dy'} \\

&= \frac{\partial}{\partial w} F_w(x, y) - \frac{ \int_{y'}e^{- \beta F_w(x, y')}\frac{\partial}{\partial w}F_w(x, y')dy'}{\int_{y'}e^{- \beta F_w(x, y')}dy'} \\

&= \frac{\partial}{\partial w} F_w(x, y) - \int_{y'} p(y' \vert x) \frac{\partial}{\partial w}F_w(x, y')dy' \\
\end{align*}
$$

Under the integral, if $$y'$$ has high energy, $$p(y' \vert x)$$ is low, and $$\frac{\partial}{\partial w}F_w(x, y')$$ is not pushed up very much. If $$y'$$ has low energy, $$p(y' \vert x)$$ is high, $$\frac{\partial}{\partial w}F_w(x, y')$$ is pushed up.

Issues
* Integral is most time intractable
* You can discretize the integral, but you still have to sum over all y. If $$y$$ is in a discrete space, $$F$$ is actually softmax.
* If the space is large, even discretized, it is too large.
* We can instead pick a single sample $$y'$$.
* Back during WW2, during the Manhattan project, physicists invented the Monte-Carlo method, for a distribution that has only the energy, and not the distribution.
* MC/MCMC/HMC/CD: Draw a sample $$\hat{y}$$ from $$F_w(y \vert x))$$, and replace the integral with that sample.
* If you draw sufficiently many samples, get good approximation:

$$
\begin{align*}
\frac{\partial}{\partial w}\mathcal{L}(x, y, w) &\approx \frac{\partial}{\partial w} F_w(x, y) - \frac{\partial}{\partial w}F_w(x, \hat{y})
\end{align*}
$$



