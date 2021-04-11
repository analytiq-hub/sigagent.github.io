---
layout: post
title: "How to port Python2 code to Python3"
categories: python
author:
- Andrei Radulescu-Banu
---

Python2 has been obsoleted on Jan 1, 2021. The pip program for installing packages for python2 is not maintained anymore.

Large code projects that were implemented on top of python2 need to be ported to python3. But how can that be done?

Recently, I worked to port Apollo ROS, a self driving middleware stack, from Python2 to Python3. This post documents the steps.