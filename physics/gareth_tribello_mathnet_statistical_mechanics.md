---
layout: page
mathjax: true
title: Gareth Tribello - MathNet - Statistical Mechanics
---
Notes on [MathNet](http://gtribello.github.io/mathNET)

This is a multi-part post:
* [MathNet - Classical Thermodynamics](gareth_tribello_mathnet_classical_thermodynamics.md)
* [MathNet - Statistical Mechanics](gareth_tribello_mathnet_statistical_mechanics.md)

[An introduction to statistical mechanics and the principle of equal a priori probabilities](https://www.youtube.com/watch?v=0LdL1LUrE0I)
* Ludwig Boltzmann's principle of apriori probabilities, shortened, and in modern formulation:
  * Suppose we have some atoms.
  * Their state in Newtonian physics is characterized by _positions_ and _momenta_
  * A _microstate_ is the set of all positions and momenta of atoms in the system at a given time. It is denoted by vectors of position and momentum $$(x, p)$$, where the vector dimension is the number of atoms.
  * The set of all possible microstates $$x_i, p_i$$ is called _phase space_.
  * Each microstate has associated  _extensive quantities_
    * _Extensive_ quantities are physical properties of a system that scales linearly with the size of the system - e.g. the volume of a gas, mass, energy, and entropy
    * _Intensive_ quantities are physical properties that do not depend on the size of the system - e.g. temperature, pressure, and chemical potential.
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
+ \left[ \frac{\partial \Psi}{\partial \beta} \right]^2
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
  * $$s_i = +1 \text{ or } -1$$ is the spin state
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

* When $$T$$ is minimized, $$\tanh(\beta \mu H) \rightarrow 1$$, $$\langle E \rangle \rightarrow -N \mu H$$ is minimized, and $$\langle M \rangle \rightarrow N\mu$$ is maximized.
* When $$T$$ is maximized, $$\langle M \rangle$$ goes down to $$0$$.

[Model Systems II: The Ising model](http://gtribello.github.io/mathNET/ising-model-video.html)

* Compared to the previous model, we add interactions between neighboring particles in the lattice
* The Hamiltonian for the simple closed 1-d Ising model is $$H = - J \sum_{i=1}^N s_i s_{i+1} - H \sum_{i=1}^N s_i$$ where $$s_{N+1} = s_1$$
* Used to describe interactions of particles sitting on a ring and having spin up, spin down states
* Rewrite the Hamiltonian as

$$
\begin{align*}
H = - \sum_{i=1}^N \left[ J s_i s_{i+1} + H \frac{s_i + s_{i+1}}{2} \right]
\end{align*}
$$


[Model Systems III: The statistical mechanics of the ideal gas](https://www.youtube.com/watch?v=MOOV1K5mKeY)

* Generalized partition function:

$$
\begin{align*}
Z = e^\Psi = \sum_j e^{- \beta H(\bf{x_j},\bf{p_j}) } 
\end{align*}
$$

* We've seen that expected energy and energy variance can be computed as partial derivatives of the logarithm of the generalized partition function $$\ln Z = \Psi$$
* For the ideal gas, we have non-interacting, independent particles
* There is no interaction between particles
* $$N$$ particles in a volume $$V$$
* Each particle is moving, and each particle has a kinetic energy $$m v^2$$
* Hamiltonian given by

$$
\begin{align*}
H(x, p) = \sum_{i=1}^N \frac{p_{ix}^2}{2m} + \frac{p_{iy}^2}{2m} + \frac{p_{iz}^2}{2m}
\end{align*}
$$

* We start by calculating the partition function for a system of a single atom.
* Since particles are independent, the partition function of $$N$$ particles will be the partition function of a single particle, raised to the power $$N$$
* What microstates do you have for a single particle?
   * The particle can be in any location in the volume
   * We'll have to consider all the directions and speeds that the particles can have
   * We have continuous quantities - and use integrals. For one atom in a cube with side of length $$L = \sqrt[3]V$$:

$$
\begin{align*}
Z &= \frac{1}{h^3} \int_0^L \mathrm{d}x \int_0^L \mathrm{d}y \int_0^L \mathrm{d}z \int_{-\infty}^\infty \int_{-\infty}^\infty \int_{-\infty}^\infty \mathrm{d}p_x \mathrm{d}p_y \mathrm{d}p_z e^{-\beta \left[ \frac{p_x^2}{2m} + \frac{p_y^2}{2m} + \frac{p_z^2}{2m} \right]} \\

&= \frac{V}{h^3} \left[  \int_{-\infty}^\infty e^{-\beta \frac{p^2}{2m}} \mathrm{d}p \right]^3 \\

&= \frac{V}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}}
\end{align*}
$$

* $$h$$ here is Planck's constant.
  * It appears here for reasons that are deeply rooted in quantum mechanics.
  * Statistical mechanics was developed however before quantum mechanics.
  * Physicians argued the constant must appear there for the following reasons.
    * In order to use partition functions, we need to take their logarithm
    * This means the partition function must be unitless.
    * But each integral over length introduces a unit of length
    * Each integral over momentum will introduce a momentum unit of length
    * We get a unit of length cubed multiplied by momentum cubed
    * We must therefore divide by a constant of the same unit
    * It turns that $$h^3$$ has the right unit, although that's not the reason why we use it.
    * If we argue this classically, we can use any constant with the right unit, for length times momentum.
* We calculate the partition function for a system of $$N$$ non-interacting atoms. We suspect we'll get:

$$
\begin{align*}
Z &= \left[ \frac{V}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} \right]^N
\end{align*}
$$

* Investigating a bit further, compute the free energy:

$$
\begin{align*}
F &= - k_B T \ln Z \\

&= - N k_B T \ln \left[ \frac{V}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} \right] \\

