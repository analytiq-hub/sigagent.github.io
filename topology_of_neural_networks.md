---
layout: page
mathjax: true
title: Computational Topology
---
#### Articles
* [Neural Networks, Manifolds, and Topology](https://colah.github.io/posts/2014-03-NN-Manifolds-Topology/), C. Olah (2014), blog post explaining graphically how Neural Net layers separate inputs
* [Universal Function Approximation by Deep Neural Networks with Bounded Width and RELU Activations](https://arxiv.org/pdf/1708.02691.pdf), B. Hanin (2017), explains how piecewise linear (PL) maps can be reconstructed with NNs using ReLU functios, and provides upper bounds for the minimum number of layers needed, within a given NN hidden layer width. Earlier work by Cybenko and Hornik-Stinchcombe-Whit showed that PL maps can be reconstructed with NNs with a single hidden layer if the width of the NN is allowed to be arbitrarily large.
* [Topological Deep Learning: Classification Neural Networks](https://arxiv.org/pdf/2102.08354.pdf), M. Hajij, K. Istvan (2020) - very basic explanation of how NNs are approvximator functions, with good bibliography

#### Brain Networks
* [Reviews: Topological Distances and Losses for Brain Networks](https://arxiv.org/pdf/2102.08623.pdf), M. K. Chang, A. Smith, G. Siu (2021). This is a survey of shape approximating functions used in brain imaging - showing how persistent homology and Morse theory can be used to compute topological features of point cloud
  * Since this brings up Morse Theory, here are John Milnor's very nice lecture notes from 1963: [Morse Theory](https://www.maths.ed.ac.uk/~v1ranick/papers/milnmors.pdf) (last accessed Feb 2020)

#### Posts
* Wikipedia: [Persistent homology](https://en.wikipedia.org/wiki/Persistent_homology). Gives definition of persistent homology on filtered simplicial complexes $$\emptyset = K_0 \subseteq K_1 \subseteq ... \subseteq K_n = X$$ as images of the simplicial homology maps $$H_p(K_i) \rightarrow H_p(K_j)$$, and gives a list of software packages that compute persistent homology.

#### Other
* [Artificial Intelligence](artificial_intelligence.md)
* [Cognitive Science](cognitive_science.md)
* [Computation Theory](computation_theory.md)
* [Machine Learning](machine_learning.md)
* [Probabilities and Statistics](probabilities_and_statistics.md)
* [Robotics](robotics.md)
* [Self Driving Cars](self_driving_cars.md)
