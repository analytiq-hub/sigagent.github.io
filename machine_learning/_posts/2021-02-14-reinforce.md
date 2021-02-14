---
layout: post
mathjax: true
title: "The REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

Blog post series: [Introduction to Machine Learning](machine_learning/2021/02/13/introduction_to_machine_learning)

Sources:
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). Theory and examples, with implementations using [OpenAI Gym](https://gym.openai.com/), pytorch, tensorflow, and [SLM Lab](https://github.com/andrei-radulescu-banu/SLM-Lab)
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). High level, very clear presentation. Deep Q-Learning (DQN), Policy Gradient (PG), AlphaGo & AlphaZero
* [Why are policy gradient methods preferred over value function approximation in continuous action domains?](https://datascience.stackexchange.com/questions/25209/why-are-policy-gradient-methods-preferred-over-value-function-approximation-in-c/25212#25212)

In the REINFORCE algorithm, a policy $$\pi$$ is lerned that maximizes the agent objective $$J_\pi$$. Some prerequisites from [Introduction to Machine Learning](2021-02-13-introduction_to_machine_learning.md):

A trajectory $$\tau$$ denotes a sequence of states and actions
$$
\begin{equation} \label{eq:tau}
\tau = (s_0, a_0), (s_{1}, a_{1}), ... , (s_T, a_T)
\end{equation}
$$

The return of a trajectory $$\tau$$ that starts at step $$t$$ is denoted:

$$
\begin{equation} \label{eq:trajret}
R_t(\tau) = r(s_{t}, a_{t}) + {\gamma}r(s_{t+1}, a_{t+1}) + ... + {\gamma^{T-t}}r(s_{T}, a_{T}) = \sum_{t'=t}^T \gamma^{t'-1}r(s_{t'},a_{t'})
\end{equation}
$$

The agent needs to learn a policy that maximizes the agent objective $$J_\pi$$ defined by:

$$
\begin{equation} \label{eq:objective}
J_\pi = \mathbb{E}_{\tau \sim \pi}[R(\tau)] = \mathbb{E}_{\tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)]
\end{equation}
$$

We assume that the number of steps $$T$$, the state space $$\mathcal{S}$$ and action space $$\mathcal{A}$$ are finite. (See [here](https://datascience.stackexchange.com/questions/25209/why-are-policy-gradient-methods-preferred-over-value-function-approximation-in-c/25212#25212) how the same can be done for a continuous action space $$\mathcal{A}$$.)

We construct a deep neural network with states $$s \in \mathcal{S}$$ as input, and policy distributions $$\pi(a \vert s)$$ outputs for all actions $$a \in \mathcal{A}$$.

![PolicyGradient](/src/diagrams/policy_gradient.png)

The weights of the NN are denoted $$\theta$$, and parametrize the output policy $$\pi_\theta$$. The NN metric is the agent objective $$J_{\pi_\theta}$$. The algorithm starts with a random policy $$\pi_\theta$$, samples states $$s \in \mathcal{S}$$, and uses gradient ascent to maximize $$J_{\pi_\theta}$$. At each step, the NN weights are updated according to the rule
$$
\begin{align}
\theta = \theta + \alpha \nabla_\theta J_{\pi_\theta}
\end{align}
$$
where $$\alpha$$ is the learning rate. The key, here, is to be able to compute the gradient $$\nabla_\theta J_{\pi_\theta}$$.

Here, $$J_{\pi_\theta} = \mathbb{E}_{\tau \sim \pi_\theta}[R(\tau)]$$, so, more generally, given a function $$f(x)$$, and a conditional distribution $$p(x \vert \theta)$$, it would help to compute the gradient of its expectation $$\mathbb{E}_{x \sim p(x \vert \theta)}[f(x)]$$. We have:







# Odds and Ends

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

The goal of the agent is to maximize the objective $$J_\pi$$. If we fix the initial state $$s$$, or the pair $$(s, a)$$ of initial state and initial action, we define the *value* function 

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
& = r(s_0, a_0) \int_{s_1, a_1, ...} p_\pi(\tau_{>a_0}) d\tau_{>a_0} + \gamma \int_{s_1, a_1, ...} \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) P(s_{1} \vert s_0, a_0) \prod_{t=1}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (definition \, of \, p_\pi(\tau_{>a_0})) \\
& = r(s_0, a_0) + \gamma \int_{s_1, a_1, ...} \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) P(s_{1} \vert s_0, a_0) \prod_{t=1}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (integral \, of \, p_\pi(\tau_{>a_0}) \, is \, 1) \\
& = r(s_0, a_0) + \gamma \int_{s_1, a_1, ...} P(s_{1} \vert s_0, a_0) \sum_{t=1}^{T} \gamma^{t-1} r(s_t, a_t) \prod_{t=1}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t) d\tau_{>a_0} \hspace{1cm} & (bring \, out \, P(s_{1} \vert s_0, a_0)) \\
& \approx r(s_0, a_0) + \gamma \int_{s_1} P(s_{1} \vert s_0, a_0) V_\pi(s_1) ds_1 \hspace{1cm} & (definition \, of \, V_\pi(s_1)) \\
& = r(s_0, a_0) + \gamma \int_{s_1, a_1} P(s_{1} \vert s_0, a_0) Q_\pi(s_1, a_1) ds_1 da_1 \hspace{1cm} & (V_\pi(s_1) \, as \, expected \, value \, of \, Q_\pi(s_1, a_1) \, over \, a_1) \\
\end{align}
$$

The result is an approximation because the sum and product under the integral are over $$T-1$$ steps. When the number of steps $$T$$ is infinite, if $$\gamma \lt 1$$, we get

$$
\begin{align} \label{eq:q_bellman}
Q_\pi(s, a) & = r(s, a) + \gamma \int_{s',a'} P(s' \vert s, a) Q_\pi(s',a') ds'da' \\
\end{align}
$$

The equations (\ref{eq:v_bellman}), (\ref{eq:q_bellman}) are called the Bellman equations.

## Deep learning RL algorithms

Deep learning algorithms for RL problems fall into three main classes:
- Value based
- Policy based
- Model based

The taxonomy below is from [Foundations of Deep RL](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381). See Sec. 1.4 in there for a more in depth discussion.

### Value based algorithms
This class of algorithms learn the action-value functions $$Q_\pi(s, a)$$. A policy $$\pi(a \vert s)$$ could be picked, for example, to  maximizes the action-value $$Q_\pi(s, a)$$ in all states $$s$$. It is less common to lear $$V_\pi(s)$$ and infer the policy $$\pi$$.

Example value based algorithms:
- SARSA
- Deep Q Networks (DQN)
- Variants of DQN: Double DQN, DQN with Prioritized Experience Replay (PER)

In the algorithms above, the set of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$  must be finite. More recently, value based algorithms like QT-OPT have become available and can be applied to continuous action spaces $$\mathcal{A}$$.

This class of algorithms are more sample efficient. They work well if $$Q_\pi(s, a)$$ can be maximized without necessitating many action steps.

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