&= - N k_B T \ln V - N k_B T \ln \left[ \frac{1}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} \right]
\end{align*}
$$

* We can set $$\left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} = \frac{1}{V_0}$$ as a constant, where $$V_0$$ has the unit of volume. Thus, if another constant than $$h$$ was picked, it would have disappeared here.
* This expression is the difference between the free energy of a volume $$V$$, and the free energy of a reference state. If we change the $$h$$ constant, we just change the reference state.
* Let's use this expression for a thought experiment.
* Suppose that a chamber is divided in two, with number of atoms and volume $$N_1, V_1$$ and $$N_2, V_2$$, and we compute the free energy of each part. The free energy should be additive:

$$
\begin{align*}
F_1 &= - N_1 k_B T \ln V_1 + N_1 k_B T \ln V_0 \\
F_2 &= - N_2 k_B T \ln V_2 + N_2 k_B T \ln V_0 \\
F_{1+2} &= - (N_1+N_2) k_B T \ln (V_1+V_2) + (N_1+N_2) k_B T \ln V_0 \\
\end{align*}
$$

We have

$$
\begin{align*}
N_1 \ln \left( \frac{V_1+V_2}{V_1} \right) + N_2 \ln \left( \frac{V_1+V_2}{V_2} \right) \gt 0
\end{align*}
$$

* Contradiction! This is the Gibbs paradox. The resolution of this problem is still actively researched, and is part of quantum mechanics.

* When we looked at the particles position and momentum $$\{ x_1, p_1\}, \{ x_2, p_2\}, \text{ ... }, \{ x_N, p_N\}$$, we can swap the labels for index 1 and 2.
* Every way of ordering the particles is equivalent.
* We have $$N!$$ ways to order the particles.
* The final partition function is thus given by

$$
\begin{align*}
Z &= \frac{1}{N!} \left[ \frac{V}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} \right]^N
\end{align*}
$$

* Introducing this $$N!$$ does solve the Gibbs paradox
* The free energy is

$$
\begin{align*}
F = k_B T \ln N! - N k_B T \ln V + N k_B T \ln V_0
\end{align*}
$$

