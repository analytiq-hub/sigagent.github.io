---
layout: post
title: "Setting up Docker for development"
categories: python, deep_learning, machine_learning, docker
author:
- Andrei Radulescu-Banu
---

It is often good practice to run the development environment in a docker container. This is useful when doing distributed development among multiple developers, who may each use a different version of Linux on their desktop.

For machine learning, when GPUs are used, the docker environment needs to have CUDA installed. And that takes a bit of care to set up:
* The CUDA version on the host side needs to match the CUDA version installed on the container.
* The docker service needs to have the [NVidia container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/user-guide.html) installed on the host side.

