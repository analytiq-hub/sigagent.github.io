---
layout: page
mathjax: true
title: Geoff Hulten - Machine Learning Course
---
Notes on a [great course](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=9) by Geoff Hulten on Machine Learning.
* Course [web page](https://www.livingmachinelearning.com/course.html)
* Textbooks
  * Tom M. Mitchell: [Machine Learning](https://www.amazon.com/gp/product/0071154671/)
  * Geoff Hulten: [Building Intelligent Systems](https://www.amazon.com/gp/product/1484234316)

* 1: [Overview of Machine Learning](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=1)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/01%20--%20Overview%20of%20Machine%20Learning.pptx)
  * D. Sculley et al: [Machine Learning: The High-Interest Credit Card of Technical Debt](https://storage.googleapis.com/pub-tools-public-publication-data/pdf/43146.pdf) (2014)
  * Supervised learning $$Y=f(X)$$:
    * Discrete $$Y$$: Classification
    * Continuous $$Y$$: Regression
    * Probability Estimation: $$P(Y \vert X)$$
  * Unsupervised, semi-supervised learning
  * Reinforcement learning
  * ML algorithm components
    * Model structure
      * Linear
      * Decision trees
      * Ensembles of models
      * Instance based methods
      * Neural nets
      * Support vector machines
      * Graphical models (Bayes/Markov nets)
      * Etc
    * Loss function
      * Accuracy
      * Precision & Recall
      * Cost / Utility
      * Squared error
      * Likelihood
      * Posterior probability
      * Margin
      * L1 & L2 normalization
      * Entropy
      * KL divergence
      * Etc
    * Optimization - how the learning algo finds the best model
      * Greedy search
      * Gradient descent
      * Linear programming
      * Regularization
      * Look ahead, momentum, stochastic methods / batching, learning rates, termination conditions, etc

* [Top 5 Career Paths for Data Professionals](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=2)
* 2: [Basics of Evaluating Models](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=3)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/02%20--%20Basics%20of%20Evaluating%20Models.pptx)
  * Training set, validation set, test set
  * Overfit, underfit
  * Confusion matrix
<p align="center">
<img src="/machine_learning/diagrams/confusion_diagram.drawio.png" width="500" height="250"/>
</p>

* 3: [Logistic Regression](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=4)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/03%20--%20Logistic%20Regression.pptx)
  * Linear model for classification and probability estimation
  * Can be effective when:
    * The problem is linearly separable
    * Or there are a lot of relevant features (10s-100s)
    * Need efficient runtime or need a baseline
  * Not the most accurate option, but used a lot in practice
  * Model: linear with sigmoid activation $$\hat{y} = sigmoid(w_0 + \sum_{i=1}^n w_i * x_i)$$ where $$sigmoid(x) = \frac{1}{1+e^x}$$
  * Loss function: log loss $$Loss(\hat{y},y) = -y \, log(\hat{y}) - (1-y) \, log(1 - \hat{y})$$
  * Optimization: gradient descent
  * Parameters
    * Step size used in gradient descent
    * Convergence - minimum loss increase required to continue gradient descent
    * Threshold - value between 0-1 to convert $$\hat{y}$$ into a classification
* 4: [Intro to Feature Engineering with Text](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=5)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/04%20--%20Feature%20Engineering%20(Text).pptx)
  * Binary Features
    * Contains word?
    * Is SMS longer than X?
    * Contains (*#)?
  * Categorical Features
    * First word is {noun, verb, other...}
    * Message length is {short, medium, long, very long}
    * Token type is {Number, URL, Word, Phone #, Unknown}
    * Grammar Analysis is {Fragment, Simple Sentence, Complex Sentence}
  * Numerical Features
    * CountOf Word(call)
    * MessageLength
    * FirstNumberInMessage
    * WritingGradeLevel
  * Feature Engineering for words
    * Tokenize
    * Bag of words
    * N-grams
    * TF-IDF (term frequency - inverse document frequency)
    * Embeddings - Word2Vec and FastText
    * NLP
  * Normalization of numeric features
  * Feature engineering in other domains
    * Computer vision
      * Gradients
      * Histograms
      * Convolutions
    * Internet
      * IP Parts
      * Domains
      * Relationships
      * Reputation
    * Time series
      * Window aggregation
      * Frequency domain transformation
* 5: [Intro to Feature Selection](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=6)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/05%20--%20Feature%20Selection.pptx)
  * Frequency
    * Take N most common features in the training set
  * Mutual information
    * Take N features that contain most information about the value of Y on the training set
    * Mutual information: $$MI(X,Y)=\sum_{x \in X, y \in Y}p(x,y) ln (\frac{p(x,y)}{p(x)p(y)})$$
  * Accuracy
    * Greedy search, add and remove features, evaluate on validation data
* 6: [ROC Curves and Operating Points](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=7)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/06%20--%20ROC%20Curves%20and%20Operating%20Points.pptx)
  * Logistic regression produces score between 0-1.
    * Use threshold for classification
    * Vary threshold to get best result
    * Build Receiver Operating Characteristic (ROC) curve to plot False Negative Rate by False Positive Rate by threshold

