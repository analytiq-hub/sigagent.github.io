---
layout: post
mathjax: true
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

## What is Reinforcement Learning?
In machine learning, typically, what is learned is data - for example text, speech or images. *Reinforcement learning* is a special case of machine learning where what is learned are *processes*, using a *reward* function to determie the optimal state.

## The CartPole example
![CartPole](/src/images/cartpole.png)

In the CartPole example, a pole is balanced on top of a cart. The environment is two-dimensional. The cart needs to be moved left or right to balance the pole.
* The *objective* is to keep the pole upright
* The *state* is represented by (cart position, cart speed, pole angle, pole angular speed)
* The *action* is to move the cart a unit of distance to the left, or a unit of distance to the right
* The *reward* is $$+1$$ for each step the pole remains upright (i.e., does not tip for more than a fixed angle)

## Formulation of the problem
In reinforcement learning (RL), an agent in state $$s_t$$ acts with action $$a_t$$, and moves to state $$s_{t+1}$$, with reward $$r_{t+1}$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](/src/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue for an infinite number of steps. The agent's function that maps states to actions is called *policy*, denoted $$\pi$$. The goal of the policy $$\pi$$ is to maximize rewards - for the next step, as well as all future steps.

If we denote $$\mathcal{S}_t, \mathcal{A}_t$$ the set of states and actions at step $$t$$, then the policy $$\pi$$ is then a family of functions

$$
\begin{equation}
\pi_t : \mathcal{S}_t \rightarrow \mathcal{A}_t
\end{equation}
$$

which attempts to maximize the rewards. To simplify notation, drop the index $$t$$, and denote $$\mathcal{S}, \mathcal{A}$$ the families of sets of states, actions, and rewards. The policy is a family of functions

$$
\begin{equation}
\pi : \mathcal{S} \rightarrow \mathcal{A} 
\end{equation}
$$

A sequence of *experiences* $$(s_t, a_t, r_{t+1})$$ defines a trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0, r_1), (s_1, a_1, r_2), (s_2, a_2, r_3), ...
\end{equation}
$$

Note that some sources label the reward for action $$a_t$$ as $$r_t$$ instead of $$r_{t+1}$$.

The *objective* of RL problems is to maximize rewards, performing more optimal actions at each step, and *learning* a good policy $$\pi$$, through trial and error, using the magnitude of rewards to *reinforce* good actions.

## Reinforcement Learning as an MDP

The states $$\mathcal{S}$$, in practice, can only be estimated, stocastically, up to a measurement error:

$$
\begin{equation}
s_{t+1} \sim P(s_{t+1} \vert (s_0,a_0),(s_1,a_1),...,(s_t,a_t))
\end{equation}
$$

At each step, the state $s_{t+1}$ is sampled from a probability distribution $$P$$ conditoned on past states and actions. To simplify things, we assume that all the information in past states and actions is subsumed into $$(s_t, a_t)$$, turning the process into a Markov Dynamic Process (MDP):

$$
\begin{equation} \label{eq:state_transition_dist}
s_{t+1} \sim P(s_{t+1} \vert s_t,a_t)
\end{equation}
$$

This formulation is still flexible enough to provide good models. When $$s_{t+1}$$ depends on additional information than $$(s_t,a_t)$$, for example, on $$s_{t-1}$$ and $$s_{t-2}$$, the state space $$\mathcal{S_t}$$ can be expanded into $$\mathcal{S}_t^{\prime} = \mathcal{S_t} \cup \mathcal{S_{t-1}} \cup \mathcal{S_{t-2}}$$, yielding again an MDP. 

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

In our case, the rewards will simply be a function $$r_{t+1} : \mathcal{A}_{t} \rightarrow \mathbb{R}$$.

Agents do not have direct access to the state transition distribution (\ref{eq:state_transition_dist}) or to the reward distribution (\ref{eq:reward_dist}). These can, however, be sampled.

The goal of the agent is to maximize the return $$R(\tau)$$ of its trajectory $$\tau$$, defined in (\ref{eq:traj_return}). The *objective* $$J(\tau)$$ is defined as the expected value over all trajectories $$\tau$$:

$$
\begin{equation} \label{eq:objective_dist}
J(\tau) = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau}[\sum_{t=1}^{T+1} \gamma^t r_t]
\end{equation}
$$

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

Similar bounds hold for $$R_t(\tau)$$. When the discount factor $$\gamma \in [0, 1)$$ is close to $$1$$, future states have larger weight in the trajectory return. When $$\gamma$$ is close to $$0$$, next state has a larger weight.

## The Objective Function in REINFORCE

In MDP problems, assuming that trajectories $$\tau$$ are sampled according to a policy $$\pi$$, the *objective* function is defined as the expected value of the return function:

$$
\begin{equation}
J(\pi) = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau \sim \pi}[\sum_{t=1}^{T+1} \gamma^{t-1} r_t]
\end{equation}
$$

...


This page was created with
* Diagram software from [draw.io](https://draw.io)
* [MathJax](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html) for LaTeX typesetting
  * To check LaTeX expressions, use this [web form](https://cdn.rawgit.com/mathjax/MathJax/2.7.1/test/sample-dynamic-2.html) or [this form](http://mathb.in/29559)
  * List of [mathematical fonts](https://www.overleaf.com/learn/latex/Mathematical_fonts)
