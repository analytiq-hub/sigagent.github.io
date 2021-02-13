---
layout: post
mathjax: true
title: "Introduction to Reinforcement Learning"
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
In reinforcement learning (RL), an agent in state $$s_t$$ acts with action $$a_t$$, gets reward $$r(a_t, s_t) \in \mathbb{R}$$, and moves to state $$s_{t+1}$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](/src/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue indefinitely. The agent's goal is to learn a policy $$\pi(a_t \vert s_t)$$ that defines the distribution of actions $$a_t$$ conditioned by state $$s_t$$, with the goal of maximizing the sum of all rewards for the next steps $$r(s_t, a_t) + r(s_{t+1}, a_{t+1}) + ... + r(s_T, a_T)$$.

If we denote $$\mathcal{S}, \mathcal{A}$$ the set of states and actions, then the policy $$\pi$$ is a conditional distribution $$\pi(a_t \vert s_t)$$ of actions $$a_t \in \mathcal{A}$$ conditioned by states $$s_t \in \mathcal{S}$$. The rewards are a real-valued function

$$
\begin{equation}
r : \mathcal{S} \times \mathcal{A} \rightarrow \mathbb{R}
\end{equation}
$$

The *objective* of RL problems is to maximize the sum of future rewards, *learning* a good policy $$\pi$$, through trial and error, using the size of rewards to *reinforce* good actions. 

## Markov Dynamic Processes

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

This formulation is still flexible enough to provide good models. If the process is not Markov, and $$s_{t+1}$$ depends on additional information than $$(s_t,a_t)$$, the state space can often be extended to turn the process into an MDP. The CartPole process, for example, is a Markov process, because the next state is an exact function of the current state and action.

In an MDP, $$P(s_{t+1} \vert s_t,a_t)$$ represents the state transition distribution.

A Markov Decision Process (MDP) consists, in general, of
* A set of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$
* A distribution of the initial state $$d(s_0)$$
* A state transition distribution $$P(s_{t+1} \vert s_t, a_t)$$ representing the probability of arriving to state $$s_{t+1}$$ fron $$s_{t}$$ when applying action $$a_t$$
* A reward function $$r : \mathcal{S} \times \mathcal{A} \rightarrow \mathbb{R}$$ denoting the reward obtained when applying action $$a_t$$ in state $$s_t$$.

Agents do not have direct access to the state transition distribution (\ref{eq:state_transition_dist}). It can, however, be sampled.

A sequence of states and actions defines a possibly infinite trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0), (s_{1}, a_{1}), ... , (s_T, a_T)
\end{equation}
$$

The trajectory distribution for a given policy $$\pi$$ is given by

$$
\begin{equation} \label{eq:taudist1}
p_\pi(\tau) = d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t, s_{t-1}, a_{t-1}, ..., s_0, a_0)
\end{equation}
$$

which, by the Markov assumption, reduces to

$$
\begin{equation} \label{eq:taudist}
p_\pi(\tau) = d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t)
\end{equation}
$$


## Rewards and the Objective Function

In RL problems, action $$a_t$$ is picked not just to maximize next reward $r(s_t, a_t)$, but the sum of all future rewards $$r(s_{t}, a_{t}) + r(s_{t+1}, a_{t+1}) + ...$$. If the number of steps is infinite, even if all rewards are bounded, the sum may not converge. It is convenient, then, to discount rewards by a factor $$0 \le \gamma \le 1$$, which is $$\lt 1$$ if the number of steps is infinite, and define the *return* of a trajectory $$\tau = (s_t, a_t), ... , (s_T, a_T)$$ that starts at step $$t$$ as:

$$
\begin{equation} \label{eq:traj_return}
R_t(\tau) = r(s_{t}, a_{t}) + {\gamma}r(s_{t+1}, a_{t+1}) + {\gamma^2}r(s_{t+2}, a_{t+2}) + ... + {\gamma^{T-t}}r(s_{T}, a_{T})
\end{equation}
$$

We write $R_0(\tau) = R(\tau)$, for convenience.

The larger the discount factor $$\gamma$$, the larger the effect of later steps. The smaller the discount factor, the bigger weight is given to actions taken for the immediate next steps.

When the number of steps is infinite, and rewards are bounded by $$-M \le r(s_t, a_t) \le M$$ for all $$t$$, then

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

Same bounds hold for $$R_t(\tau)$$. 

## The Objective and Value Functions

When trajectories $$\tau$$ are sampled according to a policy $$\pi$$, the *objective* function is defined as the expected value of the return function, sampled over the policy distribution $$p_\pi(\tau)$$ defined by ($$\ref{eq:taudist}$$):

$$
\begin{equation} \label{eq:objective}
J_\pi = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)]
\end{equation}
$$

The goal of the agent is to maximize the objective function $$J_\pi$$. If we fix the initial state $$s$$, or the pair $$(s, a)$$ of initial state and initial action, we define the *value* function 

$$
\begin{equation} \label{eq:value_state}
V_\pi(s) = \mathbb{E}_{s_0=s, \tau \sim \pi}[R(\tau)] = \mathbb{E}_{s_0=s, \tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)]
\end{equation}
$$

