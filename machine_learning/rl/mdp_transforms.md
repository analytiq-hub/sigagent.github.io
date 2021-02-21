---
layout: post
mathjax: true
title: Markov Decision Process Transformations
author:
- Andrei Radulescu-Banu
---

This post is part of a [Series dealing with Reinforcement Learning](/machine_learning/rl/introduction_to_reinforcement_learning.md).

## Sources
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018). Clear presentation, builds up from simple example. Authors are major contributors in the field. David Silver (AlphaZero architect) says he read their 1st edition as a first step to learn about RL.
* [How are reward functions R(s), R(s, a), and R(s, a, s') equivalent?](https://ai.stackexchange.com/questions/10442/how-are-the-reward-functions-rs-rs-a-and-rs-a-s-equivalent) (2019)
* [Equivalence notions and model minimization in Markov decision processes](https://www.sciencedirect.com/science/article/pii/S0004370202003764), R. Givan, T. Dean, M. Greig (2003)
* [Approximate Equivalence of Markov DecisionProcesses](https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.121.6504&rep=rep1&type=pdf), by E. Even-Dar and Y. Mansour

TO DO: under construction
- Explain what are equivalent MDPs
- Why formulations using stochastic state-action-state rewards, or state-action reward functions, or state reward functions are equivalent
- What are morphisms of MDPs
- Why $$J_\pi$$, $$V^\pi(s)$$ and $$Q^\pi(s, a)$$ in an MDP can each be interpreted as action-value, value and goal, if we change the underlying MDP
- How an MDP $$(\mathcal{S}, \mathcal{A}, d(s_0), p(s',r \vert s, a))$$ with reward $$r$$ and a discount factor $$\gamma$$ is equivalent to an MDP with states $$\mathcal{S} \times \mathbb{N}$$, reward $$r$$ and discount factor $$1$$, and how we can replace $$r_n$$ with $$\gamma^{n-1}r_n$$ formally in a suitable sense in MDP formulas like the Bellman equations or the policy gradient used in REINFORCE.
- If two policies $$\pi_1, \pi_2$$ on an MDP satisfy $$Q_{\pi_1}(s, a) \lt Q_{\pi_2}(s, a)$$, we say $$\pi1 \lt \pi_2$$. The policy $$\pi_2$$ is more optimal. If $$\mathcal{S}, \mathcal{A}$$ are finite, there always exists an optimal policy.
- Given MDP, construct MDP that models reward + risk (or variance of reward)

Open issues:
- What is the relation of MDPs, RL algorithms, with constructive mathematics? Given that often the problem is about constructing a policy given incomplete model information