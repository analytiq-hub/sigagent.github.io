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

[Model Systems IV: Real gases molecular systems](http://gtribello.github.io/mathNET/molecular-gas-video.html)

[The analogy between classical Thermodynamics and Newtonian Mechanics](http://gtribello.github.io/mathNET/thermodymaic-variables-video.html)
* In absence of external stimulus, volume, temperature, and number of atoms don't change. These are called _thermodynamic variables_, and are of two types:
  * _Extensive_ variables - value depends on the number of atoms, e.g. number of atoms, volume
  * _Intensive_ variables - value does not depend on the number of atoms, e.g. temperature, pressure
* Thermodynamic law equivalent to Newton's first law: _Any physical system remains in equilibrium with extensive thermodynamic variables fixed unless acted upon by an external agent_
* In Newtonian mechanics, to change a system, you must change its _momentum_, and you do so by applying a force $$F = \frac{\mathrm{d}p}{\mathrm{d}t}$$
* In classical thermodynamics, the state of a system is characterized by _many_ extensive thermodynamic variables.
  * To change the state of the system, you can act to change any of these extensive variables
  * For example, by changing its volume. Or its temperature.
  * We need to quantify how a change in one extensive variable impacts other extensive variables.
* A phase is a part of space.
  * Can divide a system in Phase 1, with number of atoms $$N_1$$, volume $$V_1$$ and pressure $$P_1$$, and Phase 2, with number of atoms $$N_2$$, volume $$V_2$$, and pressure $$P_2$$.
  * The extensive variables of Phase 1 will change when put in contact with a second phase Phase 2 which has different values for its extensive variables.
  * Assume $$P_1 \gt P_2$$.
    * Then $$V_1$$ will increase, and $$V_2$$ will decrease, b/c the total volume is constant.
    * The pressure $$P_1$$ will decrease. The pressure $$P_2$$ will increase.
    * The changes will stop when the two pressures are equal.
    * At equilibrium, the intensive variables take a single value across the entire system
* Thermodynamic laws:
  * Behavior in absence of an external agent: Thermodynamic system remains in equilibrium, with values of extensive variables unchanged.
  * How external agent couples to system: If two phases are put in contact, then the values of conjugate extensive variables will change.
  * Conservation principle: When two phases come to equilibrium, then any incraese in the values of extensive variables in one system must be compensated by a decrease in second phase.

[Work and heat](http://gtribello.github.io/mathNET/work-and-heat-video.html)
* Origin of thermodynamics: scientists wanted to understand how engines work

[Temperature and thhe Gibbs Phase rule](http://gtribello.github.io/mathNET/gibbs-phase-rule-video.html)
* We can characterize the state of a system _phase_ by denoting the values of all _extensive_ thermodynamic variables within it.
* If a phase is put in contact with a 2nd phase, with different _intensive_ thermodynamic variables, then the state of the phase will change.
  * For example, if a force is applied to a lump of material, then its volume could change.
  * This action is quantified throug _intensive_ thermodynamic variables.
* Idea underemphasized in thermodynamics textbooks: _temperature is an intensive thermodynamic variable_
  * The fact that temperature is an intensive thermodynamic variable is evident by the way we measure temperature with a thermometer.
    * Volume of mercury in tube changes. Volume is an extensive thermodynamic variable.
* A phase is basically a part of the sapce. We choose it arbitrarily.
  * Given Phase1, Phase2
    * With extensive variables $$V_1, V_2$$ (volume)
    * With intensive variables $$P_1, P_2$$ (pressure)
      * If the intensive variables $$P1 = P_2$$, these two phases are in equilibrium, and the values of the extensive variables $$V_1, V_2$$ will not change.
      * If $$P_1 \gt P_2$$, then Phase 1 will expand, and its volume will increase, while that of Phase 2 will contract.
      * Vice-versa, if $$V_1$$ increases and $$V_2$$ decreases, then $$P_1$$ decreases and $$P_2$$ increases. This process continues until the pressures become equal, at which point the system is in equilibrium.
    * Consider this process with temperature
    * Temperature is intensive. Any difference in temperature will drive changes in the states.
    * Suppose the volumes of the two phases are fixed throughout, and atoms are not allowed to move between phases.
    * If $$T_1 /gt T_2$$, then how will the system change?
    * Answer: we introduce a new extensive variable: the entropy $$S_1, S_2$$.
    * Enropy describes how two systems with set number of atoms and volume can come to an equilibrium when temperature changes.
    * As $$T_1$$ decreases, and $$T_2$$ increases, in order to bring temperature to equality, the entropy $$S_1$$ decreases, and $$S_2$$ increases.
    * You might have heard _bullshit_ in other places that entropy is related to disorder. _Yuck!_ Aside from being wrong, this is an incomprehensible statement.
      * How is it related to disorder? What does that even mean?
    * Alternatively, entropy is sometimes described as the _quality of energy_. That's equally wrong.
    * Please forget all this _crap_ now! For the time being, define entropy as follows:
      * _Entropy_ is the conjugate extensive variable to the intensive variable _temperature_
      * We are then going to developed a more refined description of entropy as we go along.
      * It does not involve any nonsense like disorder or quality of energy
    * What does it mean for entropy to be a conjugate extensive variable to temperature?
      * It means that temperature is to entropy as pressure is to volume.
      * What we mean by _conjugate_ is that if we change pressure, and do not allow change in entropy or number of atoms, the phases will come to equilibrium by changing their volume.
      * Hence, two phases with different temperature, which are not allowed to change volume or number of atoms, will come to equilibrium by changing this mysterious extensive variable called entropy.
    * Consider phases that can change matter between them
      * Extensive variables are the number of atoms $$N_1, N_2$$
      * Assume $$N_1$$ decreases, and $$N_2$$ increases
      * The conjugate intensive variable to the number of atoms is another made-up intensive variable: the _chemical potential_ $$\mu_1, \mu_2$$
      * The flow of matter from Phase 1 to Phase 2 is given by a difference in the chemical potential $$\mu_1 \gt \mu_2$$
      * The chemical potential $$\mu_1$$ decreases, and $$\mu_2$$ increases.
      * This process continues until the chemical potential becomes equal.
    * Each intensive variable must have a conjugate extensive variable
    * We thus introduce entropy and chemical potential
    * This is the easiest way to introduce these thermodynamic variables.
    * They are created for mathematical convenience only - unline quantities such as pressure, volume, number of atoms.
    * It is not easy to explain what these thermodynamic variables physically represent.
* The state of one phase is completely characterized by a small set of thermodynamic variables.
* Two phases at equilibrium must have the same values for all intensive thermodynamic variables
* We will prove in these lectures the Gibbs phase rule: $$F = C - \pi + 2$$, where $$F$$ is the number of independent thermodynamic variables, $$C$$ is the umber of chemical components (molecule types), $$\pi$$ is the number of phases.
* Consequence: All thermodynamic variables can be calculated if we are given a subset of the thermodynamic variables - for example, at equilibrium, we can write an equation for the pressure in terms of volume and temperature.

[The efficiency of the Carnot engine](http://gtribello.github.io/mathNET/carnot-video-1.html)
* What is temperature?
  * Can't characterize it as _what's hot_, because we don't know what _hot_ means, without defining _hot_ in terms of temperature
  * Can't be a characteristic of the system, because the system is characterized by _extensive_ thermodynamic variables, whereas temperature is _intensive_.
* 19th Century physicists sorted this out.
* They were interested in how steam engines worked.
* In these engines, gas was heated or cooled down, and pistons were used to do work in the environment
* Because of Newton's third law - every action has an equal and opposite reaction - work had to be transferred on the environment.
* It should be able to calculate exactly the work done by the piston by integrating over the change in volume.

$$
\begin{align*}
\Delta w' &= - \int_V^{V+\Delta V} A(V) \mathrm{d}V \\

\Delta w &= - \int_x^{x+\Delta x} F(x) \mathrm{d}x
\end{align*}
$$

* Physical idea: add something hot to something cold, and the cold thing would get hotter (and the hotter system colder). But I would never see the opposite process.
* No process is possible in which the sole result is the transfer of heat from a colder to a hotter body.
* Introducing the reversibe Carnot engine.
<p align="center">
<img src="/physics/diagrams/carnot_cycle_1.png" width="75%" height="75%"/>
</p>
* The gas inside the engine is a one component system. When it's at equilibrium, its state should be characterized by $$1-1+2=2$$ thermodynamic variables.
* If we have the pressure and the volume of the gas in the cylinder, and if the gas in the engine is at equilibrium, we should be able to reconstitute the state of the gas in the engine.
* On completing a full cycle in the Carnot loop, we will return at the initial thermodynamic state of the gas in the engine.
* Consider each of the four steps
  * In the 1st step, the engine is put in contact to a heat bath, and is allowed to expand
    * Gas in the engine stays at the same temperature $$T_2$$
    * Heat flows from the bath into the gas
    * Gas expands isotthermally.
  * In the 2nd step - remove the heat bath. Thermally lag the system. No heat is transferred. When the gas expands further, the temperature decreases to $$T_1$$. Adiabatic expansion - adiabatic because heat is not allowed to transfer in the environment.
  * In the 3rd step, we remove the thermal lag and put the system in contact with a heat sync. Temperature stays at $$T_1$$. The gas contracts, and heat flows from the system into the sink. The gas and the system are contracting isothermally.
  * In the 4th step, we remove the heat sync, and introduce the thermal lagging once more. The system is not allowed to transfer heat to its environmet. The gas in the cylinder is further contracted. Adiabatic contraction.
* When gas is expanded, in steps 1 and 2, work is done on the universe: $$-w_2$$
* When gas is contracted, in steps 3 and 4, work is done by the universe on the system: $$w_1$$.
* Total work done by the gas is $$-\Delta w = w_2 - w_1 \gt 0$$. It is greater than $$0$$ because we want the engine to do work on the universe, else it would be a useless engine.
* $$q_H$$ heat transferred from universe to engine in 1st step, $$q_C$$ heat transferred from engine to universe in 3rd step
* Will have $$q_H - q_C = \Delta w$$

$$
\begin{align*}
\frac{\Delta w}{q_H} = \frac{q_H - q_C}{q_H}
\end{align*}
$$

* The left side is the efficiency of the engine - the ratio of work done to heat input.
* Will now show there is no engine more efficient Carnot engine going from the same temperature $$T_2$$ to $$T_1$$.
* A new engine would use less heat for the same amount of work: $$q_H^{\prime} \lt q_H$$

$$
\begin{align*}
\frac{\Delta w}{q_H^{\prime}} \gt \frac{q_H - q_C}{q_H}
\end{align*}
$$

* We must also have $$q_C^{\prime} \lt q_C$$
* Run the new Carnot engine forward, and the original Carnot engine in reverse.
  * Then, we would do zero total work.
  * And we would get $$q^{\prime}_H - q_H \lt 0$$ from the hot sink, and give $$q^{\prime}_C - q_C \lt 0$$ to the cold sink
  * This would make the hot sink hotter, and the cold sink colder with zero work - contradiction

[The Kelvin definition of temperature](http://gtribello.github.io/mathNET/temperature-video.html)
* We can use the Carnot engine to create a universal calibration for temperature
* 1st step is to assert that a function $$g(T_1, T_2)$$ exists that allows us to calculate the efficiency of the Carnot engine

$$
\begin{align*}
\frac{\Delta w}{q_H} = \frac{q_H - q_C}{q_H} = g(T_1, T_2)
\end{align*}
$$

* Define $$f(T_1, T_2) = 1 - g(T_1, T_2) = \frac{q_C}{q_H}$$
* Denote heat exchanged as $$q_1, q_2, q_3$$.
* So $f(T_1, T_2) = \frac{q_1}{q_2}$$, etc
* We get $$f(T_1, T_3) = f(T_1, T_2) f(T_2, T_3)$$
* This means $$f(T_1, T_2)$$ can be written as a quotient of a new function $$f(T_1, T_2) = \frac{F(T_1)}{F(T_2)}$$
* The simplest function we can choose for $$F$$ is the identity function $$F(T)=T$$
* This is the basis of the Kelvin scale:

$$
\begin{align*}
\frac{q_1}{q_2} = \frac{T_1}{T_2}
\end{align*}
$$

[Adiabatic work](http://gtribello.github.io/mathNET/adiabatic-work-video.html)

During adiabatic expansion:

$$
\begin{align*}
\delta w = - \int_x^{x+\Delta x} F \mathrm{d}x = - \int_x^{x+\Delta x} pA \mathrm{d}x = - \int_V^{V+\Delta V} p \mathrm{d}V
\end{align*}
$$

where the force $$F$$ is pressure $$p$$ times piston area $$A$$, and volume $$V$$ is area times height $$Ax$$.

[Entropy in the Carnot cycle](http://gtribello.github.io/mathNET/carnot-entropy-video.html)

* We've characterized the state of the Carnot cycle in terms of pressure and volume.