* Sterling's approximation: $$\ln N! \sim N \log N - N$$
* When inserted in the Free Energy formula, for large $$N$$:

$$
\begin{align*}
F = - N k_B T \ln \frac{V}{N} + N k_B T \ln V_0 - N
\end{align*}
$$

* We get

$$
\begin{align*}
F_1 &= - N_1 k_B T \ln \frac{V_1}{N_1} + N_1 k_B T \ln V_0 - N_1 \\
F_2 &= - N_2 k_B T \ln \frac{V_2}{N_2} + N_2 k_B T \ln V_0 - N_2 \\
F_{1+2} &= - (N_1+N_2) k_B T \ln \frac{V_1+V_2}{N_1+N2} + (N_1+N_2) k_B T \ln V_0 - N_1 - N_2\\
\end{align*}
$$

* And this time we have, because the number of particles is proportional to the volume for the two partitions, given that the partitions have the same density:

$$
\begin{align*}
N_1 \ln \left( \frac{V_1+V_2}{N_1+N_2} \frac{N_1}{V_1} \right) + N_2 \ln \left( \frac{V_1+V_2}{N_1+N_2} \frac{N_2}{V_2} \right) = 0
\end{align*}
$$

* Let's write the equation of motion for the ideal gas
* Write $$F = -N k_B T \ln V + N k_B T \ln V_0 + C$$
* Remeber that pressure $$P = \left( \frac{\partial F}{\partial V} \right)_T$$
* Last two terms of $$F$$ do not contribute to the partial derivative
* We're left with

$$
\begin{align*}
P = \frac{N k_B T}{V}
\end{align*}
$$

* This is the equation of state for the ideal gas, $$PV=Nk_BT$$

