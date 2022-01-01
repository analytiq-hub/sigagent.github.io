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

To create the Docker image, run
```
docker/docker_build.sh
```

You can see the list of docker images with `docker images`. Ours will be named `ldl`.

To start the container from the `ldl` image (or to enter it from a 2nd shell):
```
docker/docker_start.sh
```

You can see the running containers with `docker ps`, and all containers, including the stopped ones, with `docker ps -a`.

To stop the container:
```
docker/docker_stop.sh
```

### The Dockerfile

```
FROM ubuntu:20.04 # Derive from ubuntu 20.04 as base image

ENV DEBIAN_FRONTEND=noninteractive

# A minimum number of packages required to install CUDA
RUN apt-get update; apt-get install -y \
    apt-utils \
    curl \
    gnupg \
    wget \
    zip

# Container side CUDA version must match host side CUDA version.
# You can get the Ubuntu 20 version as apt install nvidia-cuda-toolkit,
# but it may not match your host side version
#
# In my case, the host side has CUDA 11.2, so we install that.
RUN rm -rf /tmp/cuda && \
    mkdir /tmp/cuda && \
    wget --progress=bar:force:noscroll https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin && \
    mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 && \
    wget --progress=bar:force:noscroll https://developer.download.nvidia.com/compute/cuda/11.2.0/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb && \
    dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.0-460.27.04-1_amd64.deb && \
    apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub && \
    apt-get update && \
    apt-get -y install cuda && \
    rm -rf /tmp/cuda

# CUDA takes a long time to download.
# The list of these packages keeps changing, so I'm listing it after CUDA
RUN apt-get update; apt-get install -y \
    emacs \
    git \
    iputils-ping \
    htop \
    lsof \
    net-tools \
    pip \
    psmisc \
    python3 \
    sudo \
    traceroute \
    tzdata \
    vim \
    zip

# Torch is large, pip runs out of memory w/o --no-cache-dir
# so preinstall torch
RUN pip3 install --default-timeout=300 --verbose --no-cache-dir torch==1.9.0

# Install the other requirements
COPY requirements.txt /tmp
RUN pip3 install --default-timeout=300 -r /tmp/requirements.txt && \
    rm -f /tmp/requirements.txt
```

### docker_build.sh

```
#!/bin/bash

cd "$(dirname "$0")"/..                  # Change dir to root of sandbox
docker build -t ldl --progress=plain .   # Build the docker image
```