---
layout: post
mathjax: true
title: "The REINFORCE algorithm"
author:
- Andrei Radulescu-Banu
---

Blog post series: [Introduction to Machine Learning](https://bitdribble.github.io/machine_learning/2021/02/13/introduction_to_machine_learning)

Sources:
* [Foundations of Deep Reinforcement Learning](https://www.amazon.com/Deep-Reinforcement-Learning-Python-Hands/dp/0135172381), L. Graesser and W. L. Keng (2019). Theory and examples, with implementations using [OpenAI Gym](https://gym.openai.com/), pytorch, tensorflow, and [SLM Lab](https://github.com/andrei-radulescu-banu/SLM-Lab)
* [Policy Gradient Methods for Reinforcement Learning with Function Approximation](https://papers.nips.cc/paper/1999/file/464d828b85b0bed98e80ade0a5c43b0f-Paper.pdf), R. Sutton et. al. (1999)
* MIT 6.5191: [Deep Reinforcement Learning](https://www.youtube.com/watch?v=i6Mi2_QM3rA), Alexander Amini (2020). High level, very clear presentation. Deep Q-Learning (DQN), Policy Gradient (PG), AlphaGo & AlphaZero
* [Why are policy gradient methods preferred over value function approximation in continuous action domains?](https://datascience.stackexchange.com/questions/25209/why-are-policy-gradient-methods-preferred-over-value-function-approximation-in-c/25212#25212)
* [REINFORCE Algorithm: Taking baby steps in reinforcement learning](https://www.analyticsvidhya.com/blog/2020/11/reinforce-algorithm-taking-baby-steps-in-reinforcement-learning/) (2020), with code examples
* [Deriving Policy Gradients and Implementing REINFORCE](https://medium.com/@thechrisyoon/deriving-policy-gradients-and-implementing-reinforce-f887949bd63), C. Yoon (2018)

## Prerequisites

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

## The agent objective

The agent needs to learn a policy that maximizes the agent objective $$J_\pi$$:

$$
\begin{align}
J_\pi & = \sum_{t=0}^{T}[R(\tau)] & (definition \, of J_\pi)\\
 & = \mathbb{E}_{\tau \sim \pi}[\sum_{t=0}^{T} \gamma^{t} r(s_t, a_t)] & (expand\, R(\tau))\\
& = \sum_{t=0}^{T} \int_{\tau_{\le a_t} = s_0, a_0, ... , a_t} \gamma^{t} r(s_t, a_t) p_\pi(s_t, a_t \vert \tau) d\tau_{\le a_t} \hspace{1cm} & (as \, shown \, previously) \\
& = \sum_{t=0}^{T} \gamma^{t} \mathbb{E}_{\tau_{\le a_t} \sim \pi}[r(s_t, a_t)] & (definition \, of \, expectation)
\end{align}
$$

We assume that the number of steps $$T$$, the state space $$\mathcal{S}$$ and action space $$\mathcal{A}$$ are finite. (See [here](https://datascience.stackexchange.com/questions/25209/why-are-policy-gradient-methods-preferred-over-value-function-approximation-in-c/25212#25212) how the same can be done for a continuous action space $$\mathcal{A}$$.)

## The deep neural network

We construct a deep neural network with states $$s \in \mathcal{S}$$ as input, and policy distributions $$\pi(a \vert s)$$ outputs for all actions $$a \in \mathcal{A}$$.

![PolicyGradient](/src/diagrams/policy_gradient.png)

The weights of the NN are denoted $$\theta$$, and parametrize the output policy $$\pi_\theta$$. The NN metric is the agent objective $$J_{\pi_\theta}$$. The algorithm starts with a random policy $$\pi_\theta$$, samples states $$s \in \mathcal{S}$$, and uses gradient ascent to maximize $$J_{\pi_\theta}$$. At each step, the NN weights are updated according to the rule
$$
\begin{align}
\theta = \theta + \alpha \nabla_\theta J_{\pi_\theta}
\end{align}
$$
where $$\alpha$$ is the learning rate. The key, here, is to be able to compute the gradient $$\nabla_\theta J_{\pi_\theta}$$.

## Computing the policy gradient

Here, $$J_{\pi_\theta} = \mathbb{E}_{\tau \sim \pi_\theta}[R(\tau)]$$, so, more generally, given a function $$f(x)$$, and a conditional distribution $$p(x \vert \theta)$$, it would help to compute the gradient of its expectation $$\mathbb{E}_{x \sim p(x \vert \theta)}[f(x)]$$. We have:

$$
\begin{align}
\nabla_\theta \mathbb{E}_{x \sim p(x \vert \theta)}[f(x)] & = \nabla_\theta \int_x f(x) p(x \vert \theta) dx & (definition \, of \, expectation) \\
& = \int_x f(x) \nabla_\theta (p(x \vert \theta)) dx & (gradient \, commutes \, with \, the \, integral) \\
& = \int_x f(x) p(x \vert \theta) \frac{\nabla_\theta (p(x \vert \theta))}{p(x \vert \theta)} dx &  (multiply \, and \, divide \, with \, p(x \vert \theta)) \\
& = \int_x f(x) p(x \vert \theta) \nabla_\theta (ln \, p(x \vert \theta)) dx & (chain \, rule) \\
& = \mathbb{E}_{x \sim p(x \vert \theta)}[f(x)\nabla_\theta (ln \, p(x \vert \theta))] & (definition \, of \, expectation) \\
\end{align}
$$

In view of this, 

$$
\begin{align}
\nabla_\theta J_{\pi_\theta} & = \nabla_\theta \sum_{t=0}^{T} \gamma^{t} \mathbb{E}_{\tau_{\le a_t} \sim \pi_\theta}[r(s_t, a_t)] & (express \, J_{\pi_\theta} \, as \, sum \, of \, expectations) \\
& = \sum_{t=0}^{T} \gamma^{t} \nabla_\theta \mathbb{E}_{\tau_{\le a_t} \sim \pi_\theta}[r(s_t, a_t)] & (bring \, \nabla_\theta \, in) \\
& = \sum_{t=0}^{T} \gamma^{t} \mathbb{E}_{\tau_{\le a_t} \sim \pi_\theta}[r(s_t, a_t) \nabla_\theta (ln \, p_{\pi_\theta}(\tau_{\le a_t} \vert \theta))] & (bring \, \nabla_\theta \, inside \, \mathbb{E}_{\tau_{\le a_t} \sim \pi_\theta})\\
\end{align}
$$

Recall that $$p_\pi(\tau) = d(s_0) \prod_{t=0}^T \pi(a_t \vert s_t) P(s_{t+1} \vert s_t, a_t)$$. We can expand the term $$\nabla_\theta ln \, p_\pi(\tau_{\le a_t} \vert \theta)$$ as follows:

$$
\begin{align}
\nabla_\theta ln \, p_{\pi_\theta}(\tau_{\le a_t} \vert \theta) &= \nabla_\theta ln \, \{d(s_0) \prod_{t'=0}^t \pi_\theta(a_{t'} \vert s_{t'}) \prod_{t'=0}^t P(s_{t'+1} \vert s_{t'}, a_{t'}) \vert \theta)\} & (expand \, p_{\pi_\theta}(\tau_{\le a_t} \vert \theta)) \\
& = \nabla_\theta ln \, d(s_0) + \sum_{t'=0}^t \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) + \sum_{t'=0}^t \nabla_\theta ln \, P(s_{t'+1} \vert s_{t'}, a_{t'}) & (log \, of \, product \, is \, sum \, of \, logs)) \\
& = \sum_{t'=0}^t \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) & (\nabla_\theta \, of \, terms \, that \, do \, not \, depend \, on \, \theta \, is \, 0)) \\
\end{align}
$$

Applying that:

$$
\begin{align}
\nabla_\theta J_{\pi_\theta} & = \sum_{t=0}^{T} \gamma^{t} \mathbb{E}_{\tau_{\le a_t} \sim \pi_\theta}[r(s_t, a_t) \sum_{t'=0}^t \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'})] & \\
& = \sum_{t=0}^{T} \gamma^{t} \mathbb{E}_{\tau \sim \pi_\theta}[r(s_t, a_t) \sum_{t'=0}^t \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'})] & (expectation \, remains \, same \, when \, using \, \tau \, instead \, of \, \tau_{\le a_t})\\
& = \mathbb{E}_{\tau \sim \pi_\theta}[\sum_{t=0}^{T} \{ \gamma^{t} r(s_t, a_t) \sum_{t'=0}^t \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) \}] & (bring \, sum \, back \, in)\\
& = \mathbb{E}_{\tau \sim \pi_\theta}[\sum_{0 \le t' \le t \le T} \{\gamma^{t} r(s_t, a_t) \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) \}] & (convert \, from \, double \, sum) \\
& = \mathbb{E}_{\tau \sim \pi_\theta}[\sum_{t'=0}^T \{\nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) \sum_{t=t'}^T \gamma^{t} r(s_t, a_t)  \}] & (convert \, to \, double \, sum) \\
& = \mathbb{E}_{\tau \sim \pi_\theta}[\sum_{t'=0}^T \{\gamma^{t'} R_{t'}(\tau) \nabla_\theta ln \, \pi_\theta(a_{t'} \vert s_{t'}) \}] & (definition \, of \, R_t(\tau)) \\
& = \mathbb{E}_{\tau \sim \pi_\theta}[\sum_{t=0}^T \{\gamma^t R_t(\tau) \nabla_\theta ln \, \pi_\theta(a_{t} \vert s_{t}) \}] & (rename \, t' \, as \, t) \\
\end{align}
$$

## The REINFORCE algorithm

'''
Initializelearningrateα
2: Initializeweightsθofapolicynetworkπθ
3: forepisode=0,...,MAX_EPISODEdo
4: Sampleatrajectoryτ =s0,a0,r0,...,sT,aT,rT
5: Set ∇θJ(πθ) = 0
6: for t = 0,...,T do
7: Rt(τ) = 􏰋T γt′−trt′ t′ =t
8: ∇θ J (πθ ) = ∇θ J (πθ ) + Rt (τ )∇θ log πθ (at | st )
 9: 10: 11:
end for
θ=θ+α∇θJ(πθ) endfor
'''


# Example: CartPole
See the annotated implementation: [reinforce.py](https://github.com/andrei-radulescu-banu/SLM-Lab/blob/master/andrei/reinforce.py). Follow instructions in [README](https://github.com/andrei-radulescu-banu/SLM-Lab/blob/master/README.md) to run. Example output:

```
Episode 214, loss 3671.379638671875, total_reward 175.0, solved False
Episode 215, loss 4000.337158203125, total_reward 200.0, solved True
Episode 216, loss 3653.253173828125, total_reward 200.0, solved True
Episode 217, loss 3876.510498046875, total_reward 186.0, solved False
Episode 218, loss 3042.779296875, total_reward 185.0, solved False
Episode 219, loss 4446.62890625, total_reward 200.0, solved True
Episode 220, loss 4500.43359375, total_reward 200.0, solved True
Episode 221, loss 3556.630859375, total_reward 200.0, solved True
```

The total possible reward per episode is 200. The game is solved if the cartpole does not fall in 195 steps out of 200. Up to 300 episodes are tried.