[Model Systems IV: Real gases molecular systems](http://gtribello.github.io/mathNET/molecular-gas-video.html)
* For the ideal gas, the Hamiltonian was:

$$
\begin{align*}
H(x, p) = \sum_{i=1}^N \frac{p_{ix}^2}{2m} + \frac{p_{iy}^2}{2m} + \frac{p_{iz}^2}{2m}
\end{align*}
$$

* The partition function was calculated as:

$$
\begin{align*}
Z &= \frac{1}{N!} \left[ \frac{V}{h^3} \left( \frac{2m\pi}{\beta}  \right)^{\frac{3}{2}} \right]^N
\end{align*}
$$

* We showed, taking suitable partial derivatives of this equation, that we could recover the state equation for ideal gas, that had been discovered through experimentation:

$$
\begin{align*}
P = \frac{N k_B T}{V}
\end{align*}
$$

* Using the formula for the average energy $$E = - \frac{\partial \ln Z}{\partial \beta}$$, we got $$E = \frac{3}{2} N k_B T$$
* Using the formula for the heat capacity $$C_v = \left( \frac{\partial E}{\partial T} \right)_V$$, we got $$C_v = \frac{3}{2} N k_B$$
* We referred to this as the _model for ideal gas_, because in experimetation, real gasses deviate from these laws
* In this section and next, we are going to create realistic models for gasses
* There are three principles we assumed for the ideal gas.
  * We assumed there are no interactions between the particles that make up the gas. This is not true, elsewhere the gas would never liquefy or become solid. That being said, the interactions are always weak. When we model gasses, this turns out to not be such a bad assumption
  * We assumed that the gas was composed of 0-dimensional particles. We assumed that atoms and molecules making up the gas have no internal structure. If the model is accurate, we have to consider this fine structure.
  * We finally assumed that the particles that make up the gas behave classically. In reality, they behave quantum mechanically. We need to take quantum mechanics into account.
* We will focus on how to incorporate the internal structure of particles.
* Real gasses however have all these three properties simultaneously.
* When we see deviations from reality, it can be difficult to ascribe the deviations to one or another of these three properties as compared to the ideal model.
* An advantage of modeling in theory is that we can incorporate all these three properties one by one, and see how the effect differs.
* We can thus observe, for example, that at high temperature, the quantum effects are not that visible.
* Similarly, the deviations due to internal structure of the particles that make up the gas is smaller for noble gases than, say, for oxygen, which is composed of $$O_2$$ molecules.
* If we understand how the macroscopic properties of molecules can be calculated based on the microscopic interactions between atoms, we can begin to understand how we can understand the microscopic properties of the molecules based on macroscopic experiments that measure microscopic properties.
  * This business of understanding deviations from ideality is very important.
* When the Hamiltonian breaks into a sum of terms with independent variables $$H(x_1, x_2, x_3, x_4) = H_1(x_1)+H_2(x_2)+H_3(x_3,x_4)$$, we've seen that the partition function breaks into a product of partition functions $$Z={\color{red} {\int e^{-\beta H_1(x_1)} \mathrm{d}x_1}} {\color{green} {\int e^{-\beta H_2(x_2)} \mathrm{d}x_2}} \int e^{-\beta H_3(x_3,x_4)} \mathrm{d}x_3 \mathrm{d}x_4={\color{red} Z_1}{\color{green} {Z_2}}Z_3$$
* Consider the gas with the simples molecule, a diatomic, like $$N_2$$, $$O_2$$ or $$F_2$$
* Suppose it is confined in 2 dimensions. The arguments will be very similar in 3D.
* How many numbers are needed to specify the molecule position and velocity?
  * 2 for x, y coordinates of 1st atom position
  * 2 for velocity of 1st atom
  * Total - 8 degrees of freedom for both atoms.
  * In general, $$N$$ atoms have $$6N$$ degrees of freedom
  * We might specify position of center of mass and rotation around center of mass. This still gives 8 degrees of freedom.
  * However, when translating the center of mass, and rotating around the center of mass, we construct a Hamiltonian to describe motion with relation to these new coordinates.
  * When we do this, unless there is an external field, the center of mass and the angle do not factor in the Hamiltonian. Only the rotation velocily enters the Hamiltonian.
  * For this reason, the number of degrees of freedom can be reduced by 3, from 6 to 3.
  * The extension and compression of the bond enter the hamiltonian as elastic vibration. We get 2 vibrational degrees of freedom.
  * In summary:
    * 4 translational degrees of freedom $$x_{com},y_{com},v_x,v_y$$
    * 2 rotational degrees of freedom $$\theta, v_theta$$
    * 2 vibrational degrees of freedom, $$l, v_l$$
    * $$x_{com}, y_{com}, \theta$$ do not factor in the Hamiltonian
* We can write the Hamiltonian as a sum of a translational, rotational and vibrational part as shown here:

$$
\begin{align*}
H = H_{trans}(v_x,v_y) + H_{rot}(v_\theta) + H_{vibes}(l, v_l)
\end{align*}
$$

* The number of degrees of freedom is the number of parameters in the Hamiltonian
* In general, a molecule of $$N$$ atoms in 3D will have $$6N-6$$ degrees of freedom
* The partition function is:

$$
\begin{align*}
Z&={\color{red}{\int e^{-\beta H_{trans}(v_x,v_y)} \mathrm{d}v_x \mathrm{d}v_y}} {\color{green}{\int e^{-\beta H_{rot}(v_\theta)} \mathrm{d}v_\theta}} \int e^{-\beta H_{vibes}(l,v_l)} \mathrm{d}l \mathrm{d}v_l
\end{align*}
$$

* We compute the $${\color{red}{first}}$$ integral as if it was a molecule with only translational degrees of freedom - this is just the partition function for the ideal gas $${\color{red}{Z_{trans}}}$$.
* To compute the $${\color{green}{second}}$$ integral, we consider particles that have only rotational degree of freedom. This is also straightforward - we get $${\color{green}{Z_{rot}}}$$. It's done in exercises.
* Similarly, compute in exercises $$Z_{vib}$$.
* Once you know $$Z_{trans}, Z_{rot}, Z_{vib}$$, you can find the partition function for any molecule.
* Importantly, this all assumes there is no coupling between these degrees of freedom.
* Normally, we consider that the rotational and vibrational degrees of freedom are not coupled, and this this factorization of the partition function is valid.

[The cluster expansion: including interactions in models for gasses](https://www.youtube.com/watch?v=O8EafwqqXsQ)
* We'll calculate the partition function for a gas, and include the interactions directly.
* We'll deal with the weak interaction between the particles of the gas.
  * Independent particles, interating particle systems
* We'll assume no quantum effects, and no effect because of the internal structure within the particle.
* When we use models such as this to fit experimental data, we'll incorporate numerical deviations that arise because the internal structure of the particles, in parameters that describe interactions
* Hamiltonian looks like this:

$$
\begin{align*}
H(x, p) = {\color{red}{\sum_{i=1}^N \frac{p_{ix}^2}{2m} + \frac{p_{iy}^2}{2m} + \frac{p_{iz}^2}{2m}}} + {\color{green} {\sum_{i=2}^N\sum_{j=1}^{i-1} V(r_{ij})}}
\end{align*}
$$

* Red term is the kinetic energy as for the ideal gas
* Green term is the interaction term between $$N(N-1)/2$$ pairs of atoms
* $$r_{ij}$$ is the distance between particles $$i,j$$
* Rewrite as

$$
\begin{align*}
H(x, p) = {\color{red}{\sum_{i=1}^{3N} \frac{p_{i}^2}{2m}}} + {\color{green}{\sum_{i=2}^N\sum_{j=1}^{i-1} V(r_{ij})}}
\end{align*}
$$

* The partition function:

$$
\begin{align*}
Z&=\frac{1}{h^{3N}}
{\color{red}{\prod_{i=1}^N \int e^{- \beta \frac{p_{i}^2}{2m}} \mathrm{d}p_i}}
{\color{green}{\int e^{-\beta {\sum_{i=2}^N\sum_{j=1}^{i-1} V(r_{ij})}} \mathrm{d}x_1... \mathrm{d}x_{3N}}}
\end{align*}
$$

* These are definite integrals, even though the convention in stat mechanics is to not put the integration limits. These integration limits are $$0$$ to $$L$$ for coordinates, where $$L$$ is the length of the cube, and $$0$$ to $$\infty$$ for momentum.
* We divide by $$h^{3N}$$ to ensure $$Z$$ has no units.
* We get

$$
\begin{align*}
Z&=\frac{1}{h^{3N}}
{\color{red}{\left[ \int e^{- \beta \frac{p_{i}^2}{2m}} \mathrm{d}p \right]^{N}}}
{\color{green}{\int e^{-\beta {\sum_{i=2}^N\sum_{j=1}^{i-1} V(r_{ij})}} \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\

&= \frac{1}{h^{3N}}
{\color{red}{\left[ \int e^{- \beta \frac{p_{i}^2}{2m}} \mathrm{d}p \right]^{N}}}
{\color{green}{\int \prod_{i=2}^N\prod_{j=1}^{i-1} e^{-\beta { V(r_{ij})}} \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\

&= \frac{1}{h^{3N}}
{\color{red}{\left[ \int e^{- \beta \frac{p_{i}^2}{2m}} \mathrm{d}p \right]^{N}}}
{\color{green}{\int \prod_{i=2}^N\prod_{j=1}^{i-1} 
(1+f_{ij}) \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\
\end{align*}
$$

where we wrote $$f_{ij}$$ for $$e^{-\beta { V(r_{ij})}}$$
* Since distances $$r_{ij}$$ are very small, we can ignore quadratic terms in the product, and get the approximation:

$$
\begin{align*}
Z &\approx
\frac{1}{h^{3N}}
{\color{red}{\left[ \int e^{- \beta \frac{p_{i}^2}{2m}} \mathrm{d}p \right]^{N}}}
{\color{green}{\int \left[ 1+\sum_{i=2}^N\sum_{j=1}^{i-1} 
f_{ij} \right] \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\

&= \frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[\int \mathrm{d}x_1... \mathrm{d}x_{3N} + \int  \sum_{i=2}^N\sum_{j=1}^{i-1} 
f_{ij} \right] \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\

&= \frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \int  \sum_{i=2}^N\sum_{j=1}^{i-1} 
f_{ij} \right] \mathrm{d}x_1... \mathrm{d}x_{3N}}} \\
\end{align*}
$$

* If you neglect the remaining integral, the result is exactly what we get for the ideal gas. The integral is the term due to interactions.
* To solve the Gibbs paradox, for the ideal gas, we multiplied with $$\frac{1}{N!}$$

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \int  \sum_{i=2}^N\sum_{j=1}^{i-1} 
f_{ij}  \mathrm{d}x_1... \mathrm{d}x_{3N}\right]}} \\
\end{align*}
$$

* Reorder summation in the integral:

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \sum_{i=2}^N\sum_{j=1}^{i-1} 
\int f_{ij} \mathrm{d}x_1... \mathrm{d}x_{3N}\right]}} \\
\end{align*}
$$

* $$f_{ij}$$ depends on 2 of the position - i.e., on 6 of the coordinates.
* We can separate $$3L-6$$ integrands, and their integral is $$L^{3L-6} = V^{N_2}$$

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + V^{N-2}\sum_{i=2}^N\sum_{j=1}^{i-1} 
\int f_{ij} \mathrm{d}x_1\mathrm{d}y_1\mathrm{d}z_1 \mathrm{d}x_{2}\mathrm{d}y_{2}\mathrm{d}z_{2}\right]}} \\
\end{align*}
$$

