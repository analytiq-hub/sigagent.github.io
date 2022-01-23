---
layout: post
title: Rotation Invariant CNN
author:
- Andrei Radulescu-Banu
---
This Stack Overflow post explores a question I had reading about Convolutional Neural Networks: [Why rotation-invariant neural networks are not used in winners of the popular competitions?](https://stackoverflow.com/questions/41069903/why-rotation-invariant-neural-networks-are-not-used-in-winners-of-the-popular-co)

The answer is - networks are optimized for performance, not for theoretical 'cleanliness'. In theory, it's cleaner to implement G-invariance in the CNN. In practice, it is equivalent, and simpler, to augment the data by G-transformations, for a group G.

One of the references therein, [Group Equivariant Convolutional Networks](http://proceedings.mlr.press/v48/cohenc16.pdf), by T.S. Cohen and M.Welling, explains how to add two new layer types, to implelemnt G-invariance directly in the CNN.