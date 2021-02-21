---
layout: post
mathjax: true
title: Notations
author:
- Andrei Radulescu-Banu
---

This post is part of a [Series dealing with Reinforcement Learning](/machine_learning/rl/introduction_to_reinforcement_learning).

#### Notations

This is a list of notations and definitions used throughout the series.

| Symbol | Meaning |
|--------|---------|
| $$s \in \mathcal{S}$$ | States |
| $$a \in \mathcal{A}$$ | Actions |
| $$d_0(s)$$ | Initial distribution of states |
| $$p(s', r \vert s, a)$$ | State-reward transition probability of getting the next state $s'$ from the current state $s$ with action $$a$$ and reward $$r \in \mathbb{R}$$ |
| $$p(s' \vert s, a)$$ | State transition probability $$Pr(s_{t+1} = s' \vert s_t = s, a_t = a)$$ |
| $$r(s, a, s')$$ | State-action-state reward $$\mathbb{E}[r_{t+1} \vert s_t = s, a_t = a, s_{t+1} = s']$$ |
| $$r(s, a')$$ | State-action reward $$\mathbb{E}[r_{t+1} \vert s_t = s, a_t = a]$$ |
|$$x ~ P$$| $$x$$ sampled with probability $$P$$|

| $$\mathbb{N}, \mathbb{Z}, \mathbb{R}$$ | The sets of nonnegative integers, integers, and real numbers|
