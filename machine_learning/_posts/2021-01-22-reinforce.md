---
layout: post
mathjax: true
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

## What is Reinforcement Learning?
In reinforcement learning, an agent in state $$s_t$$ acts on the environment with action $$a_t$$, and receives reward $$r_t$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](http://bitdribble.github.io/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue for an infinite number of steps. The agent's function that maps states and rewards to actions is called *policy*, denoted $$\pi$$.

If we denote $$\mathcal{S}_t, \mathcal{A}_t, \mathcal{R}_t$$ the set of states, actions, and rewards at step $$t$$, then the policy $$\pi$$ is a family of functions

$$
\begin{equation}
\pi_t : \mathcal{S}_t \times \mathcal{A}_t \rightarrow \mathcal{R}_t
\end{equation}
$$

To simplify notation, drop the index $$t$$, and denote $$\mathcal{S}, \mathcal{A}, \mathcal{R}$$ the families of sets of states, actions, and rewards. The policy is a family of functions

$$
\begin{equation}
\pi : \mathcal{S} \times \mathcal{A} \rightarrow \mathcal{R}
\end{equation}
$$


A sequence of *experiences* $$(s_t, a_t, r_t)$$ defines a trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0, r_0), (s_1, a_1, r_1), (s_2, a_2, r_2), ...
\end{equation}
$$

The *objective* of RL problems is to maximize the sum of rewards over all steps, performing more optimal actions at each step, and *learning* a good policy $$\pi$$, through trial and error, using the magnitude of rewards to *reinforce* good actions.

Since the sum of rewards $$r_0 + r_1 + r_2  + ...$$ can be infinite, even when $$r_t$$ are bounded, it is convenient to discount rewards by a factor $$0 < \gamma < 1$$. The *return* of a trajectory $$\tau$$ is defined as

$$
\begin{equation}
R(\tau) = r_0 + {\gamma}r_1 + {\gamma^2}r_2 + ... + {\gamma^T}r_T
\end{equation}
$$

Since $$0 < \gamma < 1$$, when $$-M < r_t < M$$ for all $$0 <= t <= T$$, we have

$$
\begin{equation}
-M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T}) < R(\tau) < M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T})
\end{equation}
$$

or

$$
\begin{equation}
-M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}} < R(\tau) < M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}}
\end{equation}
$$

## Reinforcement Learning as a MDP

The state $$s_t$$ and action $$a_t$$ are, in practice, measured stochastically. State can only be estimated up to a measurement error. Actions can have error effects also.

$$
\begin{equation}
s_{t+1} \sim P(s_{t+1}|(s_0,a_0),(s_1,a_1),...,(s_t,a_t))
\end{equation}
$$

At each step, the state $s_{t+1}$ is sampled from a probability distribution $$P$$ conditoned on past states and actions. To simplify things, we assume that all the information in past states and actions is summarised by $$(s_t, a_t)$$, turning the process into a Markov Dynamic Process:

$$
\begin{equation}
s_{t+1} \sim P(s_{t+1}|s_t,a_t)
\end{equation}
$$


...

REINFORCE is perhaps the most basic algorithm for deep reinforcement learning.

...


This page was created with
* Diagram software from [draw.io](https://draw.io)
* [MathJax](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html) for LaTeX typesetting
  * To check LaTeX expressions, use this [web form](https://cdn.rawgit.com/mathjax/MathJax/2.7.1/test/sample-dynamic-2.html) or [this form](http://mathb.in/29559)
  * List of [mathematical fonts](https://www.overleaf.com/learn/latex/Mathematical_fonts)