<p align="center">
<img src="/machine_learning/diagrams/ROC.drawio.png" width="250" height="250"/>
</p>

  * AUC is area under curve, used for comparing performance between models. Operating point is point on ROC curve closest to origin. PR curve is same but for precision/recall. Update threshold to avoid drift. Threshold can be updated w/o having to update model.    
* 7: [Bounds and Comparing Models](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=8)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/07%20--%20Bounds%20and%20Comparing%20Models.pptx)
* 8: [Naive Bayes](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=9)
  * [slides](https://www.livingmachinelearning.com/courses/machinelearning/slides/08%20--%20Naive%20Bayes.pptx)
  * Discriminative vs Generative modes
    * Discriminative: model the posterior probability $$P(y \vert x)$$ directly
      * Use logistic regression, decision trees, neural nets
    * Generative: model the joint probability $$P(x, y)$$
      * Use naive Bayes, Bayesian networks, hidden Markov models
      * On generative models: Andrew Y. Ng, Michael I. Jordan: [On Discriminative vs Generative classifiers: A comparison of logistic regression and naive Bayes](https://ai.stanford.edu/~ang/papers/nips01-discriminativegenerative.pdf)
  * Bayes Theorem: $$P(A \vert B) = \frac{P(B \vert A) P(A)}{P(B)}$$
  * Bayes model: $$y = \underset{y_j \in Y}{argmax} \frac{P(\lt x \gt \vert y_j) P(y_j)}{P(\lt x \gt)}$$
    * Same as $$y = \underset{y_j \in Y}{argmax} P(\lt x \gt \vert y_j) P(y_j)$$
    * Simplifying assumption: the features $$x_i$$ of $$\lt x \gt$$ are independent (where the name 'naive' comes from)
    * Naive Bayes model: $$y = \underset{y_j \in Y}{argmax} P(y_j) \underset{i}{\prod} P(x_i \vert y_j)$$
    * Of theoretical importance, almost never used in practice
    * For small number of features $$x_i$$ and classes $$y_j$$, build incidence table of how many times $$<x> \rightarrow y$$, and compute $$y$$ using naive Bayes
* 9: [Implementing with Machine Learning](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=10)
* 10: [Decision Trees](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=11)
* 11: [Defining Success with Machine Learning](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=12)
* 12: [Overfitting and Underfitting](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=13)
* 13: [Intelligent User Experiences](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=14)
* 14: [Ensembles 1: Bagging & Random Forests](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=15)
* 15: [Ensembles 2: Boosting](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=16)
* 16: [Ensembles 3: Stacking & Intelligence Architectures](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=17)
* 17: [ML Design Pattern: Adversarial Learning](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=18)
* 18: [Basics of Computer Vision](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=19)
* 19: [Neural Networks](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=20)
* 20: [Neural Network Architectures](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=21)
* 21: [ML Design Pattern - Corpus Centric](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=22)
* 22: [Reinforcement Learning](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=23)
* 23: [ML Design Pattern - Ranking](https://www.youtube.com/watch?v=XJZXBAh9LBM&list=PLrQmbzbRJ5mwDinvDEJ5B-KDZlPM-sCYO&index=24)

#### Other
* [Artificial Intelligence](artificial_intelligence.md)
* [Cloud Data Platform](cloud_data_platform.md)
* [Cognitive Science](cognitive_science.md)
* [Computation Theory](computation_theory.md)
* [GPUs](gpus.md)
* [Machine Learning](machine_learning.md)
* [Meta Learning](meta_learning.md)
* [MLOps](mlops.md)
* [Natural Language Processing](natural_language_processing.md)
* [Probabilities and Statistics](probabilities_and_statistics.md)
* [Robotics](robotics.md)
* [Self Driving Cars](self_driving_cars.md)
* [Computational Topology](computational_topology.md)
