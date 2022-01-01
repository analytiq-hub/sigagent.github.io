---
layout: post
title: "Setting up Docker for Deep Learning development"
categories: python, deep_learning, machine_learning, docker
author:
- Andrei Radulescu-Banu
---

It is often good practice to run the development environment in a docker container.
* This is useful when doing distributed development with multiple engineers, who may each use a different version of Linux on their desktop.
* When a Deep Learning off-board pipeline is set up in the cloud using EC2, or Kubernetes, the container can become an environment for your deep learning toolchain.

For machine learning, when GPUs are used, the docker environment needs to have CUDA installed. And that takes a bit of care to set up:
* The CUDA version on the host side needs to match the CUDA version installed on the container.
* The docker service needs to have the [NVidia container toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/user-guide.html) installed on the host side.

Even if each engineer can have a slightly different Linux distribution on the host, they are all required to have the same CUDA version.

### Development environment setup

I'm using the example at [https://github.com/Bitdribble/LDL](https://github.com/Bitdribble/LDL). You will need the files below:
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

This is the recipe for creating the docker image. It takes a good 20-30 minutes to run, because `CUDA` and `torch` are large and take a while to download.

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

Tip: don't place any spaces after the trailing `\`.

The list of `deb` packages can be customized; as can be the list of python modules in `requirements.txt`. It is good practice to list exact python module versions in `requirements.txt`.

### docker_build.sh

Running this script will locate the `Dockerfile`, and build it. You need to do only once (unless you end up having to modify the `Dockerfile` to add other packages you might need).
```
#!/bin/bash

cd "$(dirname "$0")"/..                  # Change dir to root of sandbox
docker build -t ldl --progress=plain .   # Build the docker image
```

### docker_start.sh

This is the trickiest file to write. It's relatively easy to start a shell in the container if we want to run as root, without `CUDA,` without ability to export X based applications from inside the container, etc.

Our `docker_start.sh` is set up to:
- Map the host-side user into a container-side user, and give it `sudo` permissions.
- Map the host-side home directory in the container
- Map the build folder (in my case, `~/build` on the host side), as `/build` inside the container. You don't have to do this, it's just a matter of convenience for me.
- Enable CUDA based applications to run inside the container. That way, we'll be able to do deep learning from inside the container.
- Place the container on the same network with the host. This allows us to run `jupyter notebooks` from inside the container, and have the notebook be displayed on the host-side web browser.

```
#!/bin/bash

DOCKER_CONTAINER_NAME=ldl
DOCKER_IMAGE=ldl
DOCKER_HOSTNAME=ldl
WORKING_DIR=/build/LDL
# $USER is set up by the shell
USER_ID=$(id -u)
GRP=$(id -g -n)
GRP_ID=$(id -g)

# Ensure a default display
if [[ -z ${DISPLAY} ]];then
  DISPLAY=":0"
fi

# Is the instance already running?
if [[ $(docker ps --filter name=$DOCKER_CONTAINER_NAME -aq) ]]; then
  # Open a shell on that instance
  docker start $DOCKER_CONTAINER_NAME >/dev/null 2>&1
  docker exec -u $USER -it $DOCKER_CONTAINER_NAME /bin/bash
  exit 0
fi

# Create a new instance, but keep it detached (-d)
# - nvidia-container-toolkit and nvidia-docker2 must be installed on host side
# - NVIDIA env variables, --gpus, --runtime=nvidia are needed for CUDA
# - /tmp/.X11-unix volume mapping is needed for X
# - --net host is needed to open jupyter notebooks from inside container
docker run \
  -d \
  -e DISPLAY=$DISPLAY \
  -e NVIDIA_VISIBLE_DEVICES=all \
  -e NVIDIA_DRIVER_CAPABILITIES=all \
  -e PYTHONPATH=$WORKING_DIR \
  --gpus all \
  --hostname $DOCKER_HOSTNAME \
  -it \
  --name $DOCKER_CONTAINER_NAME \
  --net host \
  --runtime=nvidia \
  -v ~/build:/build \
  -v /home/$USER:/home/$USER \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -w $WORKING_DIR \
  $DOCKER_IMAGE

# Set up user and group
if [[ "${USER}" != "root" ]]; then
  docker exec $DOCKER_CONTAINER_NAME addgroup --force-badname --gid "${GRP_ID}" "${GRP}" >/dev/null
  docker exec $DOCKER_CONTAINER_NAME adduser --force-badname --disabled-password --gecos '' $USER --uid $USER_ID --gid $GRP_ID >/dev/null
  docker exec $DOCKER_CONTAINER_NAME usermod -aG sudo $USER >/dev/null
  docker exec $DOCKER_CONTAINER_NAME bash -c "echo '%sudo ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers"
fi

# Allow X connections
xhost +local:root 1>/dev/null 2>&1

# Attach to the instance
docker exec \
  -e DISPLAY=$DISPLAY \
  -it \
  --privileged \
  -u $USER \
  $DOCKER_CONTAINER_NAME \
  /bin/bash

# Disallow X connections
xhost -local:root 1>/dev/null 2>&1
```

Notes:
* When `docker_start.sh` is run from a second shell, it finds an `ldl` container instance running, and will drop you to a shell inside the container.
* After you exited all container shells, the container keeps running idle. When running `docker_start.sh` again, you will be back in the same container.
* To stop the container, you must explicitly execute `docker_stop.sh`.
* If the `ldl` docker image has changed in the meanwhile, to start a container using the new image you should do `docker_stop.sh`, then `docker_start.sh`

### docker_stop.sh

This script is quite simple:

```
#!/bin/bash

DOCKER_CONTAINER_NAME=ldl

docker ps --filter name=$DOCKER_CONTAINER_NAME -aq | xargs docker rm --force 2>/dev/null
```