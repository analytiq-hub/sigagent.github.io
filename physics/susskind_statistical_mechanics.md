---
layout: page
mathjax: true
title: Leonard Susskind - Statistical Mechanics - Andrei's Notes
---

[Statistical Mechanics](https://theoreticalminimum.com/courses/statistical-mechanics/2013/spring) (Spring 2013)

[L1: Entropy and conservation of information](https://www.youtube.com/watch?v=D1RzvXDXyqA)
* Given $$N$$ states, assuming the system can take one of $$M \le N$$ states with equal probability $$\frac{1}{M}$$, its entropy is defined as $$S=\log M$$.
  * It is a measure of uncertainty - of lack of information.
* Liouville theorem:
  * The volume in phase space of a system does not change in time.
  * If you start with a uniform distribution in the phase space, the distribution remains uniform over time.
* 0th law of thermodynamics: if system A is in thermal equilibrium with B, and B with C, then A is in thermal equilibrium with C. But we will define later what thermal equilibrium is.
* 1st law of thermodynamics is, essentially, the conservation of energy for a closed system: $$\frac{\mathrm{d}E}{\mathrm{d}t} = 0$$
* In this course, $$T$$ is $$k_Bt$$, for the classic Kelvin temperature $$t$$, and entropy $$S$$ is defined probabilistically as $$S=-\int p \ln p$$, which is $$k_B$$ times classic thermodynamic entropy.
  * Computer scientists use $$\log_2$$, physicists use $$\log_e$$
* In the 1st law of thermodynamics $$\mathrm{d}E = T \mathrm{d}S$$, if we switch units for $$T$$ and $$S$$ and use the classic thermodynamic definition of temperature and entropy, the 1st law of thermodynamics still holds.

[L2: Temperature](https://www.youtube.com/watch?v=MCRHXHskWnE&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=2)
* Temperature really has units of energy
* Entropy is unitless
  * Any physical property that is defined in terms of logarithms, usually, should be expected to be unitless.
* States, probability distributions, energy, entropy
* Definition of temperature as $$T = \frac{\partial E}{\partial S}$$
* 1st law of thermodynamics: $$\mathrm{d}E = T \mathrm{d}S$$
* 2nd law of thermodynamics: the entropy of an isolated system will increase
* The two laws of thermodynamics imply that temperature equalizes in a system that comes to thermodynamic equilibrium (begin proof)

[L3: Maximizing entropy](https://www.youtube.com/watch?v=EmM1jOV1uSY&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=3)
* 1st law of thermodynamics
* The two laws of thermodynamics imply that temperature equalizes in a system that comes to thermodynamic equilibrium (complete proof)
* Why a system's probability distribution seeks to occupy states that maximize its entropy
* Shown by creating $$N$$ identical replicas of the system, and pointing out that the $$N$$ systems would seek to maximize their total number of states
* Proof of the Stirling formula $$N! \approx N^N e^{-N}$$, by estimating $$\sum_{x=1}^N \ln x \approx \int_{x=1}^N \ln x$$, and noticing that $$\int \ln x = x \ln x - x$$
* The method of Lagrange multipliers, explained
  * The variables will the the probability values in the distribution
  * Two constraints: Probabilities add up to $$1$$. Average energy $$E = \sum p_i E_i$$ is given.
* Next class will solve the Lagrange multipliers for maximizing entropy with a given average energy constraint
* Temperature will be a Lagrange multiplier

[L4: The Boltzmann distribution](https://www.youtube.com/watch?v=rhFkYjaM5kE&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=4)
* Occupation number of an ensemble
* Lagrange multipliers
* Maximizing entropy under constraints
* Probability of $$i$$-th microstate: $$p_i = -\frac{1}{Z} e^{-\beta E_i}$$
* Partition function $$Z = \sum_i e^{-\beta E_i}$$
* Entropy comes before temprature
* Temperature is $$T = \frac{1}{\beta}$$. To get laboratory units, divide by $$k_B$$.
* Ideal Gas. Derivation of its partition function:

$$
\begin{align*}
Z = \frac{V^N}{N!} \left( \frac{2m\pi}{\beta} \right)^{\frac{3N}{2}}
\end{align*}
$$

* Energy of Ideal Gas
* Adding Gravity to Partition function

[L5: Pressure of an ideal gas and fluctuations](https://www.youtube.com/watch?v=2BJYXuZZK3c&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=5)
* Statistical mechanics is all in the calculus tricks
* For the ideal gas, we have calculated the average energy $$E = \frac{3}{2}k_B T$$. We know how fast they're moving.
* What is distribution of velocities near a wall?
  * Same as the interior velocity.
  * But how do you know? Not from the particle kinetic energy model, but from the principles of statistical mechanics.
* The foundations of statistical mechanics are mathematical, not intuitive. You throw away intuition. You plug in the formulas. All great physicists, Susskind says, were very good at it. They loved thermodynamics - why - it's fun, and full of surprises. Einstein was a grand master, so was Feynman, and so is Susskind... maybe!
* Calculate the pressure on the wall given all molecules have mass $$m$$ and velocity $$v$$: we get $$\frac{1}{2}mv^2 = \frac{3}{2}T$$
* We can compute the pressure on the wall, from the velocity, if we assume the particles are equally distributed, and the direction of particles is isotropic - which at this point we assume we don't know for sure. Force is rate of change of momentum, we can calculate that. Pressure is force per area, we can calculate that too.
  * You can do it yourself, and it will work if the molecules are independent
  * But we want to assume there are collisions between molecules. We want a model that does not depend on the super simplified model of an ideal gas.
* The rules of statistical mechanics are very general. You can calculate the expression of pressure in terms of other variables very generally.
* We would like to calculate the pressure $$p$$ as a function of temperature $$T$$, volume $$V$$, the number of molecules $$N$$.
* We need principles, and work out the pressure of an ideal gas, not using intuition, but using foundations.
* There are times when you want to suppress intuition, and work with the mathematics. Because you want the rules to be general.
* Will prove formula Susskind proved when he was young, and he's very proud of it.
* Express entropy $$E$$ using the partition function

$$
\begin{align*}
S &= -\sum_i p_i \ln p_i \\
  &= \frac{1}{Z}\sum_i e^{-\beta E_i} \left( \ln  e^{-\beta E_i} - \ln Z\right) \\
  &= \frac{1}{Z}\sum_i e^{-\beta E_i} \left( -\beta E_i - \ln Z\right) \\
  &= \beta E + \ln Z \\
  &= \frac{E}{T}  + \ln Z \\
A &= E - TS = -T \ln Z \text{ is the Helmholtz Free Energy}
\end{align*}
$$

* Helmholtz Free Energy $$A = -T \ln Z$$ appears everywhere, and therefore is a useful abstraction. It plays a leading role in computing pressure, and all sorts of other things.
* We'll introduce another variable to the problem. It is a control parameter - this is a parameter that is easy to change.
  * An example is the volume of a gas - in a cylinder, move the piston back and forth, to change the volume.
  * Another could be the magnetic field, or the electric field.
* Variables come in pairs.
  * One is called the parameter
  * The other, the conjugate thermodynamic parameter
  * Pressure and volume are closely related, and are called conjugate pairs.
    * You could move the piston and change the pressure - but you're changing it indirectly, by changing the volume.
* We're not even assuming the system is made of atoms. It's whatever it's made of.
  * We're not assuming it's a gas. Could be a liquid. Could be a solid.
  * That's why you need a general mechanism. You can't use the ideal gas law for everything.
  * If it's a boiling liquid, it is a mixture of liquid, attracted by gravity to the bottom, and gas, going to the top. You could still study it with the same statistical mechanics methods.
* Math lemma: if $$E, S$$ are two functions of independent variabls $$T, V$$, then

$$
\begin{align*}
\left( \frac{\partial E}{\partial V} \right)_S =
\left( \frac{\partial E}{\partial V} \right)_T -
\left( \frac{\partial E}{\partial S} \right)_V
\left( \frac{\partial S}{\partial V} \right)_T
\end{align*}
$$
* Later, $$E$$ will be energy,  and $$S$$ will be entropy.
* $$\left( \frac{\partial E}{\partial V} \right)_S$$ is a funny thing to do. Usually, we keep an independent variable fixed. Here, we keep the value of the other function $$S$$ fixed.
* He likes the proof so much because he figured it out himself :)

$$
\begin{align*}
\mathrm{d}E &= \left( \frac{\partial E}{\partial V} \right)_T \mathrm{d}V + \left( \frac{\partial E}{\partial T} \right)_V \mathrm{d}T \\

&= \left( \frac{\partial E}{\partial V} \right)_T \mathrm{d}V + \left( \frac{\partial E}{\partial S} \right)_V \left( \frac{\partial S}{\partial T} \right)_V \mathrm{d}T \\
\end{align*}
$$

* Take $$\left( \frac{\partial}{\partial V} \right)_S$$ on both sides:

$$
\begin{align*}
\left( \frac{\partial E}{\partial V} \right)_S&= \left( \frac{\partial E}{\partial V} \right)_T + \left( \frac{\partial E}{\partial S} \right)_V \left( \frac{\partial S}{\partial T} \right)_V \left( \frac{\partial T}{\partial V} \right)_S
\end{align*}
$$

* We also have

$$
\begin{align*}
\mathrm{d}S &= \left( \frac{\partial S}{\partial V} \right)_T \mathrm{d}V + \left( \frac{\partial S}{\partial T} \right)_V \mathrm{d}T \\
\end{align*}
$$

* Along constant $$S$$, $$\mathrm{d}S = 0$$. So 

$$
\begin{align*}
0 &= \left( \frac{\partial S}{\partial V} \right)_T + \left( \frac{\partial S}{\partial T} \right)_V \left( \frac{\partial T}{\partial V} \right)_S \\ 
\end{align*}
$$

$$
\begin{align*}
{\color{red}{\left( \frac{\partial T}{\partial V} \right)_S = - \frac{\left( \frac{\partial S}{\partial V} \right)_T}{\left( \frac{\partial S}{\partial T} \right)_V}}}
\end{align*}
$$


* Plugging back in the earlier formula:

$$
\begin{align*}
\left( \frac{\partial E}{\partial V} \right)_S&= \left( \frac{\partial E}{\partial V} \right)_T + \left( \frac{\partial E}{\partial S} \right)_V \left( \frac{\partial S}{\partial T} \right)_V 
{\color{red}{\left( \frac{\partial T}{\partial V} \right)_S }} \\

&= \left( \frac{\partial E}{\partial V} \right)_T - \left( \frac{\partial E}{\partial S} \right)_V \left( \frac{\partial S}{\partial T} \right)_V {\color{red}{\frac{\left( \frac{\partial S}{\partial V} \right)_T}{\left( \frac{\partial S}{\partial T} \right)_V}}} \\

&= \left( \frac{\partial E}{\partial V} \right)_T - \left( \frac{\partial E}{\partial S} \right)_V 
{\color{blue}{\left( \frac{\partial S}{\partial T} \right)_V}}
\frac{\left( \frac{\partial S}{\partial V} \right)_T}{\color{blue}{\left( \frac{\partial S}{\partial T} \right)_V}} \\

&= \left( \frac{\partial E}{\partial V} \right)_T - \left( \frac{\partial E}{\partial S} \right)_V {\color{blue}{\left( \frac{\partial S}{\partial V} \right)_T}}
\end{align*}
$$

* Pressure is just a special case of a response to a control parameter.
* What is pressure, really? With a cilinder and piston, if pressure moves the piston of area $$A$$ by an amount $$\mathrm{d} x$$, then the change in energy $$\mathrm{d}E = pA \mathrm{d} x$$.
  * We do this slowly. Odd things can happen if you do it fast. For example, if you do it too fast, no molecule may hit the piston as you're moving it.
  * You want to define pressure by averaging over many collision
  * So, move the piston slowly
  * You also want no energy to come in from the outside. Isolate the walls of the cylinder.
* What does adiabatic mean? Slowly, and no heat comes into the system
  * The change in energy is $$\mathrm{d}E = - pA \mathrm{dx} = - p \mathrm{d}V$$
  * This defines pressure
  * So $$\frac{\partial E}{\partial V} = -p$$, if you do the change adiabatically
* There is also another meaning to adiabatic.
  * The 2nd law of thermodynamic says that entropy increases, except when it doesn't. When it doesn't, it stays the same. It never decreases - Susskind says, never say never, but never mind (laughter)
  * What are the processes when it does not increase? Those are the adiabatic ones.
  * Explain it quantum mechanically. Only thing we use is that energy levels are discrete.
  * In quantum mechanics, a system has multiple energy levels. If a system is at energy level $$E$$, and you change the volume, the energy levels change. If vlume changes slowly, adiabatically (i.e., entropy does not change), then the energy level does not chage - even though the energy itself $$E$$ will change.
  * If you change the system rapidly, the energy can jump from one level to another
  * With an adiabatic change, if you started with a collection of probabilities $$p_i$$ for each energy level, the probabilities stay the same. And the entropy is built from the $$p_i$$, so entropy stays the same.
  * Adiabatic processes don't change the entropy. That is the general definition of adiabatic.
  * But if you put heat in the system, it corrupts the system, and entropy changes.
* Now we know how to change the definition of pressure: $$p = -\left( \frac{\partial E}{\partial V} \right)_S$$.
  * That's why we proved the lemma above
* The easy thing to calculate is how things vary with temperature. Always easier to work as a function of temperature, than a function of everything else.
* Remember also that, holding the volume fixed, the derivative of energy wrt entropy is the temperature: $$\left( \frac{\partial E}{\partial S} \right)_V = T$$
* Proof that the pressure $$p$$ is the negative derivative of the Helmholtz Free Energy with respect to $$V$$ at fixed $$T$$:

$$
\begin{align*}
-\left( \frac{\partial E}{\partial V} \right)_S &= p = 
- \left( \frac{\partial E}{\partial V} \right)_T +
\left( \frac{\partial E}{\partial S} \right)_V
\left( \frac{\partial S}{\partial V} \right)_T \\

&= - \left( \frac{\partial E}{\partial V} \right)_T +
T
\left( \frac{\partial S}{\partial V} \right)_T \\

&= - \left( \frac{\partial (E-TS)}{\partial V} \right)_T \\
&= - \left( \frac{\partial A}{\partial V}\right)_T = T \left( \frac{\partial \ln Z}{\partial V}\right)_T
\end{align*}
$$

* Everything above is completely general. Does not matter if it's a liquid, a plasma, a solid. Does not matter what the chemical composition is. This is statistical mechanics. Does not matter what the kinetic energy of particle is.
* You can carry this for any control parameter. Susskind used volume because it's familiar.
  * For any control parameter, there's a derivative of energy $$E$$ with respect to it, at fixed entropy $$S$$.
  * That is called the conjugate thermodynamic variable.
  * This conjugate thermodynamic variable is like pressure. It serves the role of pressure.
* Ideal gas: Express $$\ln Z$$ using the partition function formula, take derivative with respect to $$V$$ at fixed $$T$$
* Get $$PV=NT$$

[L6: Weakly interacting gases, heat, and work](https://www.youtube.com/watch?v=bW30Rj6w8VI&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=6)
* Will talk about 2nd law of thermodynamics
* Speed of sound in ideal gas with molecules of mass $$m$$
  * It is the speed of molecules
  * Energy is $$E = \frac{3}{2} k_B T = \frac{1}{2} m v^2$$
  * So speed of molecules is $$v^2 = \frac{3 k_B T}{m}$$
* There is a more exact formula, not proved in this class, but the speed of sound squared $$c^2 = \frac{\partial p}{\partial (\text{mass density})} = \frac{\partial p}{m \partial \rho}$$, where $$\rho$$ is the density
* The ideal gas formula is $$pV=Nk_B T$$, or $$p  = \rho k_B T$$
  * This gives $$p$$ as function of $$\rho$$
  * So $$\frac{\partial p}{m \partial \rho} = k_B T$$
  * So square speed of sound is $$c^2 = \frac{k_B T}{m}$$
  * This gives a more accurate approximation of the speed of sound
  * However, even the earlier formula $$v^2 = \frac{3 k_B T}{m}$$ was of the same order of magnitude
* This works at low pressure, with an ideal gas.
  * If pressure is higher, $$p$$ is not a linear function of $$\rho$$ (it could be linear on $$\rho^2$$)
* Next, we're computing the partition function of an harmonic oscillator of mass $$m$$ and spring constant $$k$$, in the ideal gas, in a heat bath at temperature $$T$$
* When we talk of harmonic oscilator, it could be a mass attached to a spring, or electromagnetic waves, or a crystal - there's an extremely large class of systems that are harmonic oscillators

The statistical mechanics of a harmonic oscillator:
* Hamiltonian energy is $$H = \frac{mp^2}{2} + \frac{kx^2}{2}$$
* Partition function is

$$
\begin{align*}
Z &= \int_{p,x} \mathrm{d}p\, \mathrm{d}x \, e^{-\beta \frac{mp^2}{2}} e^{-\beta \frac{mx^2}{2}} \\
&= \int_{p} \mathrm{d}p\,  e^{-\beta \frac{mp^2}{2}} \int_{x} \mathrm{d}x \,e^{-\beta \frac{mx^2}{2}}
\end{align*}
$$

* Change variables $$\beta \frac{mp^2}{2} = x^2$$, keep in mind that $$\int_{x} \mathrm{d}x \,e^{\frac{-x^2}{2}} = \sqrt{\pi}$$
* We get $$Z = \sqrt{\frac{2m\pi}{\beta}} \sqrt{\frac{2\pi}{k\beta}} = 2\pi\sqrt{\frac{m}{k}} \frac{1}{\beta}$$
* But $$ \sqrt{\frac{k}{m}} = \omega$$ where $$\omega$$ is the frequency of the oscillator
* So $$Z = \frac{2\pi}{\omega} \frac{1}{\beta}$$
* Only useful thing is $$\ln E$$ as a function of $$\beta$$. The formula is $$\ln Z = \text{const} - \ln \beta$$
* Energy of oscillator is $$E = - \frac{\partial \ln Z}{\partial \beta} = \frac{1}{\beta} = T$$
* Not so different than the energy of the ideal gas $$E = \frac{3}{2}\frac{1}{\beta} = \frac{3}{2} T$$ (times $$k_B$$ for lab units, but we're using energy units for temperature)
* Why no factor of $$3$$? Because the oscillator goes in a single dimesion. Why no factor of $$\frac{1}{2}$$? Because the elastic oscillator doubles the energy of the ideal gas.
* The energy does not depend on the mass of the particle $$m$$. This is same for ideal gas - where energy did not depend on $$m$$ - if the mass $$m$$ was higher, the speed of the particle was lower, so energy's expected value was fixed.
* Notice that the energy also does not depend on the spring constant $$k$$
  * If $$k$$ is very large, and the oscillator is rigid, the energy does not change. But the rigid oscillator should add zero energy!
  * So there is a mistake somewhere. This puzzled physicists at the end of 19th Century. The ideal gas law, and the kinetic energy formula seemed to work pretty well, when the particle was treated as a point particle
    * Suppose the particle is a di-atomic molecule. It is an elastic oscillator, pretty rigid - but still an oscillator. But the formula does not seem to care.
  * This is a correct classical mechanics result
  * Mistake is - we're not accounting for quantum mechanics!
Corresponding quantum mechanical calculation of harmonic oscillator in equilibrium
* We need the expression of the energy of a quantum harmonic oscillator
  * Energy is quantized. It comes in discrete multiples of Planck's constant times the frequency $$\hbar \omega$$
  * Energy of oscillator is $$n \hbar \omega$$
* We can calculate the partition function for the quantum mechanical oscillator

$$
\begin{align*}
Z &= \sum_n e^{-\beta (\text{energy of n-th state})} \\
&= \sum_n e^{-\beta n \hbar \omega} = \frac{1}{1 - e^{-\beta \hbar \omega}}
\end{align*}
$$

* We keep $$\hbar$$, but throw away $$k_B$$. Susskind refuses to keep track of both of them.

$$
\begin{align*}
E &= - \frac{\partial \ln Z}{\partial \beta} = - \frac{1}{Z} \frac{\partial Z}{\partial \beta} \\

&=  \left(1 - e^{-\beta \hbar \omega}\right) \frac{\hbar \omega e^{-\beta \hbar \omega}}{(1 - e^{-\beta \hbar \omega })^2} \\

&= \frac{\hbar \omega e^{-\beta \hbar \omega}}{1 - e^{-\beta \hbar \omega }}
\end{align*}
$$

* Consider high temperature
  * For high temperature, classic theory is good.
    * Each quanta of energy are very small.
    * The classical system, in quantum units, has a lot of energy.
    * Quantum systems become classical when the temperature is very high. The quantization of energy becomes unimportant.
* At high energy:

$$
\begin{align*}
E &=  \frac{\hbar \omega e^{-\beta \hbar \omega}}{1 - e^{-\beta \hbar \omega }} \\
&\approx \frac{\hbar \omega}{1 - e^{-\beta \hbar \omega }} \\
&= \frac{\hbar \omega}{1 -(1 - \beta \hbar \omega + \frac{(\beta \hbar \omega)^2}{2!} - ...)} \\
&\approx \frac{\hbar \omega}{1 -(1 - \beta \hbar \omega)} = \frac{1}{\beta}
\end{align*}
$$

* This matches classical mechanics energy
* At low temperatures - which means large $$\beta$$ - we have $$E \approx \hbar \omega e^{-\beta \hbar \omega}$$. This is exponentially small.
* Quantum mechanics tends to have exponentially small energy, at low temperature
* Where is the crossover, from quantum to classical? Where the exponential $$e^{-\beta \hbar \omega}$$ goes from being small to being close to $$1$$.
  * When $$\beta \hbar \omega \gt 1$$, quantum behavior (why did Susskind compare the exponent to 1, and not the exponential?)
  * When $$\beta \hbar \omega \lt 1$$, classical behavior.
  * Crossover point: $$\hbar \omega = T$$. This is where the energy classically is equal to one quant of quantum energy. The classical energy does not want to be less than a quanta of energy. (This is a better explanation to the earlier bullet point)
* This explains the puzzle about the diatomic molecule.
  * When $$\hbar \omega \gt T$$, in quantum regime - the oscillator has exponentially lower energy than what it would be classically
  * When $$\hbar \omega \lt T$$, in classical regime - the oscillator begins to be activated
* At low temperature, the diatomic molecule behaves like a mono particle. You do not start the oscillations.
* At some temperature, the diatomic molecule starts to behave like a diatomic molecule.
* The stiffness of the molecule determines $$\omega$$. The stiffer the molecule, the larger the frequency.
* Molecules are pretty stiff. The temperature at which a mono-molecule starts behaving like a diatomic molecule is pretty high.
* If you heat it even more, the atoms themselves begin to vibrate. They eventually become ionized. Then it does not become an atom at all - but as an electron and a proton (in the case of hydrogen)
* This is an example of quantum mechanics solving a problem that physicists had been deeply confused about.
* Solids are molecules in a lattice. Each atom is an oscillator. The energy of the oscillation determines the specific heat of the crystal. This heat capacity was estimated by classical physics to be much much larger than observed. It was Einstein who figured out that the quantum nature of the oscillators suppressed the oscillators until the temperature got high enough. This is one of Einstein's small minor contributions. This was long before quantum mechanics was understood. He just knew that the quantum energy levels were proportional to $$n$$.
* Compare classical and quantum partition functions
  * The quantum partition function $$Z = \frac{1}{1 - e^{-\beta \hbar \omega}}$$, at high temperature, is $$Z \approx \frac{1}{\beta \hbar \omega} = \frac{1}{\hbar} \frac{1}{\beta \omega}$$. The inverse Planck constant $$\hbar$$ is always present in front of partition functions, so we can keep it separate.
  * The classical partition function was $$Z = 2\pi \frac{1}{\beta \omega}$$. The $$2\pi$$ is a constant.
  * In the quantum case, we get the constant $$\frac{1}{\hbar}$$, which will not matter, once we differentiate the partition function $$Z$$
* This is an example of the derivation of classical mechanics from quantum mechanics. This is really the right way to go.
* But this formula was known long before quantum mechanics. They were doing something right. They intuited that phase space is the right way to think about classical physics.
* The higher the spring constant $$k$$, the more rigid the harmonic oscillator, the more quantum mechanical the partition function behaves, and the smaller the oscillator part of the energy.
* If you heat a system, you discover it has more and more degrees of freedom.
  * Assume a molecule x-y, seen as an oscillator, where the spring is stiff, and where y consists of two atoms y1-y2, where the spring is a lot stiffer.
  * At low temperature, it all behaves like a point.
  * You heat it up to a temperature that activates the x-y oscillations, but not enough to activate y1-y2, then it behaves like a diatomic molecule.
  * You heat it more, it starts behaving like a molecule with three atoms
  * As you heat things, you get more degrees of freedom, and you start discovering the complexity of things.
  * You don't discover the complexity at low temperature - you discover the quamtum behavior of things.
  * As you raise the temperature, they unfreeze themselves from the quantum behavior, and start to behave classically.
  * This has to do with black body radiation. We'll come to that.
* Relate it to violin string. Mathematically, the violin string consists a larne number of oscillators.
  * Lowest harmonic oscillation
  * Second harmonic (half wavelength)
  * Third harmonic (one third wavelength)
  * The string consists of an infinite number of oscillators, with shorter and shorter wavelength.
  * If each oscillator would have an amount of energy equal to the temperature $$E=T$$, that string would have an infinite amount of energy, when it came to thermal equilibrium.
  * But most oscillations have high frequency. Most oscillations, at a given temperature, are frozen out by quantum mechanics.
  * As the temperature goes up, more oscillations begin to have energy.
  * The partition function would be the product for each oscillators, the logarithm would be the sum, and the energy would be the sum.
* Start talking about the second law.
* The second law is a puzzle, because it says that the world is irreversible, and the entropy is increasing, or stays the same. You'd have to be infinitely careful with a large system to keep entropy the same.
* On the other hand, Newton's laws of motion are reversible. There's a tension between reversibility of laws of motion, and irreversibility of the observational properties of complicated systems. That took some time to sort out, and people are still confused about it.
* Imagine a phase space, with many particles. It is a high dimensional space, with coordinates $$x$$ and $$p$$ for each particle.
* Start with a probability distribution that is constant in a blob of volume $$A$$. Then the entropy is $$\ln A$$.
  * As the volume gets smaller, the entropy goes down
* As time goes on, the volume stays the same (Liouville theorem). And entropy stays the same.
* There's another concept of entropy that will increase. It has to do with coarse graining.
  * When you do experiments, you can't tell precisely the location in phase space. You could not tell precisely if two states in state space were too close.
  * There's some resolution of space that you can't get smaller than.
  * In quantum mechanics, that resolution is built in. The smallest uncertainty is given by Planck's constant.
  * Instead of points in phase space, you talk about resolved, or coarse grained points in phase space.
* Suppose you start with a blob $$A$$ in phase space. Suppose that we have a dynamics that takes the blob and turns it into a long snake, extremely thin, and of the same total volume.
* Because of our limited resolution powers, we can't tell one phase space point from another. So we take the points on the snake, and we blobify them.
* If we were to ask what is the volume of the blob, we'll come to the conclusion it's uniformly distributed over the larger volume, because we have limited precision.
* The volume then increases.
* For example, what is the volume of a cotton blob? At a coarse grained resolution, it is higher than the volume than the actual piece of fiber.
* Entropy is not really a property of the system. It's a property of the system, and what you know about the system.
* If you could follow in infinite detail the system, then entropy would be conserved. But if you take into account that you don't know exactly where points are, because of the limits of resolution, then entropy increases.
* The right name for how systems evolve is - chaos. The blob starts evolving chaos boundaries. No matter how good the resolution is, the entropy increases. That's what the 2nd law says.
* Think of a gas, with a large number of particles in a box. Then, the phase space is bounded. The momentum can't be anything - the energy bounds it.
  * Now, the phase point starts somewhere. The system evolves for a time, the point evolves along a path.
  * If you start near it, the point evolves initially along a similar path, then it diverges from the other path.
  * If you wait long enough, you'll pass very close to every point in the phase space.
  * Gets to the point where you can't tell anything anymore. Entropy is very large.
  * But, eventually, the point will get back to where it started.
  * How long do you have to wait? It depends on the precision tolerance you are willing to accept.
  * On one hand, entropy increases. On the other hand, you will eventually return to the original state.
  * You don't lose information. Anything that can happen, the reverse can happen.
  * We'll talk about it more - how this paradox of reversibility can be resolved.
* This drove Boltzmann to distraction. Maybe did not cause his suicide, but it depressed him. But he eventually came with the right answer. Which is not that the system is irreversible, but that it is more likely to go to a state with higher entropy. Entropy probably increases. The probability of a configuration aiming itself to go to an unusual configuration is small.
* Chaotic systems - an example is the weather. A counterexample is the harmonic oscillator, which has a periodic movement.
* The three body problem is chaotic in general, for example. The ordinary pendulum is not chaotic. A double pendulum is chaotic.
* Hard question - why some systems are chaotics, and other are not. It's very hard to look at a a Hamiltonian, and say if the system is chaotic. Except when the Hamiltonian is complicated - then, usually it is chaotic.
* The Lyapunov coefficient telling you exponentially how far trajectories diverge.
  

[L7: Entropy versus reversibility](https://www.youtube.com/watch?v=sg15UClUY48&list=PLpGHT1n4-mAsJ123W3fjPzvlDHOvIhHA0&index=7)

[L8: Entropy, reversibility, and magnetism](https://www.youtube.com/watch?v=3hh0lJZbUfo)

[L9: Ising Model](https://www.youtube.com/watch?v=AT4_S9vQJgc)
* 1-dimensional Ising Model
* Duality
* 2-dimensional Ising Model
* Mean field approximation
* Adding an external magnetic field
* Spontaneous symmetry breaking

[L10: Liquid-gas phase transition](https://www.youtube.com/watch?v=IWtcFAP3ju4)

#### Other
* [Physics](../physics.md)
