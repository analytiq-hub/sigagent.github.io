---
layout: post
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

In reinforcement learning, an agent in state s<sub>t</sub> acts on the environment with action a<sub>t</sub>, and receives reward r<sub>t</sub>. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](http://bitdribble.github.io/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps T, or can continue for an infinite number of steps. The agent's function that maps states and rewards to actions is called *policy*, denoted &pi;.

A sequence of *experiences* (s_<sub>t</sub>, a_<sub>t</sub>, r_<sub>t</sub>) defines a trajectory

```
\tau = (s_<sub>0</sub>, a_<sub>0</sub>, r_<sub>0</sub>), (s_<sub>1</sub>, a_<sub>1</sub>, r_<sub>1</sub>), ...
```

The *objective* of RL problems is to maximize the sum of rewards over all steps, performing good actions, and *learning* a good policy &pi;, through trial and error, using the magnitude of rewards to *reinforce* good actions.

Since the sum of rewards r_<sub>0</sub> + r_<sub>1</sub> + ... can be infinite, it is convenient to discount rewards by a factor 0 < \gamma; < 1. The *return* of a trajectory \tau; is defined as

```
R(\tau;) = r_<sub>0</sub> + \gamma;r_<sub>1</sub> + \gamma<sup>2</sup>;r_<sub>2</sub> + ... + \gamma<sup>T</sup>;r_<sub>T</sub>
```

REINFORCE is perhaps the most basic algorithm for deep reinforcement learning. 

