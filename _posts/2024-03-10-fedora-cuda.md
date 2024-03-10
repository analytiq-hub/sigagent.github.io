---
title: "Install CUDA on Linux Fedora 39"
categories: webdev
author: Andrei Radulescu-Banu
layout: post
---

Steps:
* Check the Fedora version in `/etc/os-release`. Update to version 39, or the latest version available. Change the instructions below accordingly, if using a newer Fedora version than 39.
* Check that `nvidia-smi` detects the Nvidia driver.
* Check that torch detects cuda - for me, it did not:
  ```python
  import torch
  torch.cuda.is_available()
  ```
* `sudo dnf config-manager --add-repo https://developer.download.nvidia.com/compute/cuda/repos/fedora39/x86_64/cuda-fedora39.repo`
* `sudo dnf -y install cuda`
* If the above gives conflict errors: `sudo dnf -y install cuda --allowerasing`
* ... But then, we still get conflict errors