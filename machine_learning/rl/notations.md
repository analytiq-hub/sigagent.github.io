---
layout: post
mathjax: true
title: Notations
author:
- Andrei Radulescu-Banu
---

[Top](/machine_learning/rl/introduction_to_reinforcement_learning) \| [Notations](/machine_learning/rl/notations) \| [Bibliography](/machine_learning/rl/bibliography)

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
|$$\pi(a \vert a)$$ | Policy |
|$$x \sim P$$| $$x$$ sampled with probability $$P$$|
|$$\tau$$| State-action trajectory $$s_0, a_0, s_1, ..., a_{T-1}, s_T$$ for $$T$$ possibly infinite|
|$$\overline{\tau}$$| State-action-reward trajectory $$s_0, a_0, r_1, s_1,..., a_{T-1}, r_{T-1}, s_T$$ |
| $$\gamma$$ | Discount factor $$0 \le \gamma \le 1$$, always $$\lt 1$$ for infinite trajectories |
|$$r(\overline{\tau})$$ | Return of the state-action-reward trajectory $$
|$$J_\pi$$ | Agent objective $$\mathbb{E}_{\overline{\tau} \sim \pi}[r(\overline{\tau})]$$ when we follow policy $$\pi$$|
|$$V_\pi(s)$$| State value function $$\mathbb{E}_{s_0=s, \overline{\tau} \sim \pi}[r(\overline{\tau})]$$ when we follow policy $$\pi$$ |
|$$Q_\pi(s, a)$$| Action value function $$\mathbb{E}_{s_0=s, a_0=a, \overline{\tau} \sim \pi}[r(\overline{\tau})]$$ when we follow policy $$\pi$$ |
|$$A_\pi(s, a)$$| Advantage function $$Q_\pi(s, a) - V_\pi(s)$$ |
|$$V_*(s), Q_*(s, a)$$ | Optimal state and action value functions|
| $$\mathbb{N}, \mathbb{Z}, \mathbb{R}$$ | The sets of nonnegative integers, integers, and real numbers|

| Term | Meaning |
|--------|---------|
| the model | $$p(s' \vert s, a)$$ in an MDP - sometimes known in advance (e.g. in a simulated environment), other times learned through sampling |
| the policy | $$\pi(a \vert s)$$ in an MDP |