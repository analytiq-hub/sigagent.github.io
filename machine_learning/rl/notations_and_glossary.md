---
layout: post
mathjax: true
title: Notations
author:
- Andrei Radulescu-Banu
---

This post is part of a [Series dealing with Reinforcement Learning](/machine_learning/rl/introduction_to_reinforcement_learning).

#### Notations

This is a list of notations used throughout the series.

| Symbol | Meaning |
| -----|-------|
| $$s \in \mathcal{S}$$ | States |
| $$a \in \mathcal{A}$$ | Actions |
| $$d_0(s)$$ | Initial distribution of states |
| $$p(s', r \vert s, a)$$ | Transition probability of getting the next state $s'$ from the current state $s$ with action $$a$$ and reward $$r \in \mathbb{R}$$ |
| $$p(s' \vert s, a)$$ | $$Pr(s_{t+1} = s' \vert s_t = s, a_t = a) = \int_{r \in \mathbb{R}} p(s', r \vert s, a)$$ |
| $$r(s, a, s')$$ | $$\mathbb{E}[r_{t+1} \vert s_t = s, a_t = a, s_{t+1} = s']$$ |
| $$r(s, a')$$ | $$\mathbb{E}[r_{t+1} \vert s_t = s, a_t = a]$$ |

| $$\mathbb{N}, \mathbb{Z}, \mathbb{R}$$ | The sets of nonnegative integers, integers, and real numbers|
