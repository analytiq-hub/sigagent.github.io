---
layout: post
mathjax: true
title: "RL: Value Learning Algorithms"
author:
- Andrei Radulescu-Banu
---

This post is part of a series dealing with Reinforcement Learning:
- [Introduction to Reinforcement Learning](/machine_learning/2021/02/13/introduction_to_machine_learning/)
- [RL: Value Learning Algorithms](/machine_learning/2021/02/14/value_learning_algorithms/)
- [RL: The REINFORCE Algorithm](/machine_learning/2021/02/14/reinforce/)

## Sources
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). 
* [Reinforcement Learning: An Introduction](https://web.stanford.edu/class/psych209/Readings/SuttonBartoIPRLBook2ndEd.pdf), Sutton and Barto (2nd edition, 2018).
* [Fundamentals of Machine Learning for Predictive Data Analytics](https://www.amazon.com/Fundamentals-Machine-Learning-Predictive-Analytics/dp/0262044692/ref=asc_df_0262044692/), J.D. Kelleher et al (2020). 
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). 
* MIT 6.S091: [Introduction to Deep Reinforcement Learning](https://www.youtube.com/watch?v=zR11FLZ-O9M&t=2130s), Lex Fridman (2019).
* [A (Long) Peek into Reinforcement Learning](https://lilianweng.github.io/lil-log/2018/02/19/a-long-peek-into-reinforcement-learning.html), L. Weng (2018)

## Introduction
The sets of states $$\mathcal{S}$$  and actions $$\mathcal{A}$$ are assumed to be finite.

The idea in value learning algorithms is to maximize the action-value function $$Q_\pi(s, a)$$, and to pick policies $$s \rightarrow \pi(a \vert s)$$ which maximize $$Q_\pi(s, a)$$. This can be accomplished when, for example, in state $$s$$ we pick $$\underset{a \in \mathcal{A}}{argmax} \, Q_\pi(s, a)$$, which is the action $$a$$ that maximizes $$Q_\pi(s, a)$$.

## Greedy and $$\epsilon$$-greedy policies
More generally, if the action-value function $$Q$$ is given, the $$Q$$-greedy policy, by definition, for all $$s \in \mathcal{S}$$ picks with probability 1 the action that maximizes $$Q(s, a)$$.

We denote this policy $$\pi_{greedy}(Q)$$. Formally, $$\pi_{greedy}(Q)(s) = \underset{a \in \mathcal{A}}{max} Q(s, a)$$.

If $$\epsilon \in [0, 1]$$ is a number, and $$\pi$$ is a policy, the $$\epsilon$$-greedy policy $$\pi_\epsilon$$ picks, for all $$s \in \mathcal{S}$$,
- action $$a$$ with probablity $$(1-\epsilon) \pi(a \vert s)$$
- a uniformly distributed random action, with probability $$\epsilon$$

## Bellman Equations

We will use of the Bellman equations for $$V_\pi(s)$$ and $$Q_\pi(s, a)$$:
$$
\begin{align}
V_\pi(s) & = \int_a  Q_\pi(s, a) da \\
 & = \int_a \big( r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'\big) da \\
Q_\pi(s, a) & = r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds' \\
 & = r(s, a) + \gamma \int_{s',a'} P(s' \vert s, a) Q_\pi(s',a') ds'da' \\
\end{align}
$$

## Bellman Optimality Equations

Suppose the policy $$\pi$$ is optimal. Then $$V_\pi(s)$$ is maximal for each state $$s$$. Also, each state $$s$$ picks an action $$a$$ such that $$Q_\pi(s, a)$$ is maximal. The policy will be the $$Q$$-greedy policy given by $$\pi(a \vert s)=1$$, for the action $$a$$, and $$\pi(a' \vert s)=0$$ for all other actions $$a' \neq a$$. 

We denote $$V_\star(s)=V_\pi(s)$$ and $$Q_\star(s, a)=Q_\pi(s, a)$$ for this optimal policy $$\pi$$. The Bellman equations give us:

$$
\begin{align}
V_\star(s) & = \underset{a \in \mathcal{A}}{max} \, Q_\star(s, a) \\
 & = \underset{a \in \mathcal{A}}{max} \big( r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\star(s') ds'\big) \\
Q_\star(s, a) & = r(s, a) + \gamma \int_{s'} P(s' \vert s, a) \, V_\star(s') ds' \\
 & = r(s, a) + \gamma \int_{s'} P(s' \vert s, a) \, \underset{a'}{max} \, Q_\star(s',a') ds' \\
\end{align}
$$

These are called the Bellman optimality equations. The integrals $$\int$$ are in fact sums $$\sum$$ given that the sets of states $$\mathcal{S}$$ and actions $$\mathcal{A}$$ is finite.

## Solving the optimal policy using a system of equations

When the number of states $$\mathcal{S}$$ is very small, and the model $$P(s' \vert s, a)$$ is known, it becomes practical to solve the system of equations given by the Bellman optimality equations

$$
\begin{align*}
V_\star(s) = \int_a \big( r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V_\pi(s') ds'\big) da
\end{align*}
$$

Once $$V_\star(s)$$ is found, $$Q_\star(s, a)$$ can be computed, and the optimal action $$a$$ in state $$s$$ is given by the $$Q_\star$$-greedy policy $$\pi_{greedy}(Q_\star)$$.

Formally, for this policy, $$\pi_{greedy}(Q_\star)(s) = \underset{a \in \mathcal{A}}{argmax} \, Q_\star(s, a)$$.

This method is not practical when the number of states is larger.

## Dynamic Programming (DP)

In this method, we assume that the model $$P(s' \vert s, a)$$ is known. We build a value table

|       | Value Function |  
|:-----:|:-------------:|
|$$s_0$$|$$V(s_0)$$|
|$$s_1$$|$$V(s_1)$$|
|...    |...            |
|$$s_{m-1}$$|$$V(s_{m-1})$$|

and continuously update it for a given policy $$\pi$$ with $$V(s) \leftarrow r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V(s') ds'$$, the expected reward plus the discounted value of the next state, until $$V(s)$$ has converged and approximates $$V_\pi(s)$$.

Once $$V$$ is a good approximations for $$V_\pi$$, the Bellman equations give us action-values $$Q(s, a)$$. We then update the policy $$\pi \rightarrow \pi_{greedy}(Q)$$, the greedy policy based on $$Q$$, picking in state $$s$$ the action $$a$$ that maximizes $$Q(s, a)$$, and repeat the entire process,

$$
\begin{align*}
\pi \rightarrow V \rightarrow Q \rightarrow \pi_{greedy}(Q)
\end{align*}
$$

<p align="center">
<img width="250" height="250" src="/src/diagrams/eval_improvement.png">
</p>

until the policy $$\pi$$ stops changing.

The initial policy $$\pi(s) \in \mathcal{A}$$ and values $$V(s)$$ are random, for all $$s \in \mathcal{S}$$. We pick a small positive number $$\delta > 0$$. The algorithm has two stages:

$$~~~~$$ 1: Policy Evaluation:  
$$~~~~~~~~$$ 2: For each state $$s$$, set $$V(s) \leftarrow r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V(s') ds'$$, denoting the $$\delta_s$$ the change in $$V(s)$$  
$$~~~~~~~~$$ 3: Repeat 2 until $$\vert \delta_s \vert \lt \delta $$ for all $$s$$.

$$~~~~$$ 4: Policy Improvement:  
$$~~~~~~~~$$ 5: For each state $$s$$, compute $$Q(s, a) \leftarrow r(s, a) + \gamma \int_{s'} P(s' \vert s, a) V(s') ds'$$  
$$~~~~~~~~$$ 6: For each state $$s$$, set $$\pi \leftarrow \pi_{greedy}(Q)$$ defined by $$\pi_{greedy}(Q)(s) \leftarrow \underset{a \in {\mathcal{A}}}{argmax} \, Q(s, a)$$  
$$~~~~~~~~$$ 7: If at least one action changed, go back to 1   
$$~~~~~~~~$$ 8: Else, stop. The policy $$\pi$$ is optimal.  


The policy $$\pi$$ is guaranteed to eventually stabilize because and the state values $$V_\pi$$ converge to the optimal state values:

$$
\begin{align*}
\pi_0 \rightarrow V_{\pi_0} \rightarrow Q_{\pi_0} \rightarrow \pi_1 \rightarrow ... \rightarrow \pi_n \rightarrow V_{\pi_n} \rightarrow Q_{\pi_n} \rightarrow \pi_n 
\end{align*}
$$

The disadvantages of DP are:
- All state values need to be computed with each improvement of the policy $$\pi$$
- The model $$P(s' \vert s, a)$$ needs to be known in advance, and is used in Step 5.

## Temporal Difference Algorithms

This is a family of algorithms: TD0, TD(n), TD($$\epsilon$$). For Temporal Difference algorithms, we do not assume that the model $$P(s' \vert s, a)$$ is known. The Policy Improvement step is same as for DP. The Policy Evaluation step for $$V_\pi(s)$$ is different.

We pick a weight factor $$0 \lt \alpha \le 1$$ and a number of episodes $$MAX\_EPISODES$$. We will iterate over tragectories $$\tau = s_0, a_0, ..., s_T, a_T$$, estimating $$V_\pi(s_t)$$ at each step with a value $$G_{\tau, \pi}(s_t)$$, and replacing $$V_\pi(s_t) \leftarrow V_\pi(s_t) + \alpha (G_{\tau, \pi}(s_t) - V_\pi(s_t))$$.

#### TD Algorithm
For the TD0 algorithm, $$G_{\tau, \pi}(s_t) \leftarrow r(s_t, a_t) + \gamma V_\pi(s_{t+1})$$. The algorithm is:

$$~~~~$$ 1: Policy Evaluation for $$\pi$$:  
$$~~~~~~~~$$  2: Initialize all $$V_\pi(s)$$ to random values  
$$~~~~~~~~$$  3: For each episode $$0, 1, ..., MAX\_EPISODES-1$$:  
$$~~~~~~~~~~~~$$ 4: Pick a trajectory $$\tau = s_0, a_0, ..., s_T, a_T$$ using policy $$\pi$$  
$$~~~~~~~~~~~~$$ 5: For each $$0 \le t \lt T$$  
$$~~~~~~~~~~~~~~$$ 6: Set $$G_{\tau, \pi}(s_t) \leftarrow r(s_t, a_t) + \gamma V_\pi(s_{t+1})$$  
$$~~~~~~~~~~~~~~$$ 7: Set $$V_\pi(s_t) \leftarrow V_\pi(s_t) + \alpha (G_{\tau, \pi}(s_t) - V_\pi(s_t))$$

$$~~~~$$ 8: Policy Update of $$\pi$$: Same as for DP  

In step 6, the value $$V_\pi(s_t)$$ is updated with a weighted average between itself and the discounted value of the next step. At the end of steps 1-6, we get an estimate of $$V_\pi(s)$$ for the policy $$\pi$$, and can update $$\pi$$ using the same Policy Improvement algorithm from DP, switching back and forth between Policy Evaluation and Policy Improvement until the policy $$\pi$$ stops changing.

#### TD(n) Algorithm
A variant TD(n) of the TD algorithm changes step 5 use the weighted average with the discounted value of the next $$n$$ steps:

$$
\begin{align}
G_{\tau, \pi}(s_t) \leftarrow r(s_t, a_t) + \gamma V_\pi(s_{t+1}) + ... + \gamma^{n-1} V_\pi(s_{t+n})
\end{align}
$$

#### TD($$\epsilon$$) Algorithm
Another variant TD($$\epsilon$$) of TD changes the Policy Evaluation stage to apply it to an $$\epsilon$$-greedy modification of $$\pi$$, denoted $$\pi_\epsilon$$, which picks in state $$s$$ the action $$a$$ with probability $$(1 - \epsilon)\pi(a \vert s)$$, and randomly with likelyhood $$\epsilon$$. The $$\epsilon$$-greedy action selection policy balances *exploration*, with likelihood $$\epsilon$$, and *exploitation* with likelihood $$1-\epsilon$$.


## Q-Learning and SARSA

The Policy Improvement step for these algorithms is also same as for DP. But, rather than learn the value function $$V_\pi(s)$$, the Q-Learning and SARSA algorithms learn directly the action-vaue function $$Q_\pi(s, a)$$.

These algorithms can be thought to update the action-value table below, based on the policy $$\pi$$; then, they update the policy $$\pi$$ based on the table, and iterate the process until the policy $$\pi$$ stops changing.

|       |    $$a_0$$    |    $$a_1$$    | ... |     $$a_{n-1}$$     |
|:-----:|:-------------:|:-------------:|:---:|:-------------------:|
|$$s_0$$|$$Q(s_0, a_0)$$|$$Q(s_0, a_1)$$|     |$$Q(s_0, a_{n-1})$$  |
|$$s_1$$|$$Q(s_1, a_0)$$|$$Q(s_1, a_1)$$|     |$$Q(s_1, a_{n-1})$$  |
|...    |...            |...            |     |...                  |
|$$s_{m-1}$$|$$Q(s_{m-1}, a_0)$$|$$Q(s_{m-1}, a_1)$$||$$Q(s_{m-1}, a_{n-1})$$|

Note that the policy $$\pi$$ can be immediately be updated from the table, because $$Q(s, a)$$ is already computed.

In both algorithms, the table is randomly initialized with numbers $$Q(s, a)$$.

We pick a weight factor $$0 \lt \alpha \le 1$$, a small number $$0\le \epsilon <1 $$, and a number of episodes $$MAX\_EPISODES$$. We will iterate over tragectories $$\tau = s_0, a_0, ..., s_T, a_T$$, estimating $$Q_\pi(s_t, a_t)$$ at each step with a value $$G_{\tau, \pi}(s_t, a_t)$$, replacing
$$
\begin{align}
Q_\pi(s_t, a_t) \leftarrow Q_\pi(s_t, a_t) + \alpha (G_{\tau, \pi}(s_t, a_t) - Q_\pi(s_t, a_t))
\end{align}
$$

For SARSA, $$G_{\tau, \pi}(s_t, a_t) \leftarrow r(s_t, a_t) + \gamma Q_\pi(s_t, a_t)$$.

For Q-Learning, $$G_{\tau, \pi}(s_t, a_t) \leftarrow r(s_t, a_t) + \gamma \, \underset{a}{max} \, Q_\pi(s_t, a)$$.

#### SARSA

$$~~~~$$ 1: Initialize all $$Q_\pi(s, a)$$ to random values  
$$~~~~$$ 2: Policy Evaluation for $$\pi$$:  
$$~~~~~~$$ 3: For each episode $$0, 1, ..., MAX\_EPISODES-1$$:  
$$~~~~~~~~$$ 4: Pick a trajectory $$\tau = s_0, a_0, ..., s_T, a_T$$ using $$\pi$$ (or $$\pi_\epsilon$$)  
$$~~~~~~~~$$ 5: For each $$0 \le t \lt T$$  
$$~~~~~~~~~~$$ 6: Set $$G_{\tau, \pi}(s_t, a_t) \leftarrow r(s_t, a_t) + \gamma Q_\pi(s_t, a_t)$$  
$$~~~~~~~~~~$$ 7: Set $$Q_\pi(s_t, a_t) \leftarrow Q_\pi(s_t, a_t) + \alpha (G_{\tau, \pi}(s_t, a_t) - Q_\pi(s_t, a_t))$$

$$~~~~$$ 8: Policy Update of $$\pi$$: Same as for DP

The n-step method TD(n) idea - having the function $$G_{\tau, \pi}(s_t, a_t)$$ estimate use n forward steps instead of one - can be extended to SARSA as well.

#### Q-Learning
This algorithm is same as SARSA but $$G_{\tau, pi}(s_t, a_t) \leftarrow r(s_t, a_t) + \gamma \, \underset{a}{max} \, Q_\pi(s_t, a)$$.

Notice that $$G_{\tau, \pi}(s_t, a_t)$$ for Q-Learning does not depend on the policy; the only step during Policy Evaluation depending on the policy is the choice of trajectory $$\tau$$. This is a weak dependency on policy, and, in practice, this means which depends even if the expression $$Q_\pi(s_t, a)$$ shows on the right side, this is merely an approximation of the action-value function for $$\pi$$. 

## DQN

The algorithms above still assume a small number of state. When the number of states is large, neural networks come to the rescue to approximate the action-value functions $$Q_\pi(s, a)$$.

We construct a deep neural network with states $$s \in \mathcal{S}$$ as input, and action-value functions $$Q(s, a)$$ outputs for all actions $$a \in \mathcal{A}$$.

<p align="center">
<img width="350" height="250" src="/src/diagrams/dqn.png">
</p>

Denote $$w$$ the weights of the NN, and $$Q_w(s, a)$$ the output of the NN. The loss function is defined as

$$
\begin{align}
\mathcal{L}_w(s) =\big( \big)^2
\end{align}
$$

## TO DO: continue