* $$f_{ij}$$ is identical for each pair of atoms, so

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \frac{N(N-1)}{2}V^{N-2}
\int f_{ij} \mathrm{d}x_1\mathrm{d}y_1\mathrm{d}z_1 \mathrm{d}x_{2}\mathrm{d}y_{2}\mathrm{d}z_{2}\right]}} \\
\end{align*}
$$

* Employ coordinate transforms. Integrate over the position of the center of mass, and over three coordinates, $$x_1,y_1,z_1$$ that describe the position of one of the two atoms relative to the center of mass.
* The position of the center of mass will not affect $$f_{12}$$, which is a function of the vector between the two atoms.
* We can separate the integral over the positions of the center of mass. That integral has value $$V$$. We get

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \frac{N(N-1)}{2}V^{N-1}
\int f_{ij} \mathrm{d}x_1\mathrm{d}y_1\mathrm{d}z_1 \mathrm{d}x_{12}\mathrm{d}y_{12}\mathrm{d}z_{12}\right]}} \\
\end{align*}
$$

* We represented the vector betwen the pair of particles in cartesian coordinates. We change to polar coordinates $$r, \theta, \phi$$.

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \frac{N(N-1)}{2}V^{N-1}
\int f_{ij} r^2 \sin \theta \mathrm{d}r\mathrm{d}\theta\mathrm{d}\phi\right]}} \\
\end{align*}
$$

