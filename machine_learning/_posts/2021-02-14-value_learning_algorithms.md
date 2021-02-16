---
layout: post
mathjax: true
title: "RL: Value Learning Algorithms"
author:
- Andrei Radulescu-Banu
---

This post is part of a series dealing with Reinforcement Learning:
- [Introduction to Reinforcement Learning](https://bitdribble.github.io/machine_learning/2021/02/13/introduction_to_machine_learning/)
- [RL: Value Learning Algorithms](https://bitdribble.github.io/machine_learning/2021/02/14/value_learning_algorithms/)
- [RL: The REINFORCE Algorithm](https://bitdribble.github.io/machine_learning/2021/02/14/reinforce/)

## Sources
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). 
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018).
* [Fundamentals of Machine Learning for Predictive Data Analytics](https://www.amazon.com/Fundamentals-Machine-Learning-Predictive-Analytics/dp/0262044692/ref=asc_df_0262044692/), J.D. Kelleher et al (2020). 
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). 
* MIT 6.S091: [Introduction to Deep Reinforcement Learning](https://www.youtube.com/watch?v=zR11FLZ-O9M&t=2130s), Lex Fridman (2019). 

## Introduction
The sets of states $$\mathcal{S}$$  and actions $$\mathcal{A}$$ are assumed to be finite.

The idea in value learning algorithms is to maximize the action-value function $$Q_\pi(s, a)$$, and to pick policies $$s \rightarrow \pi(a \vert s)$$ which maximize $$Q_\pi(s, a)$$. This can be accomplished when, for example, in state $$s$$ we pick $$\underset{a}{argmax} \, Q_\pi(s, a)$$, which is the action $$a$$ that maximizes $$Q_\pi(s, a)$$.

We will use of the Bellman equations for $$V_\pi(s)$$ and $$Q_\pi(s, a)$$:
$$
\begin{align}
V_\pi(s) & = \int_a \{ r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'\} da \\
Q_\pi(s, a) & = r(s, a) + \gamma \int_{s',a'} P(s' \vert s, a) Q_\pi(s',a') ds'da' \\
\end{align}
$$

## Bellman Optimality Equations

Suppose the policy $$\pi$$ is optimal. Then $$V_\pi(s)$$ is maximal for each state $$s$$. Also, each state $$s$$ picks an action $$a$$ such that $$Q_\pi(s, a)$$ is maximal. The policy will be $$\pi(a \vert s)=1$$, for the action $$a$$, and $$\pi(a' \vert s)=0$$ for all other actions $$a' \neq a$$.

We denote $$V_\star(s)=V_\pi(s)$$ and $$Q_\star(s, a)=Q_\pi(s, a)$$ for this optimal policy $$\pi$$. The optimal policy satisfies $$V_\star(s) = \underset{a}{max} \, Q_\star(s, a)$$. The Bellman equations give us:

$$
\begin{align}
V_\star(s) & = \underset{a}{max} \{ r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\star(s') ds'\} \\
Q_\star(s, a) & = r(s, a) + \gamma \int_{s'} P(s' \vert s, a) \, \underset{a'}{max} \, Q_\star(s',a') ds' \\
\end{align}
$$

These are called the Bellman optimality equations. The integrals $$\int$$ are in fact sums $$\sum$$ given that the sets of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$ is finite.

## Solving the optimal policy using a system of equations

When the number of states $$\mathcal{S}$$ is very small, and the model $$P(s' \vert s, a)$$ is not known, it becomes practical to solve the system of equations given by the Bellman optimality equation for $$V_\star(s)$$. Once $$V_\star(s)$$ is found, $$Q_\star(s, a)$$ can be computed, and the optimal action $$a$$ in state $$s$$ is given by $$\underset{a}{argmax} \, Q_\star(s, a)$$.

This methods are not practical when the number of states is larger.

## Dynamic Programming (DP)

In this method, we assume that the model $$P(s' \vert s, a)$$ is known. We build a value table

|       | Value Function |  
|:-----:|:-------------:|
|$$s_0$$|$$V_\pi(s_0)$$|
|$$s_1$$|$$V_\pi(s_1)$$|
|...    |...            |
|$$s_{m-1}$$|$$V_\pi(s_{m-1})$$|

and continuously update it for a given policy $$\pi$$ with $$V_\pi(s) \leftarrow r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'$$, the expected reward plus the discounted value of the next state, until $$V_\pi(s)$$ has converged. Once we have good approximations for $$V_\pi(s)$$, the Bellman equations give us action-values $$Q_\pi(s, a)$$. We then update the policy $$\pi$$, picking in state $$s$$ the action $$a$$ that maximizes $$Q_\pi(s, a)$$, and repeat the entire process until the policy $$\pi$$ stops changing.

The initial policy $$\pi(s) \in \mathcal{A}$$ and values $$V_\pi(s)$$ are random, for all $$s \in \mathcal{S}$$. We pick a small positive number $$\delta > 0$$. The algorithm has two stages:

1: Policy Evaluation:  
&nbsp;&nbsp;&nbsp;&nbsp; 2: For each state $$s$$, set $$V_\pi(s) \leftarrow r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'$$, denoting the $$\delta_s$$ the change in $$V_\pi(s)$$  
&nbsp;&nbsp;&nbsp;&nbsp; 3: Repeat 2 until $$\vert \delta_s \vert \lt \delta $$ for all $$s$$.

4: Policy Improvement:  
&nbsp;&nbsp;&nbsp;&nbsp; 5: For each state $$s$$, compute $$Q_\pi(s, a)$$ from $$V_\pi(s)$$ using the Bellman equation  
&nbsp;&nbsp;&nbsp;&nbsp; 6: For each state $$s$$, set $$\pi(s) \leftarrow \underset{a}{argmax} \, Q_\pi(s, a)$$  
&nbsp;&nbsp;&nbsp;&nbsp; 7: If at least one action changed, go back to 1   
&nbsp;&nbsp;&nbsp;&nbsp; 8: Else, stop. The policy $$\pi$$ is optimal.  


The disadvantages of DP are that all state values need to be computed with each improvement of the policy $$\pi$$; and the model $$P(s' \vert s, a)$$ needs to be known.

## Temporal Difference

This is a family of algorithms: TD0, TD(n), TD($$\lambda$$). For Temporal Difference algorithms, we do not assume that the model $$P(s' \vert s, a)$$ is known. The Policy Improvement step is same as for DP. The Policy Evaluation step for $$V_\pi(s)$$ is different.

We pick a weight factor $$0 \lt \alpha \le 1$$ and a number of episodes $$MAX\_EPISODES$$. We will iterate over tragectories $$\tau = s_0, a_0, ..., s_T, a_T$$, estimating $$V_\pi(s_t)$$ at each step with a value $$G_{\tau, \pi}(s_t)$$, and replacing $$V_\pi(s_t) \leftarrow V_\pi(s_t) + \alpha (G_{\tau, \pi}(s_t) - V_\pi(s_t))$$.

For the TD0 algorithm, $$G_{\tau, \pi}(s_t) \leftarrow r(s_t, a_t) + \gamma V_\pi(s_{t+1})$$. The algorithm is:

1: Policy Evaluation:  
&nbsp;&nbsp;&nbsp;&nbsp; 2: Initialize all $$V_\pi(s)$$ to random values  
&nbsp;&nbsp;&nbsp;&nbsp; 3: For each episode $$0, 1, ..., MAX\_EPISODES-1$$:  
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 3: Pick a trajectory $$\tau = s_0, a_0, ..., s_T, a_T$$  
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 4: For each $$0 \le t \lt T$$  
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 5:  Set $$G_{\tau, \pi}(s_t) \leftarrow r(s_t, a_t) + \gamma V_\pi(s_{t+1})$$  
&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 6:  Set $$V_\pi(s_t) \leftarrow V_\pi(s_t) + \alpha (G_{\tau, \pi}(s_t) - V_\pi(s_t))$$

1: Policy Update: Same as for DP  

In step 4, the value $$V_\pi(s_t)$$ is updated with a weighted average between itself and the discounted value of the next step. At the end of steps 1-4, we get an estimate of $$V_\pi(s)$$ for the policy $$\pi$$, and can update $$\pi$$ using the Policy Improvement algorithm, switching back and forth between Policy Evaluation and Policy Improvement until the policy $$\pi$$ stops changing.

A variant TD(n) of the algorithm changes step 4 use the weighted average with the discounted value of the next $$n$$ steps.

## Q-Learning and SARSA

If the number of states and actions is still relatively small, rather than solve the Bellman optimality equations for $$V_\star(s)$$, we can approximate action-value functions $$Q_\pi(s, a)$$ that converge to a solution of the Bellman optimality equations for $$Q_\star(s, a)$$ . We build an action-value table

|       |    $$a_0$$    |    $$a_1$$    | ... |     $$a_{n-1}$$     |
|:-----:|:-------------:|:-------------:|:---:|:-------------------:|
|$$s_0$$|$$Q_\pi(s_0, a_0)$$|$$Q_\pi(s_0, a_1)$$|     |$$Q_\pi(s_0, a_{n-1})$$  |
|$$s_1$$|$$Q_\pi(s_1, a_0)$$|$$Q_\pi(s_1, a_1)$$|     |$$Q_\pi(s_1, a_{n-1})$$  |
|...    |...            |...            |     |...                  |
|$$s_{m-1}$$|$$Q_\pi(s_{m-1}, a_0)$$|$$Q_\pi(s_{m-1}, a_1)$$||$$Q_\pi(s_{m-1}, a_{n-1})$$|

The initial entries are randomly initialized with numbers $$Q_\pi(s, a)$$. We pick a learning rate $$\alpha$$. We iterate over a number of episodes $$MAX\_EPISODES$$, and, within each episode, build a trajectory

$$
\begin{equation}
\tau = (s_0, a_0, s_{1}, a_{1}, ... , s_T, a_T)
\end{equation}
$$

updating the policy $$\pi$$ as we go along. The initial state $$s_0$$ is picked according to the distribution $$d(s_0)$$. At step $$0 \le t \le T$$, in state $$$s_t$$, we pick an action $$a_t$$ and pick a retun $$G(s_t, a_t)$$ that is more optimal than $$Q_\pi(s_t, a_t)$$. Depending on the choice of $$a_t$$ and $$G(s_t, a_t)$$, we get different algorithms, but in all cases the action-value table with the rule
$$
\begin{align}
Q_\pi(s_t, a_t) \leftarrow Q_\pi(s_t, a_t) + \alpha (G(s_t, a_t) - Q_\pi(s_t, a_t)) \\
\end{align}
$$


the actual return received from the point of taking action $$a_t$$ until the end of the episode.


After repeatedly applying this rule, the action-value table will converge to the optimal action-value function $$Q_\star(s, a)$$. This is the Temporal-Difference Learning algorithm (TD).

The update function $$G(s_t, a_t)$$ can also be defined as the actual return after a single step
$$
\begin{align}
G(s_t, a_t) = r(s_t, a_t) + \gamma Q_\pi(s_{t+1}, a_{t+1})
\end{align}
$$

This formulation that updates the action-value table after a single step is called TD(0). Another variant is to choose $$G(s_t, a_t)$$ using TD0 combined with an $$\epsilon$$-greedy random choice for the next action $$a_{t+1}$$. This randomization ensures that optimal values may not be overlooked.

## TO DO: continue

$$
\begin{align}
G_\star(s, a) & = r(s, a) + \gamma \int_{s'} P(s' \vert s, a) \, \underset{a'}{max} Q_\star(s',a') ds' \\
\end{align}
$$

## Q-Learning

## SARSA

## DQN

## Recycled


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
s_{t+1} \sim P(s_{t+1} \vert (s_0,a_0,s_1,a_1,...,s_t,a_t)
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

## Truncated and conditional trajectories

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

States and actions can be conditioned on trajectories. The conditional probabilities are:

$$
\begin{align} \label{eq:taudistscond}
p_\pi(s_t \vert \tau) = \prod_{t'=0}^{t-1} \pi(a_{t'} \vert s_{t'}) P(s_{t'+1} \vert s_{t'}, a_{t'}) \\
\end{align}
$$

$$
\begin{align} \label{eq:taudistsacond}
p_\pi(s_t, a_t \vert \tau) = \prod_{t'=0}^{t} \pi(a_{t'} \vert s_{t'}) \prod_{t'=0}^{t-1} P(s_{t'+1} \vert s_{t'}, a_{t'}) \\
\end{align}
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

Applying the definition of density to objective $$J_\pi$$, the value $$V_\pi(s)$$ and the action-value $$Q_\pi(s, a)$$ functions, we get:

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

The objective $$J_\pi$$, the value $$V_\pi(s)$$ and the action-value $$Q_\pi(s, a)$$ functions  are interrelated. To show that, we express them in terms of the trajectory distribution $$p_\pi(\tau)$$ of ($$\ref{eq:taudist}$$).

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
\begin{align} \label{eq:v_bellman}
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

