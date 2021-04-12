---
layout: post
title: "How to port Python2 code to Python3"
categories: python
author:
- Andrei Radulescu-Banu
---

Python2 has been [obsoleted on Jan 1, 2020](https://www.python.org/doc/sunset-python-2/). The Python community has stopped distributing bugfixes for it. The pip program for installing packages for python2 [has stopped working in January 2021](https://pip.pypa.io/en/stable/news/#id4).

Large code projects that were implemented on top of python2 need to be ported to python3. But how can that be done?

Recently, I worked to port [Apollo ROS](https://github.com/ApolloAuto/apollo-platform/tree/1.5.5), a self driving middleware stack, from Python2 to Python3. This post shows the steps.