* Limits for the integral run $$0$$ to $$\infty$$ for $$r$$ coordinate, $$0$$ to $$\pi$$ for $$\theta$$ coordinate, and $$-\pi$$ to $$\pi$$ for $$\phi$$ coordinates.
* If we assume that $$f_{12}$$ has no angular dependence, i.e. that it depends only on $$r$$, then:

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + \frac{4 \pi N(N-1)}{2}V^{N-1}
\int f_{ij} r^2 \sin \theta \mathrm{d}r\right]}} \\
\end{align*}
$$

* For any large $$N$$, we have $$N \approx N-1$$, so

$$
\begin{align*}
Z &\approx \frac{1}{N!}\frac{1}{h^{3N}}
{\color{red}{\left[ \frac{2\pi m}{\beta}\ \right]^{\frac{3N}{2}}}}
{\color{green}{\left[V^{N} + 2 \pi N^2V^{N-2}
\int f_{ij} r^2 \mathrm{d}r\right]}} \\
\end{align*}
$$

* Now we have a much more tractable integral.
* To compute it, we ask how does the energy of a pair of atoms change when the two atoms are moved apart?
* From electrostartics, when they are far apart, they don't interact.
* Simplest model is the _hard spheres potential_ model.
  * The potential $$V(r_{12}) = 0$$ for $$a+\sigma \le r_{12}$$
  * $$V(r_{12}) = -\epsilon$$ for $$a \le r_{12} \lt a+\sigma$$
  * $$V(r_{12}) = +\infty$$ for $$r_{12} \le a$$
  * It's called the _hard spheres_ model because essentially it assumes that each atom is a ball of radius $$a$$.
    * These balls are hard and can't interact. That's why $$V(r_{12})$$ shoots to infinity when $$r_{12} \le a$$
    * These balls are sticky and interact when $$r_{12} \lt a+\sigma$$
  * Break up the integral

