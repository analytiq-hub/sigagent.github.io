---
layout: page
mathjax: true
title: Gareth Tribello - MathNet
---
Notes on [MathNet](http://gtribello.github.io/mathNET)

[An introduction to statistical mechanics and the principle of equal a priori probabilities](https://www.youtube.com/watch?v=0LdL1LUrE0I)
* Ludwig Boltzmann's principle of apriori probabilities, shortened, and in modern formulation:
  * Suppose we have some atoms.
  * Their state in Newtonian physics is characterized by _positions_ and _momenta_
  * A _microstate_ is the set of all positions and momenta of atoms in the system at a given time. It is denoted by vectors of position and momentum $$(x, p)$$, where the vector dimension is the number of atoms.
  * The set of all possible microstates $$x_i, p_i$$ is called _phase space_.
  * Each microstate has associated  _extensive quantities_
    * Extensive quantities are physical properties of a system that scales linearly with the size of the system - e.g. the volume of a gas, mass, energy, and entropy
    * Intensive quantities are physical properties that do not depend on the size of the system - e.g. temperature, pressure, and chemical potential.
  * For a given energy level $$E$$, at equilibrium, the microstates with that energy are equally distributed.
  * The system moves freely between microstates at that level of energy.
  * From this simple statement, the whole edifice of Statistical Mechanics is buult
  * Within Statistical Mechanics, we find an answer of sorts to the question 'what is Entropy'
    
[The Generalized Partition Function](http://gtribello.github.io/mathNET/generalised-partition-video.html)
* Suppose the system microstates $$i$$ have energy, volume, and number of atoms $$(E_i, V_i, N_i)$$ with expected values

$$
\begin{align*}
\langle E \rangle &= \sum_i E_i p_i & 
\langle V \rangle &= \sum_i V_i p_i &
\langle N \rangle &= \sum_i N_i p_i
\end{align*}
$$

where $$p_i$$ is the probability of being in microstate $$i$$.
* Energy can change spontaneously through the process of thermal fluctuations!
  * However, the overall energy tends to remain constant over time, due to the law of energy conservation.
* In general, microstates can have a different number of atoms.
  * In most cases, the number of atoms in a microstate is fixed, and only the positions and momenta of the atoms can vary. However, there are some situations in which the number of atoms in a microstate can change, such as in the case of chemical reactions or phase transitions.
* These three equations, along with $$\sum_i p_i = 1$$, constitue our system constraints
* The probability distribution across all microstates is determined by minimizing information

$$
\begin{align*}
I(p) = k_B \sum_i p_i \ln p_i
\end{align*}
$$


subject to our constraints.

* The distribution is computed using Lagrange multipliers.
* More generally, assume the constraints are

$$
\begin{align*}
\sum_i p_i b_i^{(j)} = \langle B^{(j)} \rangle
\end{align*}
$$

* Add the Lagrange multipliers, switch sign in $$I(p)$$ to maximize instead of miminize, distributing coefficient $$k_B$$ for convenience:

$$
\begin{align*}
I(p, \lambda_0, \{\lambda^{(j)}\}) &= - k_B \sum_i p_i \ln p_i - k_B\lambda_0 (\sum_i p_i - 1) - k_B\sum_j \lambda^{(j)} (\sum_i p_i b_i^{(j)} - \langle B^{(j)}\rangle) \\
\frac{1}{k_B}\frac{\partial I(p, \lambda_0, \{\lambda^{(j)}\})}{\partial p_i} &= -\ln p_i - 1 - \lambda_0 - \sum_j \lambda^{(j)} b_i^{(j)} \text{  therefore:} \\
p_i &= \frac{e^{-\sum_j \lambda^{(j)}b_i^{(j)}}}{E^{\Psi}} \text{ where } \Psi = \lambda_0 + 1
\end{align*}
$$

* The quantity $$Z := e^{-\Psi}$$ is called the generalized partition function. It is a normalization constant for our probability mass vector.

$$
\begin{align*}
\sum_i p_i &= 1 \text{ so } Z = \sum_i e^{-\sum_j \lambda^{(j)}b_i^{(j)}}  \text{ and } \Psi = \ln \sum_i e^{-\sum_j \lambda^{(j)}b_i^{(j)}} \\
\end{align*}
$$

[Calculating ensemble averages by differentiating the partition function](http://gtribello.github.io/mathNET/ensemble-averages-by-differentiation-video.html)

* We recover $$\langle B^{(j)}\rangle$$ as follows:

$$
\begin{align*}
\frac{\partial \Psi}{\partial \lambda^{(j)}} 
&= \frac{\partial \ln Z}{\partial \lambda^{(j)}}
= \frac{\partial \ln \sum_i e^{-\sum_j \lambda^{(j)} b_i^{(j)}}}{\partial \lambda^{(j)}} \\
&= \frac{1}{Z}\frac{\partial \sum_i e^{-\sum_j \lambda^{(j)} b_i^{(j)}}} {\partial \lambda^{(j)}}
= \frac{1}{Z}( - \sum_i b_i^{(j)} e^{-\sum_j \lambda^{(j)} b_i^{(j)}}) \\
&= - \sum_i p_i b_i^{(j)} = - \langle B^{(j)} \rangle
\end{align*}
$$

[Entropy in Statistical Mechanics](http://gtribello.github.io/mathNET/entropy-statistical-mechanics-video.html)
* The entropy $$S = - k_B \sum_i p_i \ln p_i$$ is computed as

$$
\begin{align*}
\frac{S}{k_B} = -\sum_i p_i \ln p_i = \sum_i p_i (\Psi + \sum_j \lambda^{(j)}b_i^{(j)}) = \Psi + \sum_j \lambda^{(j)}\langle B^{(j)} \rangle
\end{align*}
$$

[Calculating Entropy changes](http://gtribello.github.io/mathNET/entropy-changes-statistical-mechanics-video.html)
* Suppose $$\alpha^{(k)}$$ is an extensive quantity with value $$\alpha_i^{(k)}$$ in microstate $$i$$. How does the entropy $$E$$ change when $$\alpha^{(k)}$$ changes?
  * For example, $$\alpha^{(k)}$$ can be the energy, or the volume, or the number of atoms
* We have

$$
\begin{align*}
\frac{S}{k_B} &= \Psi + \sum_j \lambda^{(j)}\langle B^{(j)} \rangle \\
\frac{1}{k_B}\frac{\partial S}{\partial \alpha^{(k)}} &= \frac{\partial \Psi}{\partial \alpha^{(k)}} + \sum_j \frac{\partial \lambda^{(j)}}{\partial \alpha^{(k)}} \langle B^{(j)} \rangle + \sum_j \lambda^{(j)} \frac{\partial  \langle B^{(j)} \rangle}{\partial \alpha^{(k)}} \\
\end{align*}
$$

* Working on the 1st term $$\frac{\partial \Psi}{\partial \alpha^{(k)}}$$ alone we have:

$$
\begin{align*}
\frac{\partial \Psi}{\partial \alpha^{(k)}} &= e^{-\Psi} \frac{\partial \sum_i e^{-\sum_j \lambda^{(j)}b_i^{(j)}}}{\partial \alpha^{(k)}}
= e^{-\Psi} \sum_i \frac{\partial e^{-\sum_j \lambda^{(j)}b_i^{(j)}}}{\partial \alpha^{(k)}} \\

&= - e^{-\Psi} \sum_{i,j} \frac{\partial \lambda^{(j)} }{\partial \alpha^{(k)}} b_i^{(j)} e^{-\sum_j \lambda^{(j)}b_i^{(j)}}
- e^{-\Psi} \sum_{i,j} \lambda^{(j)} \frac{\partial b_i^{(j)}}{\partial \alpha^{(k)}} e^{-\sum_j \lambda^{(j)}b_i^{(j)}} \\

&= - \sum_{i,j} \frac{\partial \lambda^{(j)} }{\partial \alpha^{(k)}} b_i^{(j)} p_i
- \sum_{i,j} \lambda^{(j)} \frac{\partial b_i^{(j)}}{\partial \alpha^{(k)}} p_i \\

&= - \sum_{j} \frac{\partial \lambda^{(j)} }{\partial \alpha^{(k)}} \langle B^{(j)} \rangle
- \sum_{j} \lambda^{(j)} \langle \frac{\partial b^{(j)}  }{\partial \alpha^{(k)}} \rangle
\end{align*}
$$

Substituting this in the original equation:

$$
\begin{align*}
\frac{1}{k_B}\frac{\partial S}{\partial \alpha^{(k)}} 
&= \frac{\partial \Psi}{\partial \alpha^{(k)}} + \sum_j \frac{\partial \lambda^{(j)}}{\partial \alpha^{(k)}} \langle B^{(j)} \rangle + \sum_j \lambda^{(j)} \frac{\partial  \langle B^{(j)} \rangle}{\partial \alpha^{(k)}} \\

&= \sum_j \lambda^{(j)} \frac{\partial  \langle B^{(j)} \rangle}{\partial \alpha^{(k)}} - \sum_{j} \lambda^{(j)} \langle \frac{\partial b^{(j)}  }{\partial \alpha^{(k)}} \rangle
\end{align*}
$$

Written as differential form with respect to vectors $$\frac{\partial}{\partial \alpha^{(k)}}$$:

$$
\begin{align*}
\frac{1}{k_B}\mathrm{d}S
&= - \sum_{j,k} \lambda^{(j)} \langle \frac{\partial b^{(j)}  }{\partial \alpha^{(k)}} \rangle \mathrm{d}\alpha^{(k)} + \sum_j \lambda^{(j)} \mathrm{d}\langle B^{(j)} \rangle
\end{align*}
$$

[The Canonical Ensemble Part 1](http://gtribello.github.io/mathNET/canonical-ensemble-video1.html)
* Instead of saying that in microstate $$x_i, p_i$$ we are given extensive quantities $$V_i, E_i, N_i$$, assume we're given functions of $$x_i, p_i$$ that can compute these extensive quantities: $$V(x_i, p_i), E(x_i, p_i), N(x_i, p_i)$$
* And the energy is computed by the Hamiltonian, so replace $$E(x_i, p_i)$$ by the Hamiltonian $$H(x_i, p_i)$$
* The constraints now are:

$$
\begin{align*}
\delta(N(\bf{x_i},\bf{p_i}) - N') &\gt 0 \\
\delta(V(\bf{x_i},\bf{p_i}) - V') &\gt 0 \\
\langle E \rangle = \sum_i p_i H(\bf{x_i},\bf{p_i})
\end{align*}
$$

* The number of particles $$N'$$ and volume $$V'$$ are fixed constraints, but the energy is allowed to fluctuate. The expected value of the energy must be finite.
* We would not write the constraints this way. Instead, the volume and the number of parameters would appear as fixed parameters in our Hamiltonian.
* Questions we will answer:
  * If $$N$$ and $$V$$ are fixed, what is the probability of being in each microstate?
  * How does the entropy change when we change $$N$$ and $$V$$?
* If the volume and number of particles are fixed, the sum $$-\sum_k \lambda_k B_j^{(k)}$$ contains only one term - the energy, which is defined by the Hamiltonian
* Probability of being in a microstate:

$$
\begin{align*}
p_j = \frac{e^{- \beta H(\bf{x_j},\bf{p_j})}}{e^\Psi} = \frac{e^{- \beta H(\bf{x_j},\bf{p_j})}}{Z}  \text{ where } \beta = \frac{1}{k_B T}
\end{align*}
$$

* Generalized partition function:

$$
\begin{align*}
Z = e^\Psi = \sum_j e^{- \beta H(\bf{x_j},\bf{p_j}) } 
\end{align*}
$$

* When only extensive quantities that are fixed are volume and number of particles, we call this the _canonical ensemble_ system
* In the canonical ensemble, the system can exchange heat, but cannot change volume or mattter.
* What happens to the entropy if we change the volume or the number of atoms? Qw get:

$$
\begin{align*}
\frac{1}{k_B}\mathrm{d}S
&= - \sum_{j,k} \lambda^{(j)} \langle \frac{\partial b^{(j)}  }{\partial \alpha^{(k)}} \rangle \mathrm{d}\alpha^{(k)} 
+ \sum_j \lambda^{(j)} \mathrm{d}\langle B^{(j)} \rangle \\

&= - \beta \sum_{k} \langle \frac{\partial H(\bf{x_j},\bf{p_j})  }{\partial \alpha^{(k)}} \rangle \mathrm{d}\alpha^{(k)} 
+ \beta \mathrm{d}\langle H(\bf{x_j},\bf{p_j}) \rangle \\

&= - \beta \langle \frac{\partial H }{\partial N} \rangle \mathrm{d}V
- \beta \langle \frac{\partial H }{\partial V} \rangle \mathrm{d}N
+ \beta \mathrm{d} E

\end{align*}
$$

* But recall from classical thermodynamics

$$
\begin{align*}
\mathrm{d}E &= T \mathrm{d} S - P \mathrm{d} V + \mu \mathrm{d} N \mathrm{ so } \\

\mathrm{d} S &= \frac{1}{T} \mathrm{d} E + \frac{P}{T} \mathrm{d} V - \frac{\mu}{T} \mathrm{d} N
\end{align*}
$$

so we get

$$
\begin{align*}
\beta &= \frac{1}{k_B T}
\end{align*}
$$


[The Canonical Ensemble Part 2](http://gtribello.github.io/mathNET/canonical-ensemble-video2.html)

* Aim: Calculate ensemble averages, and introduce fluctuations
* For the canonical ensemble:

$$
\begin{align*}
\frac{S}{k_B} &= \Psi + \sum_j \lambda^{(j)}\langle B^{(j)} \rangle \\

&= \Psi + \beta E  \\

&= \Psi + \frac{1}{k_B T} E \text{ so } \\

k_B T \Psi &= - (E-TS)
\end{align*}
$$

* Recall that $$E - TS$$ is the definition of the Helmholtz free energy $$F$$. introduced when discussing thermodynamic potentials, in the context of classical thermodynamics.
* Recall that $$e^\Psi$$ is the canonical partition function also denoted $$Z_c$$.
* We get the following formulation for free energy:

$$
\begin{align*}
F = -k_B T \ln Z_c
\end{align*}
$$

* If the free energy of some states is low, this is equivalent to having a high probability that the system will occupy these states. [I don't understand this.]

* Suppose we have an observable $$A$$, and that we know how to calculate the observable $$A(\bf{x_j},\bf{p_j})$$ from the position and momentum of the microstates of the system

$$
\begin{align*}
\langle A \rangle &= \sum_j A(\bf{x_j},\bf{p_j}) p_j \\

&= e^{-\Psi} \sum_j A(\bf{x_j},\bf{p_j}) e^{- \beta H(\bf{x_j},\bf{p_j})}
\end{align*}
$$

In particular for $$A$$ equal to the energy:

$$
\begin{align*}
\langle E \rangle &= \sum_j H(\bf{x_j},\bf{p_j}) p_j \\

&= e^{-\Psi} \sum_j H(\bf{x_j},\bf{p_j}) e^{- \beta H(\bf{x_j},\bf{p_j})} \\
\end{align*}
$$

But the latter can be identified with $$\frac{\partial \Psi}{\partial \beta}$$, as follows:

$$
\begin{align*}
Z_c &= \sum_j e^{- \beta H(\bf{x_j},\bf{p_j}) } \\

\Psi &= \ln \sum_j e^{- \beta H(\bf{x_j},\bf{p_j}) } \\

\frac{\partial \Psi}{\partial \beta} &= -e^{-\Psi} \sum_j H(\bf{x_j},\bf{p_j}) e^{- \beta H(\bf{x_j},\bf{p_j})} \\

&= \sum_j H(\bf{x_j},\bf{p_j}) e^{- \beta H(\bf{x_j},\bf{p_j}) - \Psi} \\
\end{align*}
$$

* So we get $$\langle E \rangle = - \frac{\partial \Psi}{\partial \beta}$$. A similar argument shows:

$$
\begin{align*}
\frac{\partial^2 \Psi}{\partial \beta^2} &= 
\sum_j H(\bf{x_j},\bf{p_j}) \frac{\partial e^{- \beta H(\bf{x_j},\bf{p_j}) - \Psi}}{\partial \beta}
 \\

 &= 
-\sum_j \left[ H(\bf{x_j},\bf{p_j}) \right]^2  e^{- \beta H(\bf{x_j},\bf{p_j}) - \Psi}
- \frac{\partial \Psi}{\partial \beta} \sum_j H(\bf{x_j},\bf{p_j}) e^{- \beta H(\bf{x_j},\bf{p_j}) - \Psi}
\\

 &= 
-\sum_j \left[ H(\bf{x_j},\bf{p_j}) \right]^2  e^{- \beta H(\bf{x_j},\bf{p_j}) - \Psi}
- \left[ \frac{\partial \Psi}{\partial \beta} \right]^2
\\

 &= 
-\sum_j \left[ H(\bf{x_j},\bf{p_j}) \right]^2  p_j
+ \langle E \rangle^2 = Var(E)
\\
\end{align*}
$$

* We get $$Var(E) = \frac{\partial^2 \Psi}{\partial \beta^2}$$, and because the variance is positive, $$\Psi$$ is convex.
* $$Var(E) = k_B T^2 C_v$$ for the heat capacity $$C_v$$

[Model Systems I: Lattice Systems Gasses](http://gtribello.github.io/mathNET/lattice-gas-video.html)

* System has $n$ non-interacting particles which can have spin up, spin down states denoted $$+1,-1$$.
* Total energy: $$E = - \sum_i s_i \mu H$$, where:
  * $$s_i = +1 \mathrm{ or } -1$$ is the spin state
  * $$\mu$$ is the magnetic moment
  * $$H$$ is the magnetic field strength
* The partition function is

$$
\begin{align*}
Z
&= \sum_{s_1 \in \{-1,1\}}... \sum_{s_N \in \{-1,1\}} e^{- \beta \sum_{i=1}^N s_i \mu H} \\

&= \prod_{i=1}^N\left( e^{\beta \mu H} + e^{-\beta \mu H} \right) 
= \left( e^{\beta \mu H} + e^{-\beta \mu H} \right)^N \\

&= 2^N \cosh^N (\beta \mu H)
\end{align*}
$$

* So $$Z = 2^N \cosh^N (\beta \mu H)$$
* The average internal energy is

$$
\begin{align*}
\langle E \rangle 

&= - \frac{\partial \Psi}{\partial \beta} = - \frac{\partial \ln Z}{\partial \beta} = - \frac{\partial (N \ln 2)}{\partial \beta} - \frac{\partial (N \cosh (\beta \mu H))}{\partial \beta} \\

&= -N \mu H \tanh (\beta \mu H)
\end{align*}
$$

* So $$\langle E \rangle = -N \mu h \tanh (\beta \mu H)$$
* Recall that $$\beta = \frac{1}{k_B T}$$
  * When $$T$$ tends to $$0$$, $$\beta$$ tends to $$+\infty$$, and $$\langle E \rangle$$ is minimized. The spins $$s_i$$ align with the magnetic field.
  * When $$T$$ tends to $$+\infty$$, $$\beta$$ tends to $$0$$, and $$\langle E \rangle$$ tends to $$0$$. The spins $$s_i$$ tend to be equally distributed among $$-1, 1$$.

* The average magnetisation $$\langle M \rangle = \langle \sum_{i=1}^N s_i\mu \rangle$$ is

$$
\begin{align*}
\langle M \rangle &= \langle \sum_{i=1}^N s_i\mu \rangle \\
&= \frac{1}{H} \langle \sum_{i=1}^N s_i \mu H \rangle = -\frac{1}{H} \langle E \rangle =  N \mu \tanh (\beta \mu H)
\end{align*}
$$

* When $$T$$ is minimized, $$\tanh(β \mu H) \rightarrow 1$$, $$\langle E \rangle \rightarrow -N \mu H$$ is minimized, and $$\langle M \rangle \rightarrow N\mu$$ is maximized.
* When $$T$$ is maximized, $$\langle M \rangle$$ goes down to $$0$$.

[Model Systems II: The Ising model](http://gtribello.github.io/mathNET/ising-model-video.html)

* Compared to the previous model, we add interactions between neighboring particles in the lattice
* The Hamiltonian for the simple closed 1-d Ising model is $$H = - J \sum_{i=1}^N s_i s_{i+1} - H \sum_{i=1}^N s_i$$ where $$s_{N+1} = s_1$$
* Used to describe interactions of particles sitting on a ring and having spin up, spin down states
* Rewrite the Hamiltonian as

$$
\begin{align*}
$H = - \sum_{i=1}^N \left[ J s_i s_{i+1} \right] + H \sum_{i=1}^N \frac{s_i + s_{i+1}}{2}
\end{align*}
$$


[Model Systems III: The statistical mechanics of the ideal gas](https://www.youtube.com/watch?v=MOOV1K5mKeY)

[Model Systems IV: Real gases molecular systems](http://gtribello.github.io/mathNET/molecular-gas-video.html)