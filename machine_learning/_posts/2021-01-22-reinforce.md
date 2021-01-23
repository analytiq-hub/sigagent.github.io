---
layout: post
mathjax: true
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

In reinforcement learning, an agent in state $$s_t$$ acts on the environment with action $$a_t$$, and receives reward $$r_t$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](http://bitdribble.github.io/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue for an infinite number of steps. The agent's function that maps states and rewards to actions is called *policy*, denoted $$\pi$$.

A sequence of *experiences* $$(s_t, a_t, r_t)$$ defines a trajectory

$$\tau = (s_0, a_0, r_0), (s_1, a_1, r_1), (s_2, a_2, r_2), ...$$

The *objective* of RL problems is to maximize the sum of rewards over all steps, performing good actions, and *learning* a good policy $$\pi$$, through trial and error, using the magnitude of rewards to *reinforce* good actions.

Since the sum of rewards $$r_0 + r_1 + r_2  + ... $$ can be infinite, even when $$r_t$$ are bounded, it is convenient to discount rewards by a factor $$0 < \gamma < 1$$. The *return* of a trajectory $$\tau$$ is defined as

$$R(\tau) = r_0 + {\gamma}r_1 + {\gamma^2}r_2 + ... + {\gamma^T}r_T$$

Since $$0 < \gamma < 1$$, when $$-M < r_t < M$$ for all $$0 <= t <= T$$, we have

$$-M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T}) < R(\tau) < M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T})$$

or

$$-M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}} < R(\tau) < M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}}$$

...

REINFORCE is perhaps the most basic algorithm for deep reinforcement learning.

...

