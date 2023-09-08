---
title: "Ubuntu and NVidia"
layout: post
categories: 
---

* Steps to install nvidia container runtime for Docker:
  * Check that nvidia device is visible: `lspci -vv | grep -i nvidia`
  * Use `Additional Drivers` Ubuntu application to install the supported nvidia driver. Reboot.
  * Install Docker
  * Add current user to `docker` group
  * Install the nvidia container runtime

    ```bash
    curl -s -L https://nvidia.github.io/nvidia-container-runtime/gpgkey | \
    sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-container-runtime/$distribution/nvidia-container-runtime.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-runtime.list
    sudo apt-get update
    sudo apt-get install -y nvidia-container-toolkit
    sudo nvidia-ctk runtime configure --runtime=docker
    ```
* Alternative steps on Fedora:
  * `curl -s -L https://nvidia.github.io/libnvidia-container/centos8/libnvidia-container.repo | sudo tee /etc/yum.repos.d/nvidia-container-toolkit.repo`
  * `sudo dnf install nvidia-docker2`
  * Edit /etc/nvidia-container-runtime/config.toml and disable cgroups:
    * `no-cgroups = true`
  * `sudo nvidia-ctk runtime configure --runtime=docker`

* Verify `–gpus` option under `docker run`:
    ```bash
    $ docker run --help | grep -i gpus
      --gpus gpu-request               GPU devices to add to the container ('all' to pass all GPUs)
    ```
* Restart the docker service: `sudo systemctl restart docker`
* Run a Ubuntu container which leverages GPUs: `docker run -it --rm --gpus all ubuntu nvidia-smi`
* Listing out GPU devices
    ```bash
    $ docker run -it --rm --gpus all ubuntu nvidia-smi -L
    GPU 0: Tesla P4 (UUID: GPU-fa974b1d-3c17-ed92-28d0-805c6d089601)

    $ docker run -it --rm --gpus all ubuntu nvidia-smi  --query-gpu=index,name,uuid,serial --format=csv
    index, name, uuid, serial
    0, Tesla P4, GPU-fa974b1d-3c17-ed92-28d0-805c6d089601, 0325017070224
    ```