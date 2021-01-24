---
layout: post
mathjax: true
title: "REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

The source of this post is [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), a nice book by Laura Graesser and Wah Loon Keng. I'm working through Chapter 2, practicing the REINFORCE algorithm.

## What is Reinforcement Learning?
In machine learning, typically, what is learned are text, speech or images. Reinforcement learning is a special case of machine learning where what is learned are *processes*, using a *reward* function to determie the optimal state.

## The CartPole example
![CartPole](/src/images/cartpole.png)

In the CartPole example, a pole is balanced on top of a cart. The environment is two-dimensional. The cart needs to be moved left or right to balance the pole.
* The *objective* is to keep the pole upright
* The *state* is represented by (cart position, cart speed, pole angle, pole angular speed)
* The *action* is to move the cart a unit of distance to the left, or a unit of distance to the right
* The *reward* is $$+1$$ for each step the pole remains upright (i.e., does not tip for more than a fixed angle)

## Formulation of the problem
In reinforcement learning, an agent in state $$s_t$$ acts with action $$a_t$$, and receives reward $$r_t$$. The cycle then continues, creating a feedback loop:

![Reinforce Learning Control Loop](/src/diagrams/reinforce_learning_control_loop.png)

The process can end after a finite number of steps $$T$$, or can continue for an infinite number of steps. The agent's function that maps states and rewards to actions is called *policy*, denoted $$\pi$$.

If we denote $$\mathcal{S}_t, \mathcal{A}_t$$ the set of states and actions at step $$t$$, then the policy $$\pi$$ is a family of functions

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

A sequence of *experiences* $$(s_t, a_t, r_t)$$ defines a trajectory

$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0, r_0), (s_1, a_1, r_1), (s_2, a_2, r_2), ...
\end{equation}
$$

The *objective* of RL problems is to maximize the sum of rewards over all steps, performing more optimal actions at each step, and *learning* a good policy $$\pi$$, through trial and error, using the magnitude of rewards to *reinforce* good actions.

It is convenient to discount rewards by a factor $$0 \le \gamma$$, and define the *return* of a trajectory $$\tau$$ as:

$$
\begin{equation} \label{eq:traj_return}
R(\tau) = r_0 + {\gamma}r_1 + {\gamma^2}r_2 + ... + {\gamma^T}r_T
\end{equation}
$$

The larger the discount factor $$\gamma$$, the larger the effect of later steps.

When the number of steps is infinite, the sum of rewards $$r_0 + r_1 + r_2  + ...$$ can be infinite, even when $$r_t$$ are bounded $$-M \lt r_t \lt M$$ for all $$0 \le t$$. In this case, we must pick a discount factor $$0 \le \gamma \lt 1$$, and

$$
\begin{equation}
-M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T}) \lt R(\tau) \lt M(1 + {\gamma} + {\gamma^2} + ... + {\gamma^T})
\end{equation}
$$

or

$$
\begin{equation}
-M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}} \lt R(\tau) \lt M \frac{1-\gamma^{T+1}}{1-\gamma \phantom{(9)}}
\end{equation}
$$

ensuring that $$R(\tau)$$ remains finite:

$$
\begin{equation}
-M \frac{1}{1-\gamma} \lt R(\tau) \lt M \frac{1}{1-\gamma}
\end{equation}
$$


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

This formulation is still flexible enough to provide good models. $$P(s_{t+1} \vert s_t,a_t)$$ represents the state transition distribution. The state $$s_{t+1}$$ determines a reward function, with real number values:

$$
\begin{equation}
r_{t+1} : \mathcal{S}_{t+1} \rightarrow \mathbb{R}
\end{equation}
$$

Since states are stochastic, the reward function is represented by a distribution:

$$
\begin{equation} \label{eq:reward_dist}
\mathcal{R}_{t+1}(s_t, a_t, s_{t+1})
\end{equation}
$$

Agents do not have direct access to the state transition distribution (\ref{eq:state_transition_dist}) or to the reward distribution (\ref{eq:reward_dist}). These can, however, be sampled.

The goal of the agent is to maximize the return $$R(\tau)$$ of its trajectory $$\tau$$, defined in (\ref{eq:traj_return}). The *objective* $$J(\tau)$$ is defined as the expected value over all trajectories $$\tau$$:

$$
\begin{equation} \label{eq:objective_dist}
J(\tau) = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau}[\sum_{t=0}^{T} \gamma^t r_t]
\end{equation}
$$

...

REINFORCE is perhaps the most basic algorithm for deep reinforcement learning.

...


This page was created with
* Diagram software from [draw.io](https://draw.io)
* [MathJax](http://sgeos.github.io/github/jekyll/2016/08/21/adding_mathjax_to_a_jekyll_github_pages_blog.html) for LaTeX typesetting
  * To check LaTeX expressions, use this [web form](https://cdn.rawgit.com/mathjax/MathJax/2.7.1/test/sample-dynamic-2.html) or [this form](http://mathb.in/29559)
  * List of [mathematical fonts](https://www.overleaf.com/learn/latex/Mathematical_fonts)
