---
layout: post
mathjax: true
title: Bibliography
author:
- Andrei Radulescu-Banu
---

[Top](/machine_learning/introduction_to_reinforcement_learning) \| [Notations](/machine_learning/notations) \| [Bibliography](/machine_learning/bibliography)

## General Sources
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). Theory and examples, with implementations using [OpenAI Gym](https://gym.openai.com/), pytorch, tensorflow, and [SLM Lab](https://github.com/andrei-radulescu-banu/SLM-Lab)
  * To run code: `docker run -it --name ubuntu_16_04 ubuntu:16.04` then follow install instructions [here](https://github.com/andrei-radulescu-banu/SLM-Lab).
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018). Clear presentation, builds up from simple example. Authors are major contributors in the field. David Silver (AlphaZero architect) says he read their 1st edition as a first step to learn about RL.
* [Algorithms of Reinforcement Learning](https://sites.ualberta.ca/~szepesva/rlbook.html), C. Szepesvári (2015), recommended by David Silver as more mathematical and faster paced than the Sutton and Barto book
* [Fundamentals of Machine Learning for Predictive Data Analytics](https://www.amazon.com/Fundamentals-Machine-Learning-Predictive-Analytics/dp/0262044692/ref=asc_df_0262044692/), J.D. Kelleher et al (2020). Nice survey of ML. Chap 11 on RL: Markov Decision Processes (MDP), Bellman Equations, Temporal-Difference Learning, Q-Learning, SARSA, Deep Q-Networks (DQN)
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). High level, very clear presentation. Deep Q-Learning (DQN), Policy Gradient (PG), AlphaGo & AlphaZero
* MIT 6.S091: [Introduction to Deep Reinforcement Learning](https://www.youtube.com/watch?v=zR11FLZ-O9M&t=2130s), Lex Fridman (2019). Explains well how a small change in reward function gives completely different policy.
* [RL Course by David Silver](https://deepmind.com/learning-resources/-introduction-reinforcement-learning-david-silver), [youtube](https://www.youtube.com/watch?v=2pWv7GOvuf0) (2015)
* [David Silver: AlphaGo, AlphaZero, and Deep Reinforcement Learning](https://www.youtube.com/watch?v=uPUEq8d73JI&t=2499s), Lex Fridman Podcast #86 (2020)
* [A (Long) Peek into Reinforcement Learning](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html), L. Weng (2018)
* [OpenAI Baselines](https://github.com/openai/baselines/), a set of high-quality implementations of reinforcement learning algorithms
* [Offline Reinforcement Learning: Tutorial, Review,and Perspectives on Open Problems](https://arxiv.org/pdf/2005.01643.pdf), Sergey Levine et al (2020). Explains how RL is modified for offline learning.

Most books available at [https://b-ok.cc](https://b-ok.cc).

## Additional Sources for Policy Gradient Algorithms
* [Policy Gradient Methods for Reinforcement Learning with Function Approximation](https://papers.nips.cc/paper/1999/file/464d828b85b0bed98e80ade0a5c43b0f-Paper.pdf), R. Sutton et. al. (1999)
* [Policy Gradient Algorithms](https://lilianweng.github.io/lil-log/2018/04/08/policy-gradient-algorithms.html), L. Weng (2018)
* [Why are policy gradient methods preferred over value function approximation in continuous action domains?](https://datascience.stackexchange.com/questions/25209/why-are-policy-gradient-methods-preferred-over-value-function-approximation-in-c/25212#25212)
* [Deriving Policy Gradients and Implementing REINFORCE](https://medium.com/@thechrisyoon/deriving-policy-gradients-and-implementing-reinforce-f887949bd63), C. Yoon (2018)
* [REINFORCE Algorithm: Taking baby steps in reinforcement learning](https://www.analyticsvidhya.com/blog/2020/11/reinforce-algorithm-taking-baby-steps-in-reinforcement-learning/) (2020), with code examples

## Additional Sources for Math Appendix
* [Introduction to Probability](http://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/amsbook.mac.pdf), C.M. Grinstead, J.L. Snell, Chap. 11, Markov Chains