and the *action-value* function

$$
\begin{equation} \label{eq:value_state_action}
Q_\pi(s, a) = \mathbb{E}_{s_0=s, a_0=a, \tau \sim \pi}[R(\tau)] = \mathbb{E}_{s_0=s, a_0=a, \tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)]
\end{equation}
$$

$$V_\pi(s)$$ evaluates how good the state $$s$$ is, and $$Q_\pi(s, a)$$ evaluates how good action $$a$$ is in state $$s$$, both according to the policy $$\pi$$.

## The Bellman Equations

Recall that $$\tau$$ denotes a trajectory $$s_0, a_0, ...$$

When $$s_0$$ is fixed, we denote for convenience $$\tau_{>s_t}$$ for the truncated data set $$a_t, s_{t+1}, ...$$ and $$\tau_{>a_t}$$ for the truncated trajectory $$s_{t+1}, a_{t+1}, ...$$

The objective $$J_\pi$$, the value $$V_\pi(s)$$ and the action-value $$Q_\pi(s, a)$$ functions are interrelated. To show that, we express them in terms of the trajectory distribution $$p_\pi(\tau)$$ of ($$\ref{eq:taudist}$$).

$$
\begin{align}
J_\pi & = \int_\tau \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(\tau) d\tau \hspace{1cm} & (definition \, of \, expectation) \\
& = \int_\tau \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau \hspace{1cm} & (definition \, of \, p_\pi(\tau)) \\
& = \int_{s_0, a_0, s_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau \hspace{1cm} & (definition \, of \, p_\pi(\tau)) \\
& = \int_{s_0} d(s_0) \int_{a_0, s_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>s_0} \hspace{1cm} & (Fubini) \\
& =   \int_{s_0} d(s_0) V_\pi(s_0) & (definition \, of \,  V_\pi(s_0)) \\
& =   \int_{s} V_\pi(s) ds& (relabel \, s_0) \\
\end{align}
$$

This says that $$J_\pi$$ is the expected value of $$V_\pi(s)$$ over all states $$s$$. We also have:

$$
\begin{align}
V_\pi(s_0) & = \int_{a_0, s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(\tau_{>s_0}) d\tau_{>s_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = \int_{a_0, s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>s_0} \hspace{1cm} & (definition \, of \, p_\pi(\tau_{>s_0})) \\
& = \int_{a_0} (\int_{s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0})da_0 \hspace{1cm} & (Fubini) \\
& = \int_{a_0} Q_\pi(s_0, a_0) da_0 \hspace{1cm} & (definition \, of \, Q_\pi(s_0, a_0)) \\
\end{align}
$$

Relabeled, this says that
$$
\begin{align} \label{eq:v_bellman}
V_\pi(s) = \int_a Q_\pi(s, a) da
\end{align}
$$

which means that $$V_\pi(s)$$ is the expected value of $$Q_\pi(s, a)$$ over all actions $$a$$ in state $$s$$. And we can also express $$Q_\pi(s, a)$$ in terms of $$V_\pi$$, but, for the last step, we assume that the number of steps $$T$$ is infinite, for exact equality:

$$
\begin{align}
Q_\pi(s_0, a_0) & = \int_{s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(\tau_{>a_0}) d\tau_{>a_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = r(s_0, a_0) \int_{s_1, a_1, ...} p_\pi(\tau_{>a_0}) d\tau_{>a_0} + \gamma \int_{s_1, a_1, ...} \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (definition \, of \, p_\pi(\tau_{>a_0})) \\
& = r(s_0, a_0) + \gamma \int_{s_1, a_1, ...} \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (integral \, of \, p_\pi(\tau_{>a_0}) \, is \, 1) \\
& = r(s_0, a_0) + \gamma \pi(a_0 \vert s_0) \int_{s_1, a_1, ...} P(s_{1} \vert s_0, a_0) \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) \prod_{t=1}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (bring \, out \, \pi(a_0 \vert s_0)) \\
& \approx r(s_0, a_0) + \gamma \pi(a_0 \vert s_0) \int_{s_1} P(s_{1} \vert s_0, a_0) V_\pi(s_1) ds_1 \hspace{1cm} & (definition \, of \, V_\pi(s_1)) \\
\end{align}
$$

The result is an approximation because the sum and product under the integral are over $$T-1$$ steps. When the number of steps $$T$$ is infinite, if $$\gamma \lt 1$$, we get

$$
\begin{align} \label{eq:q_bellman}
Q_\pi(s, a) & = r(s, a) + \gamma \pi(a \vert s) \int_{s'} P(s' \vert s, a) V_\pi(s') ds' \\
\end{align}
$$

The equations (\ref{eq:v_bellman}), (\ref{eq:q_bellman}) are called the Bellman equations.

This page was created with
* Diagram software from [draw.io](https://draw.io)
* [MathJax](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html) for LaTeX typesetting
  * To check LaTeX expressions, use this [web form](https://cdn.rawgit.com/mathjax/MathJax/2.7.1/test/sample-dynamic-2.html) or [this form](http://mathb.in/29559)
  * List of [mathematical fonts](https://www.overleaf.com/learn/latex/Mathematical_fonts)
