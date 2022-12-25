---
layout: page
mathjax: true
title: Active Inference - Free Energy Principle (Andrei's study notes)
---

Notes reading K. Friston et al's [Active Inference: The Free Energy Principle in Mind, Brain, and Behavior](https://www.amazon.com/Active-Inference-Energy-Principle-Behavior/dp/0262045354) (2022)
* [Karl Friston](https://www.fil.ion.ucl.ac.uk/~karl/)
  * Sean Carroll: Mindscape 87: [Karl Friston on Brains, Predictions, and Free Energy](https://www.youtube.com/watch?v=TcFLQvz5uEg&t=1924s) (2020)
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
* Medium:
  * O. Solopchuk: [Tutorial on Active Inference](https://medium.com/@solopchuk/tutorial-on-active-inference-30edcf50f5dc) (2018)
  * O. Solopchuk: [Free Energy, Action Value, and Curiosity](https://medium.com/@solopchuk/free-energy-action-value-and-curiosity-514097bccc02) (2019)
* UZH & ETH Zurich
  * [Computational Psychiatry Course 2019](https://video.ethz.ch/lectures/d-itet/2019/autumn/227-0971-00L.html) (summer school)
    * [Active Inference](https://video.ethz.ch/lectures/d-itet/2019/autumn/227-0971-00L/56dbb21a-9367-44e0-805e-d3cb200ba9c3.html) lecture

* Chap 2
  * Bayes' Rule $$ P(x \vert y) = \frac{P(y \vert x) \cdot P(x)}{P(y)} $$
  * Likelihood model $$P(y \vert x)$$, prior belief $$P(x)$$, posterior belief $$P(x \vert y)$$
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
        &= - \ln \int_x Q(x) \frac{P(x, y)}{Q(x)} \le \int_x -Q(x) \ln \frac{P(x, y)}{Q(x)} := F[Q,y]
\end{align*}
$$

We define $$F(Q,y)$$ the Variational Free Energy.
  * Equality is when $$P(x, y)$$ is constant in $$x$$.
  * This inference procedure is a combination of top-down processes that encode predictions $$P(y)$$, and bottom-up processes that encode sensory observations $$y$$.
    * This interplay of top-down and bottom-up processes distinguishes the inferential view from alternative approaches that only consider bottom-up processes.
  * Bayesian inference is optimal w/ respect to cost function that is variational free energy.
    * Variational free energy is closely related to surprise $$-\ln P(y)$$
  * Bayesian inference is different from Maximum Likelihood Estimation, which simply selects the hidden state $$y$$ most likely to have generated the data $$x$$.
  * The results of inference are subjective, because
    * Biological creatures have limited computational and energetic resources, which make Bayesian inference intractable. They make approximations:
      * variational posterior - based on mean field approximations
    * The generative movel may not correspond to the real generative process.
      * The generative model, as it is optimized with new experiences acquired, may not even converge to the generative process.
      * The generative process is in a true state $$x^*$$, which generates an observation $$y$$, which the organism senses. Both $$x^*$$ and $$y$$ are hidden state.
    * Psychological claim about optimality of inference is always contingent on the organism's resources - its specific generative model, and bounded computational resources.
  * References:
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

#### Other
* [Artificial Intelligence](artificial_intelligence.md)
* [Cognitive Science](cognitive_science.md)
* [Computation Theory](computation_theory.md)
* [Meta Learning](meta_learning.md)
* [MLOps](mlops.md)
* [Natural Language Processing](natural_language_processing.md)
* [Probabilities and Statistics](probabilities_and_statistics.md)
* [Robotics](robotics.md)
* [Self Driving Cars](self_driving_cars.md)
* [Computational Topology](computational_topology.md)
