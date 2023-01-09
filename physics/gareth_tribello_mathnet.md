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
* If $$N$$ and $$V$$ are fixed, what is the probability of being in each microstate?
* How does the entropy change when we change $$N$$ and $$V$$?
* If the volume and number of particles are fixed, the sum $$-\sum_k \lambda_k B_j^{(k)}$$ contains only one term - for the energy
* Probability of being in a microstate:

$$
\begin{align*}
p_j = \frac{e^{- \beta H(\bf{x_j},\bf{p_j})}}{e^\Psi} = \frac{e^{- \beta H(\bf{x_j},\bf{p_j})}}{Z}
\end{align*}
$$

* Generalized partition function:

$$
\begin{align*}
Z = e^\Psi = \sum_j e^{- \beta H(\bf{x_j},\bf{p_j}) }  \text{ where } \beta = \frac{1}{k_B T}
\end{align*}
$$


[The Canonical Ensemble Part 2](http://gtribello.github.io/mathNET/canonical-ensemble-video2.html)

[Model Systems I: Lattice Systems Gasses](http://gtribello.github.io/mathNET/lattice-gas-video.html)


[Model Systems III: The statistical mechanics of the ideal gas](https://www.youtube.com/watch?v=MOOV1K5mKeY)
