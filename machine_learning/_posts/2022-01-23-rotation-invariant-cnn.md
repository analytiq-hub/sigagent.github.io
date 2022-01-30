---
layout: post
title: Rotation Invariant CNN
author:
- Andrei Radulescu-Banu
---
This Stack Overflow post explores a question I had reading about Convolutional Neural Networks: [Why rotation-invariant neural networks are not used in winners of the popular competitions?](https://stackoverflow.com/questions/41069903/why-rotation-invariant-neural-networks-are-not-used-in-winners-of-the-popular-co)

The answer is - networks are optimized for performance, not for theoretical 'cleanliness'. In theory, it's cleaner to implement G-invariance in the CNN. In practice, it is equivalent, and simpler, to augment the data by G-transformations, for a group G.

One of the references therein, [Group Equivariant Convolutional Networks](http://proceedings.mlr.press/v48/cohenc16.pdf), by T.S. Cohen and M.Welling, explains how to add two new layer types, to implelemnt G-invariance directly in the CNN.

Also see these talks:

#### Geometric Deep Learning
* Michael Bronstein: [Geometric Deep Learning: the Erlangen Programme of ML](https://iclr.cc/virtual/2021/invited-talk/3717) (2021)
  * [Geometric Deep Learning: Grids, Groups, Graphs,Geodesics, and Gauges](https://arxiv.org/pdf/2104.13478.pdf), M. Bronstein et al (2021)
  * ML Street Talk #60: [Geometric Deep Learning Blueprint](https://www.youtube.com/watch?v=bIZB1hIJ4u8) (2021)
* Max Welling
  * ML Street Talk #36: [Max Welling: Quantum, Manifolds & Symmetries in ML](https://www.youtube.com/watch?v=mmDw5glry9w) (2021)
  * IAS Seminar on Theoretical ML: [Graph Nets: The Next Generation](https://www.youtube.com/watch?v=Wx8J-Kw3fTA) (2020)
    * In practice, graph neural nets have at most 5-6 layers. Deeper than that, they saturate. So unlike ResNets, which can have hundreds, or even thousands of layersm graph neural nets are shallow.
    * The subgraphs for the kernel library consist of the entire set of subgraphs.
    * You can do maxpooling between layers of graphs, to shrink the higher layers.
    * Equivariant graphs are data efficient. In some sense, data efficiency is equivalent to accuracy.
    * Spherical gauge symmetric models can be used to detect storms on earth.