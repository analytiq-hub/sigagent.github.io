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

Here is how your development environment can be set up. I'm using the example at [https://github.com/Bitdribble/LDL](https://github.com/Bitdribble/LDL). You will need the files below:
* [Dockerfile](https://github.com/Bitdribble/LDL/blob/main/Dockerfile)
* [docker/docker_build.sh](https://github.com/Bitdribble/LDL/blob/main/docker/docker_build.sh)
* [docker/docker_start.sh](https://github.com/Bitdribble/LDL/blob/main/docker/docker_start.sh)
* [docker/docker_stop.sh](https://github.com/Bitdribble/LDL/blob/main/docker/docker_stop.sh)

To create the Docker file, run
```
docker/docker_build.sh
```

To start the container (or to enter it from a 2nd shell):
```
docker/docker_start.sh
```

To stop the container:
```
docker/docker_stop.sh
```
