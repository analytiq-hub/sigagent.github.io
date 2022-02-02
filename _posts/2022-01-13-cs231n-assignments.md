---
layout: post
title: "CS231n assignments"
categories: python deep_learning
author:
- Andrei Radulescu-Banu
---

## Course links
* [CS231n](http://cs231n.stanford.edu/): Convolutional Neural Networks for Visual Recognition (Spring 2017), [syllabus](https://cs231n.github.io/), [2016 video](https://www.youtube.com/watch?v=NfnWJUyUJYU&list=PLkt2uSq6rBVctENoVBg1TpCC7OQi31AlC), [2017 videos](https://www.youtube.com/playlist?list=PL3FW7Lu3i5JvHM8ljYj-zLfQRF3EO8sYv), [2017 slides](http://cs231n.stanford.edu/slides/2017), [2021 slides](http://cs231n.stanford.edu/slides/2021)
* [2019 Syllabus and Assignments](http://cs229.stanford.edu/syllabus-summer2019.html)
* Github: [cs231n/cs231n.github.io](https://github.com/cs231n/cs231n.github.io)
  * Andrei's fork with solutions: [Bitdribble/cs231n](https://github.com/Bitdribble/cs231n)

## Andrei's assignments
Github: [bitdribble/cs231n](https://github.com/Bitdribble/cs231n)
* [Assignment 1](https://cs231n.github.io/assignments2021/assignment1): assignments/2021/assignment1
  * [knn.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/knn.ipynb)
  * [svm.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/svm.ipynb)
  * [softmax.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignment1/softmax.ipynb)
  * [fc_net.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/cs231n/classifiers/fc_net.py): implementation of fully connected net
  * [k_nearest_neighbor.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/cs231n/classifiers/k_nearest_neighbor.py)
  * [linear_classifier.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/cs231n/classifiers/linear_classifier.py)
  * [softmax.py](https://github.com/Bitdribble/cs231n/blob/master/assignment1/cs231n/classifiers/softmax.py)
  * [layers.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/cs231n/layers.py) implementations for:
    * `affine_forward()`, `affine_backward()`
    * `relu_forward()`, `relu_backward()`
    * `softmax_loss()`
  * [layer_utils.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/cs231n/layer_utils.py) implementations for:
    * `affine_relu_forward()`, `affine_relu_backward()`
  * [features.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment1/features.ipynb)
* [Assignment 2](https://cs231n.github.io/assignments2021/assignment2): assignments/2021/assignment2
  * [FullyConnectedNets.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/FullyConnectedNets.ipynb)
  * [BatchNormalization.ipynb](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/BatchNormalization.ipynb)
  * [optim.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/cs231n/optim.py): RMSProp, Adam optimizers
  * [layers.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/cs231n/layers.py) implementations for:
    * `affine_forward()`, `affine_backward()`
    * `relu_forward()`, `relu_backward()`
    * `batchnorm_forward()`, `batchnorm_backward()`. The backward pass is a good example of gradient descent in the compute graph.
    * `layernorm_forward()`, `layernorm_backward()`
    * `softmax_loss()`
  * [layer_utils.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/cs231n/layer_utils.py) implementations for:
    * `affine_relu_forward()`, `affine_relu_backward()`
    * `affine_bn_relu_forward()`, `affine_bn_relu_backward()`
    * `affine_ln_relu_forward()`, `affine_ln_relu_backward()`
    * `dropout_forward()`, `dropout_backward()`
  * [fc_net.py](https://github.com/Bitdribble/cs231n/blob/master/assignments/2021/assignment2/cs231n/classifiers/fc_net.py): implementation of fully connected net, with support for:
    * batch normalization
    * layer normalization
    * dropout
* [Assignment 3](https://cs231n.github.io/assignments2021/assignment3): assignments/2021/assignment2

## Other forks with solutions:
* [jingxinfu/cs231n](https://github.com/jingxinfu/cs231n)
* [haofeixu/cs231n](https://github.com/haofeixu/cs231n)
* https://www.codeleading.com/article/83371501641/

## Resources
* Batch Normalization, gradient descent backward pass:
  * [Flair of Machine Learning](https://kratzert.github.io/) blog: [Understanding the backward pass through Batch Normalization Layer](https://kratzert.github.io/2016/02/12/understanding-the-gradient-flow-through-the-batch-normalization-layer.html), Frederik Kratzert (2016)
  * Kevin Zakka's blog: [Deriving the Gradient for the Backward Pass of Batch Normalization](https://kevinzakka.github.io/2016/09/14/batch_normalization/) (2016)