$$
\begin{align*}
f_{12} &= e^{-\beta V(r_{12})}-1 \\

\int_0^L f_{ij} r^2 \mathrm{d}r &= 
\int_0^a f_{ij} r^2 \mathrm{d}r 

+ \int_a^{a+\sigma} f_{ij} r^2 \mathrm{d}r 

+ \int_{a+\sigma}^L f_{ij} r^2 \mathrm{d}r \\

&= \int_0^a - r^2 \mathrm{d}r 

+ \int_a^{a+\sigma} (e^{\beta \epsilon}-1) r^2 \mathrm{d}r 

+ \int_{a+\sigma}^L 0 r^2 \mathrm{d}r \\

&= -\frac{a^3}{3}
+ \int_a^{a+\sigma} (e^{\beta \epsilon}-1) r^2 \mathrm{d}r \\

&\approx -\frac{a^3}{3}
+ \int_a^{a+\sigma} (1+ {\beta \epsilon}-1) r^2 \mathrm{d}r \\

&= -\frac{a^3}{3} + \beta \epsilon \int_a^{a+\sigma}r^2 \mathrm{d}r \\

&=  -\frac{a^3}{3} + \beta\epsilon \frac{(a+\sigma)^3}{3}  -\beta\epsilon \frac{a^3}{3}

\end{align*}
$$

* We get the equation:

$$
\begin{align*}
Z &\approx \frac{1}{N!} \left[ \frac{V}{h^{3}} \left( \frac{2\pi m}{\beta} \right)^\frac{3}{2} \right]^N

\left[1 + \frac{N^2}{2V} \left( -\frac{a^3}{3} + \beta\frac{\epsilon}{3} [(a+\sigma)^3 - a^3] \right) \right] \\

&= \frac{1}{N!}\left[ \frac{V}{h^{3}} \left( \frac{2\pi m}{\beta} \right)^\frac{3}{2} \right]^N

\left[ 1 + \frac{N^2}{2V} \left( -A + \beta B \right) \right]
\end{align*}
$$

* Andrei: Not clear why we divide by 2 instead of multiplying. Looks like that factor is folded into $$A$$ and $$B$$
* The last term starting with $$\frac{N^2}{2V}$$ is the interaction factor. We will pick linear coefficients $$A$$ and $$B$$ rather than write the longer-form coefficients $$a$$, $$\sigma$$.
* We recall that we can obtain the Free Energy function from the partition function, using $$F = -k_b T \ln Z$$. Substituting in our formula for the partition function:

$$
\begin{align*}
F &\approx - k_B T \ln \left[ \frac{1}{N!}\left[ \frac{V}{h^{3}} \left( \frac{2\pi m}{\beta} \right)^\frac{3}{2} \right]^N

\left[ 1 + \frac{N^2}{2V} \left( -A + \beta B \right) \right] \right] \\

&= - k_B T \ln \left[ \frac{1}{N!}\left[ \frac{V}{h^{3}} \left( \frac{2\pi m}{\beta} \right)^\frac{3}{2} \right]^N \right] 

