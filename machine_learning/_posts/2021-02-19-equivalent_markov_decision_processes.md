---
layout: post
mathjax: true
title: Equivalent Markov Decision Processes
author:
- Andrei Radulescu-Banu
---

This post is part of a series dealing with Reinforcement Learning:
- [Introduction to Reinforcement Learning](/machine_learning/2021/02/13/introduction_to_machine_learning/)
- [RL: Value Learning Algorithms](/machine_learning/2021/02/14/value_learning_algorithms/)
- [RL: The REINFORCE Algorithm](/machine_learning/2021/02/14/reinforce/)
- [Equivalent Markov Decision Processes](/machine_learning/2021/02/19/equivalent_markov_decision_processes/)

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
- How an MDP $$(\mathcal{S}, \mathcal{A}, d(s_0), p(s',r \vert s, a))$$ with reward $$r$$ and a discount factor $$\gamma$$ is equivalent to an MDP with states $$\mathcal{S} \times \mathbb{N}$$, reward $$r$$ and discount factor $$1$$, and how formally we can replace $$r_n$$ with $$\gamma^{n-1}r_n$$ formally in a suitable sense in MDP formulas like the Bellman equations or the policy gradient used in REINFORCE.

Open issues:
- What is the relation of MDPs, RL algorithms, with constructive mathematics? Given that often the problem is about constructing a policy given incomplete model information