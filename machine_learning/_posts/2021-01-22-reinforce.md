---
layout: post
mathjax: true
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

Sources:
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). Theory and examples, with implementations using [OpenAI Gym](https://gym.openai.com/), pytorch, tensorflow, and [SLM Lab](https://github.com/andrei-radulescu-banu/SLM-Lab)
  * To run code: `docker run -it --name ubuntu_16_04 ubuntu:16.04` then follow install instructions [here](https://github.com/andrei-radulescu-banu/SLM-Lab).
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018). Clear presentation, builds up from simple example. Authors are major contributors in the field. David Silver (AlphaZero architect) says he read their 1st edition as a first step to learn about RL.
* [Fundamentals of Machine Learning for Predictive Data Analytics](https://www.amazon.com/Fundamentals-Machine-Learning-Predictive-Analytics/dp/0262044692/ref=asc_df_0262044692/), J.D. Kelleher et al (2020). Nice survey of ML. Chap 11 on RL: Markov Decision Processes (MDP), Bellman Equations, Temporal-Difference Learning, Q-Learning, SARSA, Deep Q-Networks (DQN)
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). High level, very clear presentation. Deep Q-Learning (DQN), Policy Gradient (PG), AlphaGo & AlphaZero
* MIT 6.S091: [Introduction to Deep Reinforcement Learning](https://www.youtube.com/watch?v=zR11FLZ-O9M&t=2130s), Lex Fridman (2019). Explains well how a small change in reward function gives completely different policy.
* [David Silver: AlphaGo, AlphaZero, and Deep Reinforcement Learning](https://www.youtube.com/watch?v=uPUEq8d73JI&t=2499s), Lex Fridman Podcast #86 (2020)
* [Offline Reinforcement Learning: Tutorial, Review,and Perspectives on Open Problems](https://arxiv.org/pdf/2005.01643.pdf), Sergey Levine et al (2020). Explains how RL is modified for offline learning.
Most books available at [https://b-ok.cc](https://b-ok.cc).

## What is Reinforcement Learning?
In machine learning, there are three types of learning tasks:
- Supervised learning (given a set of annotated input, learn to predict output)
- Unsupervised learning (discover a good representation of the input)
- Reinforcement learning (learn to select actions that maximize reward)

In supervised & unsupervised learning, the object being learned is data - for example text, speech, images. In *reinforcement learning* (RL), what is learned are *processes*, using a *reward* function to determie the optimal actions.

## The CartPole example
![CartPole](/src/images/cartpole.png)

In this example, a pole is balanced on top of a cart. The environment is two-dimensional. The cart needs to be moved left or right to balance the pole.
* The *objective* is to keep the pole upright
* The *state* is represented by (cart position, cart speed, pole angle, pole angular speed)
* The *action* is to move the cart a unit of distance to the left, or a unit of distance to the right
* The *reward* is $$+1$$ for each step the pole remains upright (i.e., does not tip for more than a fixed angle)

## Formulation of the problem
In reinforcement learning (RL), an agent in state $$s_t$$ acts with action $$a_t$$, and moves to state $$s_{t+1}$$, with reward $$r_{t+1}$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](/src/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue indefinitely. The agent's function that maps states to actions is called *policy*, denoted $$\pi$$. The goal of the policy $$\pi$$ is to maximize the sum of all rewards for the next steps.

If we denote $$\mathcal{S}_t, \mathcal{A}_t$$ the set of states and actions at step $$t$$, then the policy $$\pi$$ is then a family of functions

$$
\begin{equation}
\pi_t : \mathcal{S}_t \rightarrow \mathcal{A}_t
\end{equation}
$$

The rewards are a function $$r_{t+1}$$

$$
\begin{equation}
r_{t+1} : \mathcal{A}_t \rightarrow \mathbb{R}
\end{equation}
$$

In the CartPole example, the rewards $$r_{t+1}$$ merely depend on $$s_{t+1}$$, which depends on $$a_t$$. A sequence of *experiences* $$(s_t, a_t, r_{t+1})$$ defines a trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0, r_1), (s_1, a_1, r_2), (s_2, a_2, r_3), ...
\end{equation}
$$

Trajectories can start at any step $$t$$, and are still denoted $$\tau$$ (or, to disambiguate, $$\tau_t$$).

The *objective* of RL problems is to maximize the sum of future rewards, *learning* a good policy $$\pi$$, through trial and error, using the size of rewards to *reinforce* good actions. Note that some sources label the reward for action $$a_t$$ as $$r_t$$ instead of $$r_{t+1}$$.

## Probabilistic formulation

The states $$s_{t+1}$$, in practice, can only be estimated, stocastically, up to a measurement error:

$$
\begin{equation}
s_{t+1} \sim P(s_{t+1} \vert (s_0,a_0),(s_1,a_1),...,(s_t,a_t))
\end{equation}
$$

At each step, the state $s_{t+1}$ is sampled from a probability distribution $$P$$ conditoned on past states and actions. To simplify things, we assume that all the information from past states and actions is subsumed into $$(s_t, a_t)$$, turning the process into a Markov Dynamic Process (MDP):

$$
\begin{equation} \label{eq:state_transition_dist}
s_{t+1} \sim P(s_{t+1} \vert s_t,a_t)
\end{equation}
$$

This formulation is still flexible enough to provide good models. If the process is not Markov, and $$s_{t+1}$$ depends on additional information than $$(s_t,a_t)$$, the state space can often be extended to turn the process into an MDP.

In an MDP, $$P(s_{t+1} \vert s_t,a_t)$$ represents the state transition distribution. The action $$a_{t}$$ determines a reward function, with real number values:

$$
\begin{equation}
r_{t+1} : \mathcal{A}_{t} \rightarrow \mathbb{R}
\end{equation}
$$

More generally, the reward function can be a stochastic distribution dependent on the previous state and action:

$$
\begin{equation} \label{eq:reward_dist}
R(r_{t+1} \vert s_t, a_t)
\end{equation}
$$

A Markov Decision Process (MDP) consists, in general, of
* A family of states $$\mathcal{S}_t$$
* A family of actions $$\mathcal{A}_t$$
* A probability distribution $$P(s_{t+1} \vert s_t, a_t)$$ of arriving to state $$s_{t+1}$$ fron $$s_{t}$$ when applying action $$a_t$$
* A probability distribution $$R(r_{t+1} \vert s_t, a_t)$$ of rewards obtained when applying action $$a_t$$ in state $$s_{t}$$.

In our case, the rewards distribution will simply be a function $$r_{t+1} : \mathcal{A}_{t} \rightarrow \mathbb{R}$$.

Agents do not have direct access to the state transition distribution (\ref{eq:state_transition_dist}) or to the reward distribution (\ref{eq:reward_dist}). These can, however, be sampled.

## Rewards and the Objective Function

In RL problems, action $$a_t$$ is picked not just to maximize next reward $r_{t+1}$, but future rewards $$r_{t+2}, r_{t+3} ...$$ also. This can be formulated several ways, and, in one formulation, actions are picked to maximize the sum of all future rewards $$r_{t+1} + r_{t+2} + ... + r_{T+1}$$.

It is convenient to discount rewards by a factor $$0 \le \gamma$$, and define the *return* of a trajectory $$\tau = (s_t, a_t, r_{t+1}), ... , (s_T, a_T, r_{T+1})$$ that starts at step $$t$$ as:

$$
\begin{equation} \label{eq:traj_return}
R_t(\tau) = r_{t+1} + {\gamma}r_{t+2} + {\gamma^2}r_{t+3} + ... + {\gamma^{T-t}}r_{T+1}
\end{equation}
$$

The larger the discount factor $$\gamma$$, the larger the effect of later steps.

When the number of steps is infinite, the sum of rewards $$r_{1} + r_{2}  + ...$$ can be infinite, even when $$r_t$$ are bounded $$-M \lt r_t \lt M$$ for all $$t$$. In this case, we must pick a discount factor $$0 \le \gamma \lt 1$$, and

$$
\begin{equation}
-M(1 +{\gamma} + {\gamma^2} + ... + {\gamma^{T}}) \lt R_0(\tau) \lt M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^{T}})
\end{equation}
$$

or

$$
\begin{equation}
-M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}} \lt R_0(\tau) \lt M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}}
\end{equation}
$$

