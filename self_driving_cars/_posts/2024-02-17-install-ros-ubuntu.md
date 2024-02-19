---
layout: post
title: "Install ROS2 on Ubuntu 22.04"
author:
- Andrei Radulescu-Banu
---

Source: https://docs.ros.org/en/humble/Installation/Ubuntu-Install-Debians.html

Ensure Ubuntu Universal repo is installed:

```bash
sudo apt install software-properties-common
sudo add-apt-repository universe
```

Enable required repos

```bash
sudo apt update && sudo apt install curl -y
sudo curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(. /etc/os-release && echo $UBUNTU_CODENAME) main" | sudo tee /etc/apt/sources.list.d/ros2.list > /dev/null
```

Update and upgrade packages:

```bash
sudo apt update
sudo apt upgrade
```

Install ROS2 desktop:

```bash
sudo apt install ros-humble-desktop
```

Install dev tools:

```bash
sudo apt install ros-dev-tools
```

In all terminal windows that will execute ROS commands, source `setup.bash`:

```bash
source /opt/ros/humble/setup.bash
```

You can now run the talker: `ros2 run demo_nodes_cpp talker`

And in a separate window the listener: `ros2 run demo_nodes_cpp listener`

Can record all messages: `ros2 bag record --all -o filename.bag`

And can replay them to the listener: `ros2 bag play filename.bag`