---
layout: page
mathjax: true
title: Active Inference - Free Energy Principle (Andrei's study notes)
---

Notes reading K. Friston et al's [Active Inference: The Free Energy Principle in Mind, Brain, and Behavior](https://www.amazon.com/Active-Inference-Energy-Principle-Behavior/dp/0262045354) (2022)
* [Karl Friston](https://www.fil.ion.ucl.ac.uk/~karl/)
  * Sean Carroll: Mindscape 87: [Karl Friston on Brains, Predictions, and Free Energy](https://www.youtube.com/watch?v=TcFLQvz5uEg&t=1924s) (2020)

* Chap 2
  * Bayes' Rule $$ P(x \vert y) = \frac{P(y \vert x) \cdot P(x)}{P(y)} $$
    * Likelihood model $$P(y \vert x)$$, prior belief $$P(x)$$, posterior belief $$P(x \vert y)$$
    * _Posterior_ is proportional $$\propto$$ to _prior * likelihood_
    * But _Posterior_ needs to be normalized, and that is computationally intractable.
      * Computing $$P(y) = \int_x P(y \vert x)$$ is intractable.
  * Given the likelihood model $$P(y \vert x)$$ and the prior belief $$P(x)$$
    * Compute joint probability $$P(x, y)$$ and marginal likelyhood $$P(y)$$
    * If event $$y$$ is actually observed, compute posterior belief $$P(x \vert y)$$
    * Surprise is $$\Im(y) :=  -\ln P(y)$$
    * Bayesian surprise is $$D_{KL}[P(x \vert y) \vert\vert P(x)]$$. This scores the amount of belief updating, as opposed to simply how unlikely the observation was.
      * For example, if $$P(x)=1$$, then $$P(x \vert y) = 1$$, and the Bayesian surprise is $$0$$, but the surprise $$\Im(y)$$ is not $$0$$.
    * $$-\ln()$$ is convex, so we can use Jensen's inequality: for a posterior distribution $$Q(x)$$, we have

$$
\begin{align*}
\Im(y) &=  -\ln P(y) \\
        &= - \ln \int_x Q(x) \frac{P(y, x)}{Q(x)} \le \int_x -Q(x) \ln \frac{P(y, x)}{Q(x)} := F[Q,y]
\end{align*}
$$

We name $$F(Q,y)$$ the _Variational Free Energy_.
* $$Q$$ is called an approximate posterior
* Equality is when the posterior distribution $$P(x \vert y) = \frac{P(y, x)}{P(y)}$$ matches the approximate distribution $$Q(x)$$, given that $$y$$ is fixed.

Can express the _variational free energy_ as _Energy_ minus _Entropy_:

$$
\begin{align*}
F[Q,y] &= - \int_x Q(x) \ln \frac{P(y,x)}{Q(x)}dx \\
       &= - \int_x Q(x) \ln P(y, x)dx + \int_x Q(x) \ln Q(x)dx \\
       &= - \mathbb{E}_{Q(x)}[\ln P(y, x)] - H(Q(x))
\end{align*}
$$

* _Entropy_ is the _average surprise_

$$
\begin{align*}
H[Q(x)] = - \int_x Q(x) \ln Q(x) dx = \mathbb{E}_{Q(x)}[{\Im}_Q(x)]
\end{align*}
$$

* In absence of data or precise prior beliefs (which only influence the _energy_ term), we should adopt maximally uncertain beliefs about the hidden state of the world - in accordance with Jaynes's _maximum entropy_ principle.
* Be uncertain (high entropy) when we have no information.
* Here, _energy_ has a statistical mechanics interpretation.
  * The Boltzmann distribution $$P(E) = \frac{1}{Z} \cdot e^{-\frac{E}{kT}}$$ describes the statistical behavior of a system with energy $$E$$ at thermal equilibrium temperature $$T$$.
  * $$Z$$ is the partition function (a normalization constant), $$k$$ is the Boltzmann constant.
  * The average log probability $$\ln P(E)$$ of a system at thermal equilibrium is inversely proportional to the energy $$E$$ required to move the system into this configuration from a baseline configuration. [Andrei: _inverse_ meant as _negatively proportional_].
* The name _variational free energy_ for $$F(Q,y)$$ comes from this statistical mechanics interpretation as _energy_ minus _entropy_.

Can express the _variational free energy_ as _Complexity_ minus _Accuracy_:

$$
\begin{align*}
F[Q,y] &= - \int_x Q(x) \ln \frac{P(y,x)}{Q(x)}dx \\
       &= - \int_x Q(x) \ln \frac{P(y \vert x) P(x)}{Q(x)}dx \\
       &= - \int_x Q(x) \ln \frac{P(x)}{Q(x)}dx - \int_x Q(x) \ln P(y \vert x)dx \\
       &= D_{KL}[Q(x) \vert\vert P(x)] - \mathbb{E}_{Q(x)}[\ln P(y \vert x)]
\end{align*}
$$

* _Complexity_ means how much the approximation of the posterior $$Q(x)$$ deviates from the prior $$P(x)$$ - how many extra bits of information are encoded in $$Q(y)$$ relative to $$P(x)$$
* _Accuracy_ $$\mathbb{E}_{Q(x)}[\ln P(y \vert x)]$$ is maximized when the density $$Q$$ places its mass on configurations of the latent variables that explain the observed data.

Can express the _variational free energy_ as _Divergence_ minus _Evidence_:

$$
\begin{align*}
F[Q,y] &= - \int_x Q(x) \ln \frac{P(y,x)}{Q(x)}dx \\
       &= - \int_x Q(x) \ln \frac{P(x \vert y) P(y)}{Q(x)}dx \\
       &= - \int_x Q(x) \ln \frac{P(x \vert y)}{Q(x)}dx - \int_x Q(x) \ln P(y)dx \\
       &= D_{KL}[Q(x) \vert\vert P(x \vert y)] - \ln P(y)
\end{align*}
$$

* Classically, $$-F(Q,y)$$ is called _Evidence Lower Bound_ (ELBO). The ELBO is always $$\le \ln P(y)$$, with equality when $$Q(x)=P(x \vert y)$$ (see [wiki](https://en.wikipedia.org/wiki/Variational_Bayesian_methods)).

* Expected Free Energy $$G(\pi$$ at p. 55 is incorrect but a corrected version is in Smith et al: [A Step-by-Step Tutorial on Active Inference and its Application to Empirical Data](https://psyarxiv.com/b4jm6/) (2021) p. 55.

Interpretation:
* This inference procedure is a combination of top-down processes that encode predictions $$P(y)$$, and bottom-up processes that encode sensory observations $$y$$.
  * This interplay of top-down and bottom-up processes distinguishes the inferential view from alternative approaches that only consider bottom-up processes.
* Bayesian inference is optimal w/ respect to cost function that is variational free energy.
  * Variational free energy is closely related to surprise $$-\ln P(y)$$
* Bayesian inference is different from Maximum Likelihood Estimation, which simply selects the hidden state $$y$$ most likely to have generated the data $$x$$.
* The results of inference are subjective, because
  * Biological creatures have limited computational and energetic resources, which make Bayesian inference intractable. They make approximations:
    * variational posterior - based on mean field approximations
  * The generative model may not correspond to the real generative process.
    * The generative model, as it is optimized with new experiences acquired, may not even converge to the generative process.
    * The generative process is in a true state $$x^*$$, which generates an observation $$y$$, which the organism senses. Both $$x^*$$ and $$y$$ are hidden state.
  * Psychological claim about optimality of inference is always contingent on the organism's resources - its specific generative model, and bounded computational resources.


References:
* [ChatGPT about Bayesian Statistics](https://bitdribble.github.io/chatgpt/statistics/2022/12/23/chatgpt/)
* Wikipedia: [Gamma Function](https://en.wikipedia.org/wiki/Gamma_function), [Beta Function](https://en.wikipedia.org/wiki/Beta_function)
* Emil Artin: [The Gamma Function](https://archive.org/details/gammafunction0000arti) 
* MIT RES.6-012 Intro to Probabilities [L04.9: Multinomial Probabilities](https://www.youtube.com/watch?v=5A_H1eHbOCY) (2018)
* Jordan Boyd-Graber: [INST414](http://users.umiacs.umd.edu/~jbg/teaching/INST_414/): Advanced Data Science at UMD's School:
  * [Expectations and Entropy](https://www.youtube.com/watch?v=O28U08_yaGU&list=PLegWUnz91Wftp1CsVFQaCgZAILUslEVhF&index=13)
  * [Multinomial and Poisson Distributions](https://www.youtube.com/watch?v=YnUKPC89zEI&list=PLegWUnz91Wftp1CsVFQaCgZAILUslEVhF&index=15)
  * [Continuous Distributions: Beta and Dirichlet Distributions](https://www.youtube.com/watch?v=CEVELIz4WXM&list=PLegWUnz91Wftp1CsVFQaCgZAILUslEVhF&index=21).  Inverse Beta function should be Γ(α+β) / (Γ(α)Γ(β)).
* Harvard [Stat 110](https://projects.iq.harvard.edu/stat110/home) (2013), Joe Blitzstein, [book](https://drive.google.com/file/d/1VmkAAGOYCTORq1wxSQqy255qLJjTNvBI/view)
  * [L11: The Poisson Distribution](https://www.youtube.com/watch?v=TD1N4hxqMzY&list=PL2SOU6wwxB0uwwH80KTQ6ht66KWxbzTIo&index=11)
  * [L23: Beta distribution](https://www.youtube.com/watch?v=UZjlBQbV1KU&list=PL2SOU6wwxB0uwwH80KTQ6ht66KWxbzTIo&index=23)
  * [L24: Gamma distribution and Poisson process](https://www.youtube.com/watch?v=Qjeswpm0cWY&list=PL2SOU6wwxB0uwwH80KTQ6ht66KWxbzTIo&index=24)

More references:
* S. Alexander: [God Help Us, Let’s Try To Understand Friston On Free Energy](https://www.lesswrong.com/posts/wpZJvgQ4HvJE2bysy/god-help-us-let-s-try-to-understand-friston-on-free-energy) (2018)
* Maxwell Ramstead: [A tutorial on active inference](https://www.youtube.com/watch?v=WzFQzFZiwzk&t=445s) (2020)
* Casper Hesp et al: [Deeply Felt Affect: The Emergence of Valence in Deep Active Inference](https://direct.mit.edu/neco/article/33/2/398/95642) (2021)
* Friston et al: [Variational ecology and the physics of sentient systems](https://pubmed.ncbi.nlm.nih.gov/30655223/) (2018)
* Friston et al: [Knowing one’s place: a free-energy approach to pattern regulation](https://royalsocietypublishing.org/doi/10.1098/rsif.2014.1383) (2015)
* ActInfLab ModelStream #001: [A Step-by-Step Tutorial on Active Inference](https://www.youtube.com/watch?v=H5AolqFl2Nw) (2021)
  * Ryan Smith et al: [A Step-by-Step Tutorial on Active Inference and its Application to Empirical Data](https://psyarxiv.com/b4jm6/) (2021)
* DaCosta et al: [Active inference on discrete state-spaces: a synthesis](https://arxiv.org/abs/2001.07203) (2020)
* Comparisons to RL:
  * Sajid et al: [Active inference: demystified and compared](https://arxiv.org/abs/1909.10863) (2019)
  * Sajid et al: [Reward Maximisation through Discrete Active Inference](https://arxiv.org/abs/2009.08111) (2020)
* Medium: O. Solopchuk: 
  * [Intuitions on predictive coding and the free energy principle](https://medium.com/@solopchuk/intuitions-on-predictive-coding-and-the-free-energy-principle-3fc5bcedc754) (2018)
  * [Tutorial on Active Inference](https://medium.com/@solopchuk/tutorial-on-active-inference-30edcf50f5dc) (2018)
  * [Free Energy, Action Value, and Curiosity](https://medium.com/@solopchuk/free-energy-action-value-and-curiosity-514097bccc02) (2019)
* R. Bogacz: [A tutorial on the free-energy framework for modelling perception and learning](https://www.sciencedirect.com/science/article/pii/S0022249615000759#br000050) (2017)
* J.C.R. Whittington, R. Bogacz: [An Approximation of the Error Backpropagation Algorithm in a Predictive Coding Network with Local Hebbian Synaptic Plasticity](https://direct.mit.edu/neco/article/29/5/1229/8261/An-Approximation-of-the-Error-Backpropagation) (2017)
* B. Lotter et al: [PredNet](https://coxlab.github.io/prednet/) (2016)
* S. Dora, C. Pennartz: [A Deep Predictive Coding Network for Learning Latent Representations](https://www.biorxiv.org/content/10.1101/278218v2.full.pdf) (2018)
* Wikipedia: [Variational Bayesian methods](https://en.wikipedia.org/wiki/Variational_Bayesian_methods).
  * See Chap.4 in MacKay's [Information Theory, Inference, and Learning Algorithms](https://www.amazon.com/Information-Theory-Inference-Learning-Algorithms/dp/0521642981)
  * MacKay: [Course on Information Theory, Pattern Recognition, and Neural Networks](http://videolectures.net/course_information_theory_pattern_recognition/)
* UZH & ETH Zurich
  * [Computational Psychiatry Course 2019](https://video.ethz.ch/lectures/d-itet/2019/autumn/227-0971-00L.html) (summer school)
    * [Active Inference](https://video.ethz.ch/lectures/d-itet/2019/autumn/227-0971-00L/56dbb21a-9367-44e0-805e-d3cb200ba9c3.html) lecture
* S. Levine: [Reinforcement Learning and Control as Probabilistic Inference: Tutorial and Review](https://arxiv.org/abs/1805.00909) (2018)
* T. Parr: [Neuronal message passing using Mean-field, Bethe, and Marginal approximations](https://www.nature.com/articles/s41598-018-38246-3) (2019)
* K Friston: [CCN Workshop: Predictive Coding](https://www.youtube.com/watch?v=b1hEc6vay_k) (2016)
* T. Parr, K. Friston: [Generalised free energy and active inference](https://link.springer.com/content/pdf/10.1007/s00422-019-00805-w.pdf?pdf=button) (2019)
* Lex Fridman #99: [Neuroscience and the Free Energy Principle](https://www.youtube.com/watch?v=NwzuibY5kUs) (2021)
* Machine Learning Street Talk: [#033 Karl Friston - The Free Energy Principle](https://www.youtube.com/watch?v=KkR24ieh5Ow) (2020)
* Mathematical Consciousness Sciences: [Markov blankets and Bayesian mechanics (Karl Friston)](https://www.youtube.com/watch?v=j53lfLyFOPA) (2020)

#### Other
* [Artificial Intelligence](artificial_intelligence.md)
* [Cognitive Science](cognitive_science.md)
* [Computation Theory](computation_theory.md)
* [Meta Learning](meta_learning.md)
* [MLOps](mlops.md)
* [Language Models](language_models.md)
* [Probabilities and Statistics](probabilities_and_statistics.md)
* [Robotics](robotics.md)
* [Self Driving Cars](self_driving_cars.md)
* [Computational Topology](computational_topology.md)