- k_B T \ln  \left[ 1 + \frac{N^2}{2V} \left( -A + \beta B \right) \right] \\

&\approx F_{ideal} - k_B T \ln  \left[ 1 + \frac{N^2}{2V} \left( -A + \beta B \right) \right] \text{, and since ln(1+x) is approx. x:} \\

F &\approx F_{ideal} - k_B T \frac{N^2}{2V} \left( -A + \beta B \right)
\end{align*}
$$

* This is called the Free Energy of the van der Waals gas.
* We can use the expression of the Free Energy to calculate the equation of state.
* Recalling the form we computed of the Free Energy for the ideal gas, we can write:

$$
\begin{align*}
F &= F_{ideal} - k_B T \frac{N^2}{2V} \left( -A + \beta B \right)  \\

&= N k_B T \ln V - k_B T \frac{N^2}{2V} \left( -A + \beta B \right) + C \text{, for a constant C} \\
\end{align*}
$$

To get the equation of state, we need to take $$P = - \frac{\partial F}{\partial V}$$. We get

$$
\begin{align*}
F &= F_{ideal} - k_B T \frac{N^2}{2V} \left( -A + \beta B \right)  \\

&= N k_B T \ln V - k_B T \frac{N^2}{2V} \left( -A + \beta B \right) + C \text{, for a constant C} \\

P &= \frac{N k_B T}{V} - k_B T \frac{N^2}{2V^2} \left( -A + \beta B \right) \text{, which can be rewritten, up to a change in B:} \\

&= N k_B\frac{T}{V} + \frac{k_B T N^2 A}{2V^2} -  \left(\frac{N}{V}\right)^2 \frac{B}{2}
\end{align*}
$$

* We arrive at

$$
\begin{align*}
P &= \frac{N k_B T}{V} - k_B T \frac{N^2}{2V^2} \left( -A + \beta B \right) \text{, which can be rewritten, up to a change in B:} \\

&= N k_B\frac{T}{V} + \frac{k_B T N^2 A}{2V^2} -  \left(\frac{N}{V}\right)^2 \frac{B}{2} \\

P + \left(\frac{N}{V}\right)^2 \frac{B}{2} &= N k_B T \left( \frac{1}{V} + \frac{AN}{2V^2} \right) \\

&\approx N k_B T \left( \frac{1}{V - \frac{AN}{2}} \right)
\end{align*}
$$

* Which can be rewritten as the _van der Waals equation of state_:

$$
\begin{align*}
\left[ P + \left(\frac{N}{V}\right)^2 \frac{B}{2} \right]  \left( V - \frac{AN}{2} \right) &= N k_B T
\end{align*}
$$

* Why did we make these particular approximations?
* Because we knew this was the final form we wanted to get to
* Often, the final form is one that can be derived through multiple ways
* We could thus make small approximations if we get closer to our final goal
* We know that the partition function is unsolvable, and every equation of state we derive is thus an approximation.
* How would we have derived this equation using a less sophisticated and more qualitative procedure?
* The first term is $$P$$ plus something, and we can think of it as an effect of pressure.
* The second term is $$V$$ minus something, thus an effect of volume
* We thus have an effect of pressure times an effect of volume equals $$N k_B T$$, which is just the equation of state for the ideal gas, $$PV=Nk_B T$$, except we have an effect of pressure times an effect of volume.
* The means of the parameters $$A$$ and $$B$$ become clearer:
  * The $$A$$ is related to the volume of a single atom.
    * We are excluding the volume of atoms from the volume of the total space.
    * Each atom moves around in a reduced space, because the atoms cannot interact.
  * The $$B$$ term mimics the effect of interactions of atoms, and the effect on pressure
    * These additional forces will increase or decrease the pressure created by the walls of the container.
* The van der Waals equation was first derived using considerations such as these.
* This is why the earlier derivation seems peculiar. We knew where we wanted to get to, and made the approximations in order to get there.