ensuring that $$R_0(\tau)$$ remains finite:

$$
\begin{equation}
-M \frac{1}{1-\gamma} \lt R_0(\tau) \lt M \frac{1}{1-\gamma}
\end{equation}
$$

Same bounds hold for $$R_t(\tau)$$. When the discount factor $$\gamma \in [0, 1)$$ is close to $$1$$, future states have larger weight in the trajectory return. When $$\gamma$$ is close to $$0$$, next state has a larger weight.

## The Objective Function in REINFORCE

In the REINFORCE algorithm, trajectories $$\tau$$ are sampled according to a policy $$\pi$$, and the *objective* function is defined as the expected value of the return function:

$$
\begin{equation}
J(\pi) = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r_{t+1}]
\end{equation}
$$

In REINFORCE, the goal of the agent is to maximize the objective function $$J(\pi)$$. Trajectories are sampled over a parametrized set of policies $$\pi$$.

...


This page was created with
* Diagram software from [draw.io](https://draw.io)
* [MathJax](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html) for LaTeX typesetting
  * To check LaTeX expressions, use this [web form](https://cdn.rawgit.com/mathjax/MathJax/2.7.1/test/sample-dynamic-2.html) or [this form](http://mathb.in/29559)
  * List of [mathematical fonts](https://www.overleaf.com/learn/latex/Mathematical_fonts)
