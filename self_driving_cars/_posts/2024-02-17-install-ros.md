---
layout: post
title: "Install ROS2 on Fedora"
author:
- Andrei Radulescu-Banu
---

Source: https://docs.ros.org/en/rolling/Installation/Alternatives/RHEL-Development-Setup.html

Set up locale

```bash
locale  # check for UTF-8

sudo dnf install langpacks-en glibc-langpack-en
export LANG=en_US.UTF-8

locale  # verify settings
```

Enable required repos

```bash
sudo dnf install -y \
  cmake \
  gcc-c++ \
  git \
  make \
  patch \
  python3-colcon-common-extensions \
  python3-mypy \
  python3-pip \
  python3-pydocstyle \
  python3-pytest \
  python3-pytest-repeat \
  python3-pytest-rerunfailures \
  python3-rosdep \
  python3-setuptools \
  python3-vcstool \
  wget

# install some pip packages needed for testing and
# not available as RPMs
python3 -m pip install -U --user \
  flake8-blind-except==0.1.1 \
  flake8-class-newline \
  flake8-deprecated
```