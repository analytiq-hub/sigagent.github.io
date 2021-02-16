---
layout: post
mathjax: true
title: "Introduction to Reinforcement Learning"
author:
- Andrei Radulescu-Banu
---

This post is part of a series dealing with Reinforcement Learning:
- [Introduction to Reinforcement Learning](/machine_learning/2021/02/13/introduction_to_machine_learning/)
- [RL: Value Learning Algorithms](/machine_learning/2021/02/14/value_learning_algorithms/)
- [RL: The REINFORCE Algorithm](/machine_learning/2021/02/14/reinforce/)

## Sources
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). Theory and examples, with implementations using [OpenAI Gym](https://gym.openai.com/), pytorch, tensorflow, and [SLM Lab](https://github.com/andrei-radulescu-banu/SLM-Lab)
  * To run code: `docker run -it --name ubuntu_16_04 ubuntu:16.04` then follow install instructions [here](https://github.com/andrei-radulescu-banu/SLM-Lab).
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018). Clear presentation, builds up from simple example. Authors are major contributors in the field. David Silver (AlphaZero architect) says he read their 1st edition as a first step to learn about RL.
* [Fundamentals of Machine Learning for Predictive Data Analytics](https://www.amazon.com/Fundamentals-Machine-Learning-Predictive-Analytics/dp/0262044692/ref=asc_df_0262044692/), J.D. Kelleher et al (2020). Nice survey of ML. Chap 11 on RL: Markov Decision Processes (MDP), Bellman Equations, Temporal-Difference Learning, Q-Learning, SARSA, Deep Q-Networks (DQN)
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). High level, very clear presentation. Deep Q-Learning (DQN), Policy Gradient (PG), AlphaGo & AlphaZero
* MIT 6.S091: [Introduction to Deep Reinforcement Learning](https://www.youtube.com/watch?v=zR11FLZ-O9M&t=2130s), Lex Fridman (2019). Explains well how a small change in reward function gives completely different policy.
* [RL Course by David Silver](https://www.youtube.com/watch?v=2pWv7GOvuf0) (2015)
* [David Silver: AlphaGo, AlphaZero, and Deep Reinforcement Learning](https://www.youtube.com/watch?v=uPUEq8d73JI&t=2499s), Lex Fridman Podcast #86 (2020)
* [A (Long) Peek into Reinforcement Learning](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html), L. Weng (2018)
* [Offline Reinforcement Learning: Tutorial, Review,and Perspectives on Open Problems](https://arxiv.org/pdf/2005.01643.pdf), Sergey Levine et al (2020). Explains how RL is modified for offline learning.

Most books available at [https://b-ok.cc](https://b-ok.cc).

## What is Reinforcement Learning?
In machine learning, there are three types of learning tasks:
- Supervised learning (given a set of annotated input, learn to predict output)
- Unsupervised learning (discover a good representation of the input)
- Reinforcement learning (learn to select actions that maximize reward)

In supervised & unsupervised learning, the object being learned is data - for example text, speech, images. In *reinforcement learning* (RL), what is learned are *processes*, using a *reward* function to determie the optimal actions.

## The CartPole example
<p align="center">
<img width="350" height="250" src="/src/images/cartpole.gif"><br>
(<a href="https://www.analyticsvidhya.com/blog/2020/11/reinforce-algorithm-taking-baby-steps-in-reinforcement-learning/">Image source</a>)
</p>

In this example, a pole is balanced on top of a cart. The environment is two-dimensional. The cart needs to be moved left or right to balance the pole.
* The *objective* is to keep the pole upright
* The *state* is represented by (cart position, cart speed, pole angle, pole angular speed)
* The *action* is to move the cart a unit of distance to the left, or a unit of distance to the right
* The *reward* is $$+1$$ for each step the pole remains upright (i.e., does not tip for more than a fixed angle)

Over multiple learning episodes, the agent learns to balance the pole. This is a simple example when the neural network (NN) training does not require a GPU, and learning can be reasonably achieved within around 200 episodes. The algorithm used is REINFORCE.

## Formulation of the problem
In reinforcement learning (RL), an agent in state $$s_t$$ acts with action $$a_t$$, gets reward $$r(a_t, s_t) \in \mathbb{R}$$, and moves to state $$s_{t+1}$$. The cycle then continues, creating a feedback loop:

<p align="center">
<img width="350" height="250" src="/src/diagrams/reinforce_learning_control_loop.png"><br>
(<a href="https://www.analyticsvidhya.com/blog/2020/11/reinforce-algorithm-taking-baby-steps-in-reinforcement-learning/">Image source</a>)
</p>

The process can end after a finite number of steps $$T$$, or can continue indefinitely. The agent's goal is to learn a policy $$\pi(a_t \vert s_t)$$ that defines the distribution of actions $$a_t$$ conditioned by state $$s_t$$, with the goal of maximizing the sum of all rewards for the next steps $$r(s_t, a_t) + r(s_{t+1}, a_{t+1}) + ... + r(s_T, a_T)$$.

If we denote $$\mathcal{S}, \mathcal{A}$$ the set of states and actions, then the policy $$\pi$$ is a conditional distribution $$\pi(a_t \vert s_t)$$ of actions $$a_t \in \mathcal{A}$$ conditioned by states $$s_t \in \mathcal{S}$$. The rewards are a real-valued function

$$
\begin{equation}
r : \mathcal{S} \times \mathcal{A} \rightarrow \mathbb{R}
\end{equation}
$$

The *objective* of RL problems is to maximize the sum of future rewards, *learning* a good policy $$\pi$$, through trial and error, using the size of rewards to *reinforce* good actions. 

## Markov Decision Processes

The states $$s_{t+1}$$, in practice, can only be estimated, stocastically, up to a measurement error:

$$
\begin{equation}
s_{t+1} \sim P(s_{t+1} \vert (s_0,a_0,s_1,a_1,...,s_t,a_t)
\end{equation}
$$

At each step, the state $s_{t+1}$ is sampled from a probability distribution $$P$$ conditoned on past states and actions. To simplify things, we assume that all the information from past states and actions is subsumed into $$(s_t, a_t)$$, turning the process into a Markov Decision Process (MDP):

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

Here is an example of a finite MDP (<a href="https://medium.com/ai%C2%B3-theory-practice-business/reinforcement-learning-part-3-the-markov-decision-process-9f5066e073a2">source</a>): the nodes are states $$s$$, the arrows are actions $$a$$ labeled with $$P(s' \vert s, a)$$, and the ribbons (and bombs) are the rewards $$r(s, a)$$.
<p align="center">
<img src="/src/images/example_mdp.jpg">
</p>

Agents do not always have direct access to the state transition distribution (\ref{eq:state_transition_dist}). It can, however, be sampled.

A sequence of states and actions defines a possibly infinite trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0, s_{1}, a_{1}, ... , s_T, a_T)
\end{equation}
$$

The trajectory distribution for a given policy $$\pi$$ is given by

$$
\begin{equation} \label{eq:taudist1}
p_\pi(\tau) = d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) \prod_{t=0}^{T-1} P(s_{t+1} \vert s_t, a_t, s_{t-1}, a_{t-1}, ..., s_0, a_0)
\end{equation}
$$

which, by the Markov assumption, reduces to

$$
\begin{equation} \label{eq:taudist}
p_\pi(\tau) = d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t)  \prod_{t=0}^{T-1} P(s_{t+1} \vert s_t, a_t)
\end{equation}
$$

Figuring out the product limits $$\prod_{t=0}^T$$ or $$\prod_{t=0}^{T-1}$$ may seem jarring at first view, but it is good to write them down, nevertheless. When the algorithms are programmed, they become $$for$$ loop limits, and have to be figured out anyway.

## Truncated trajectories

The formulas in this section are necessary for later deriving the Bellman equations. Trajectories can be truncated to $$\tau_{>s_t} = (a_t, s_{t+1}, ... , s_T, a_T)$$ and $$\tau_{>a_t} = (s_{t+1}, a_{t+1}, ... , s_T, a_T)$$. The probabilities of the truncated trajectories are:

$$
\begin{align} \label{eq:taudists}
p_\pi(\tau_{>s_t} \vert s_t) = \prod_{t'=t}^T \pi(a_{t'} \vert s_{t'}) \prod_{t'=t}^{T-1}  P(s_{t'+1} \vert s_{t'}, a_{t'}) \\
\end{align}
$$

$$
\begin{align} \label{eq:taudistsa}
p_\pi(\tau_{>a_t} \vert s_t, a_t) = \prod_{t'=t+1}^T \pi(a_{t'} \vert s_{t'}) \prod_{t'=t}^{T-1} P(s_{t'+1} \vert s_{t'}, a_{t'}) \\
\end{align}
$$

Trajectories can also be truncated down: $$\tau_{\le a_t} = (s_0, a_0, ... , s_{t}, a_{t})$$.

## Rewards and the Agent Objective

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

## The Agent Objective and the Value Functions

When trajectories $$\tau$$ are sampled according to a policy $$\pi$$, the agent *objective* is defined as the expected value of the return function, sampled over the policy distribution $$p_\pi(\tau)$$ defined by ($$\ref{eq:taudist}$$):

$$
\begin{equation} \label{eq:objective}
J_\pi = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)]
\end{equation}
$$

The goal of the agent is to maximize the objective $$J_\pi$$. If we fix the initial state $$s$$, or the pair $$(s, a)$$ of initial state and initial action, we define the *state-value* function 

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

## Expressing value functions as integrals

Recall that $$\tau$$ denotes a trajectory $$s_0, a_0, ...$$

When $$s_0$$ is fixed, we denote for convenience $$\tau_{>s_t}$$ for the truncated data set $$a_t, s_{t+1}, ...$$ and $$\tau_{>a_t}$$ for the truncated trajectory $$s_{t+1}, a_{t+1}, ...$$

The expectation of a function $$f(x)$$ over a probability density $$p(x)$$ is defined as

$$
\begin{align}
\mathbb{E}_p (f) = \int_x f(x) p(x) dx
\end{align}
$$

In most examples, the sample space for $$x$$ is finite, in which case the integral $$\int$$ becomes a sum $$\sum$$. 

Applying the definition of density to objective $$J_\pi$$, the state-value $$V_\pi(s)$$ and the action-value $$Q_\pi(s, a)$$ functions, we get:

$$
\begin{align}
J_\pi & = \int_\tau \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau \hspace{1cm} & (definition \, of \, expectation) \\
& = \sum_{t=0}^{T} \int_{\tau}  \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau \hspace{1cm} & (bring \, sum \, out) \\
& = \sum_{t=0}^{T} \int_{\tau_{\le a_t}} \int_{\tau_{> a_t}} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau_{\le a_t} d\tau_{>a_t} \hspace{1cm} & (product \, of \, truncated \, densities \, d\tau = d\tau_{\le a_t} d\tau_{>a_t}) \\
& = \sum_{t=0}^{T} \{ \int_{\tau_{\le a_t}} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau_{\le a_t} \}\{\int_{\tau_{> a_t}} d\tau_{>a_t}\} \hspace{1cm} & (Fubini \, for \, d\tau = d\tau_{\le a_t} d\tau_{>a_t}) \\
& = \sum_{t=0}^{T} \int_{\tau_{\le a_t} = s_0, a_0, ... , a_t} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau_{\le a_t} \hspace{1cm} & (density \, d\tau_{>a_t} \, has \, \int_{\tau_{> a_t}} d\tau_{>a_t}=1) \\
\end{align}
$$

Same arguments give:

$$
\begin{align} 
V_\pi(s_0) & = \int_{\tau_{>s_0} = a_0, s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>s_0}) d\tau_{>s_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = \sum_{t=0}^{T}\int_{\tau_{>s_0 \le a_t} = a_0, s_1, a_1, ... , a_t}  \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>s_0}) d\tau_{>s_0 \le a_t} \hspace{1cm} & (integration \, over \, truncated \, trajectories \, \tau_{>s_0 \le a_t} = a_0, s_1, a_1, ... , a_t) \\
\end{align}
$$

And:

$$
\begin{align} 
Q_\pi(s_0, a_0) & = \int_{s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(\tau_{>a_0}) d\tau_{>a_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = \sum_{t=0}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>a_0}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (integration \, over \, truncated \, trajectories \, \tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t) \\
& = r(s_0,a_0) + \sum_{t=1}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>a_0}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (s_0, a_0 \, independent \, of \tau_{>a_0 \le a_t} \, and \, density \, d\tau_{>a_0 \le a_t} \, has \int d\tau_{>a_0 \le a_t} = 1) \\
\end{align}
$$

## The Bellman Equations

The objective $$J_\pi$$, the state-value $$V_\pi(s)$$ and the action-value $$Q_\pi(s, a)$$ functions  are interrelated. To show that, we express them in terms of the trajectory distribution $$p_\pi(\tau)$$ of ($$\ref{eq:taudist}$$).

$$
\begin{align}
J_\pi & = \int_\tau \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau \hspace{1cm} & (definition \, of \, expectation) \\
& = \int_{\tau = (s_0, a_0, s_1, ...)} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) d(s_0) \prod_{t'=0}^t \pi(a_{t'} \vert s_{t'}) \prod_{t'=0}^{t-1} P(s_{t'+1} \vert s_{t'}, a_{t'}) d\tau \hspace{1cm} & (expand \, p_\pi(s_t, a_t \vert \tau)) \\
& = \int_{s_0} \{ \int_{\tau_{>s_0} = (a_0, s_1, ...)} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) \prod_{t'=0}^t \pi(a_{t'} \vert s_{t'}) \prod_{t'=0}^{t-1} P(s_{t'+1} \vert s_{t'}, a_{t'}) d\tau_{>s_0} \} ds_0 \hspace{1cm} & (Fubini \, for \, d\tau = d\tau_{>s_0} ds_0) \\
& =   \int_{s_0} V_\pi(s_0) ds_0 & (definition \, of \,  V_\pi(s_0)) \\
& =   \int_{s} V_\pi(s) ds& (relabel \, s_0) \\
\end{align}
$$

This says that $$J_\pi$$ is the expected value of $$V_\pi(s)$$ over all states $$s$$. We also have:

$$
\begin{align} 
V_\pi(s_0) & = \int_{\tau_{>s_0} = a_0, s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>s_0}) d\tau_{>s_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = \int_{a_0} \{ \int_{\tau_{>a_0} = s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>s_0}) d\tau_{>a_0} \} da_0 \hspace{1cm} & (Fubini \, for \, d \tau_{>s_0} = d \tau_{>a_0} da_0) \\
& = \int_{a_0} Q_\pi(s_0, a_0) da_0 \hspace{1cm} & (definition \, of \, Q_\pi(s_0, a_0)) \\
\end{align}
$$

Relabeled, this says that 
$$
\begin{align} \label{eq:vq_bellman}
V_\pi(s) = \int_a Q_\pi(s, a) da
\end{align}
$$

which means that $$V_\pi(s)$$ is the expected value of $$Q_\pi(s, a)$$ over all actions $$a$$ in state $$s$$. And we can also express $$Q_\pi(s, a)$$ in terms of $$V_\pi$$:

$$
\begin{align}
Q_\pi(s_0, a_0) & = \int_{s_1, a_1, ...} \sum_{t=0}^{T} \gamma^{t} r(s_t, a_t) p_\pi(\tau_{>a_0}) d\tau_{>a_0} \hspace{1cm} & (definition \, of \, expectation) \\
& = r(s_0,a_0) + \sum_{t=1}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>a_0}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (as \, shown \, before) \\
& = r(s_0, a_0) + \gamma \sum_{t=1}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} \gamma^{t-1} r(s_t, a_t) \prod_{t'=1}^t \pi(a_{t'} \vert s_{t'}) \prod_{t'=0}^t P(s_{t'+1} \vert s_{t'}, a_{t'}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (definition \, of \, p_\pi(\tau_{>a_0 \le a_t})) \\
& = r(s_0, a_0) + \gamma \sum_{t=1}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} P(s_{1} \vert s_0, a_0) \gamma^{t-1} r(s_t, a_t) \prod_{t'=1}^t \pi(a_{t'} \vert s_{t'}) \prod_{t'=1}^t P(s_{t'+1} \vert s_{t'}, a_{t'}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (bring \, P(s_1 \vert s_0,a_0) \, out \, of \, \prod_{t'=0}^t) \\
& = r(s_0, a_0) + \gamma \sum_{t=1}^{T} \int_{\tau_{>a_0 \le a_t} = s_1, a_1, ..., a_t} P(s_{1} \vert s_0, a_0) \gamma^{t-1} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau_{>a_0 \le a_t}) d\tau_{>a_0 \le a_t} \hspace{1cm} & (replace \, with \, p_\pi(s_t, a_t \vert \tau_{>a_0 \le a_t})) \\
& \approx r(s_0, a_0) + \gamma \int_{s_1} P(s_{1} \vert s_0, a_0) V_\pi(s_1) ds_1 \hspace{1cm} & (definition \, of \, V_\pi(s_1) \, for \, T-1) \\
& = r(s_0, a_0) + \gamma \int_{s_1, a_1} P(s_{1} \vert s_0, a_0) Q_\pi(s_1, a_1) ds_1 da_1 \hspace{1cm} & (V_\pi(s_1) \, as \, expected \, value \, of \, Q_\pi(s_1, a_1) \, over \, a_1) \\
\end{align}
$$

The result is an approximation because the sum and product under the integral are over $$T-1$$ steps. When the number of steps $$T$$ is infinite, if $$\gamma \lt 1$$, we get

$$
\begin{align} \label{eq:q_bellman}
Q_\pi(s, a) & = r(s, a) + \gamma \int_{s',a'} P(s' \vert s, a) Q_\pi(s',a') ds'da' \\
\end{align}
$$

The equations (\ref{eq:v_bellman}), (\ref{eq:q_bellman}) are the Bellman equations for $$J_\pi$$ and $$Q_\pi(s, a)$$. Plugging back into the equation for $$V_\pi(s)$$ we get

$$
\begin{align} 
V_\pi(s) & = \int_a Q_\pi(s, a) da & \\
& = \int_a \{ r(s, a) + \gamma \int_{s',a'} P(s' \vert s, a) Q_\pi(s',a') ds'da'\}da & (expand \, Q_\pi(s, a))\\
& = \int_a \{ r(s, a) + \gamma \int_{s'} P(s' \vert s, a) \{ \int_{a'}  Q_\pi(s',a') da' \} ds'\}da & (Fubini \, for \, da'ds')\\
& = \int_a \{ r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'\}da & (regroup \, V_\pi(s')) \\
\end{align}
$$

This gives us the Bellman equation for $$V_\pi(s)$$:
$$
\begin{align} \label{eq:v_bellman}
V_\pi(s) = \int_a \{ r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'\} da \\
\end{align}
$$

## Deep learning RL algorithms

Deep learning algorithms for RL problems fall into three main classes:
- Value based
- Policy based
- Model based

The taxonomy below is from [Foundations of Deep RL](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381). See Sec. 1.4 in there for a more in depth discussion.

### Value based algorithms
This class of algorithms learn the action-value functions $$Q_\pi(s, a)$$. A policy $$\pi(a \vert s)$$ could be picked, for example, to  maximizes the action-value $$Q_\pi(s, a)$$ in all states $$s$$. It is less common to lear $$V_\pi(s)$$ and infer the policy $$\pi$$.

Example value based algorithms:
- Q-Learning
- SARSA
- Deep Q Networks (DQN)
- Variants of DQN: Double DQN, DQN with Prioritized Experience Replay (PER)

In the algorithms above, the set of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$  must be finite. More recently, value based algorithms like QT-OPT have become available and can be applied to continuous action spaces $$\mathcal{A}$$.

This class of algorithms are more sample efficient. They work well if $$Q_\pi(s, a)$$ can be maximized without having to look ahead many action steps.

### Policy based algorithms
These algorithms learn a policy $$\pi$$ that maximizes the agent objective $$J_\pi$$. Example algorithm:
- REINFORCE

In this class of algorithms, the space of actions $$\mathcal{A}$$ can be either continuous or discrete. The disadvantage is that these algorithms have high variance and are sample inefficient.

### Model based algorithms
These algorithms either know the environment dynamics $$P(s' \vert s, a)$$, or learn it.
- Monte Carlo Tree Search (MCTS) is used when the space of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$ are finite, and the transition functions $$P(s' \vert s, a)$$ are known. In the past, MCTS was used for board games (Chess, Go).
- Linear Quadratic Regulators (iLQR), Model Predictve Control (MPC) involve learning $$P(s' \vert s, a)$$.

Models are often unavailable, or can't be learned. If they are, however, and if the number of states and actions is small, then model-based algorithms are an order of magnitude more efficient than value or policiy based algorithms.

Model-based algorithms, effectively, simulate the environment. If the estimation errors are small, the algorithm learned in simulation will work well when run in the actual environment. However, the estimation errors can compound quickly over several steps of actions.

### Combined algoritms
- Actor-Critic methods use value and policy based methods. The policy (the 'actor') is learned using feedback from a learned action-value function (the 'critic').
- AphaGo, AlphaZero use a combination of supervised learning, RL model, value and policy based algorithms, and self-play.

