---
layout: post
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

In reinforcement learning, an agent in state s<sub>t</sub> acts on the environment with action a<sub>t</sub>, and receives reward r<sub>t+1</sub>. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](http://bitdribble.github.io/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps T, or can continue for an infinite number of steps. The agent's function that maps states and rewards to actions is called *policy*, denoted &pi;.

REINFORCE is perhaps the most basic algorithm for deep reinforcement learning. 

