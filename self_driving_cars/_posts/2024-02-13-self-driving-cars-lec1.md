---
layout: post
title: "Cyrill Stachniss: Self-Driving Cars, An Introduction (Lecture 1)"
author:
- Andrei Radulescu-Banu
---

Lecture: [Self-Driving Cars: An Introduction (Cyrill Stachniss)](https://www.youtube.com/watch?v=EBFlmHqgezM&list=PLgnQpQtFTOGQo2Z_ogbonywTg8jxCI9pD&index=1)

### Introduction to Autonomous Vehicles Course

**Lecturers**: Cyriel Stachniss, Jens Behley, Nived Chebrolu, Benedikt Mersch, and Igor Bogoslavsky

**University of Bonn**

This lecture introduces the fundamental concepts behind self-driving cars, focusing on their key building blocks and the necessary steps to enable autonomous driving capabilities. The course is a collaborative effort, aiming to provide insights into how autonomous vehicles function, discuss related work, and support students in implementing components of self-driving cars.

### What is a Self-Driving Car?

- A regular car equipped with sensors to perceive its surroundings, such as 3D laser scanners, cameras, GPS, and IMUs.
- On-board computers process sensor data to model the world and make predictions about future states.
- The vehicle autonomously generates steering commands and controls the throttle and brake, requiring instrumentation for computer control.

### Course Aims

- Introduction to autonomous vehicles and basic techniques used in their realization.
- Focus on key building blocks, providing hands-on experience through programming projects.
- Mix of lectures, project work, and seminars to cover current state-of-the-art approaches.
- Assumes basic knowledge in robotics, photogrammetry, and state estimation.

### Key Functions of Self-Driving Cars

- **Prior Knowledge**: Essential for planning paths and localization.
- **State Estimation**: Knowing the vehicle's and objects' positions.
- **Perception**: Using local sensors for understanding surroundings.
- **Prediction**: Forecasting actions of other traffic participants.
- **Planning**: Deciding on safe and efficient actions.
- **Execution**: Carrying out planned motions and monitoring their execution.

### Historical Context

- Concept of self-driving cars dates back to 1918.
- Significant advancements in the 1980s and 1990s, notably by Ernst Dickmanns with autonomous Mercedes-Benz vehicles.
- DARPA Grand Challenges (2004-2007) accelerated research and development.
- Since 2000, substantial progress and investment in autonomous driving technologies.

### Levels of Autonomy (SAE)

- **Level 0**: No Automation.
- **Level 1**: Driver Assistance (basic steering/acceleration tasks).
- **Level 2**: Partial Automation (advanced cruise control).
- **Level 3**: Conditional Automation (safety-critical functions automated; human intervention required).
- **Level 4**: High Automation (autonomous in certain conditions).
- **Level 5**: Full Automation (no human intervention required).

The lecture provides a detailed explanation of the key technological components that enable self-driving cars to perceive, estimate, predict, and act autonomously. These components are crucial for understanding how autonomous vehicles interact with their environment, make decisions, and navigate safely. The lecture outlines these components as follows:

### 1. **Perception**
- **Definition**: Perception in self-driving cars involves using sensors to acquire data about the vehicle's surroundings. This includes identifying other vehicles, pedestrians, road markings, traffic signs, and more.
- **Sensors**: Typical sensors used in autonomous vehicles for perception include 3D laser scanners (LiDAR), cameras, GPS, and IMUs (Inertial Measurement Units). These sensors collect diverse types of data, providing a comprehensive understanding of the environment.
  - **LiDAR (Light Detection and Ranging)**: Provides 3D point clouds of the environment by measuring distances using laser light. It helps in detecting objects and their shapes around the vehicle.
  - **Cameras**: Capture visual information, useful for recognizing traffic signs, lane markings, and objects based on appearance. Advanced computer vision techniques and deep learning models process camera images for semantic interpretation.
  - **Radar**: Uses radio waves to detect the distance and speed of objects, particularly effective in adverse weather conditions.
  - **GPS and IMUs (Inertial Measurement Units)**: Provide positioning and orientation information, contributing to global and local localization.
- **Functionality**: The vehicle processes this sensor data to create models of the world. These models help the car understand what objects are around it and their characteristics (e.g., a vehicle, pedestrian, or cyclist).

### 2. **State Estimation**
- **Definition**: State estimation involves determining the vehicle's current state, including its location, orientation, speed, and the state of nearby objects.
- **Purpose**: Accurate state estimation is crucial for situational awareness and for making informed decisions based on current conditions.
- **Localization Techniques**: Combining GPS data with high-definition maps allows the vehicle to determine its precise location in the world. Additionally, techniques such as SLAM (Simultaneous Localization and Mapping) enable the car to map its environment in real-time while keeping track of its position within that map.
- **Sensor Fusion**: Algorithms integrate data from multiple sensors (LiDAR, cameras, radar, GPS, IMUs) to create a comprehensive and accurate estimate of the vehicle's state and the state of the environment. Kalman filters and particle filters are examples of algorithms used for sensor fusion.

### 3. **Prediction**
- **Definition**: Prediction in the context of self-driving cars is about forecasting the future actions of other road users and changes in the environment. This could mean anticipating whether a pedestrian will cross the road or predicting the movement of nearby vehicles.
- **Machine Learning and Deep Learning**: The prediction component relies heavily on machine learning models to forecast the actions of other road users. Techniques like recurrent neural networks (RNNs) and long short-term memory (LSTM) networks can model temporal sequences, essential for predicting movements over time.
- **Behavioral Modeling**: Simulating human behavior and decision-making processes allows the system to anticipate potential actions of pedestrians, cyclists, and other vehicles. This involves rule-based systems combined with probabilistic models.

### 4. **Planning and Acting**
- **Definition**: Planning involves deciding the best course of action based on the car's current state, the perceived environment, and predictions about future states. Acting is the execution of these plans through control commands to the vehicle's systems.
- **Objective**: The ultimate goal is to ensure safe navigation towards a destination while adhering to traffic rules, avoiding obstacles, and considering the comfort and preferences of passengers.
- **Process**: The car generates motion plans that specify how to navigate its environment safely and efficiently, adjusting its speed, direction, and lane position as needed. It then sends commands to the steering, acceleration, and braking systems to follow these plans.
  - **Path Planning Algorithms**: Algorithms such as A*, RRT (Rapidly-exploring Random Tree), and D* Lite are used for generating optimal paths from the current location to the destination while avoiding obstacles.
  - **Motion Control**: Techniques like PID (Proportional, Integral, Derivative) controllers, Model Predictive Control (MPC), and fuzzy logic controllers translate the planned path into specific steering, acceleration, and braking commands.
  - **Imitation Learning**: Learning from human driving behavior to generate driving policies that mimic human-like driving in complex scenarios, enhancing the naturalness of the autonomous driving behavior.

These components are interdependent, forming a continuous feedback loop where the vehicle constantly updates its perception and predictions based on new sensor data, refines its state estimates, revises its plans, and adjusts its actions accordingly. This integrated approach is fundamental to the autonomous operation of self-driving vehicles, enabling them to navigate complex and dynamic road environments.

### Integrative Technologies
- **Simulation Software**: Tools like CARLA offer simulated environments for testing and developing autonomous driving algorithms. These simulations allow for safe, reproducible testing of planning, control algorithms, and machine learning models under a wide range of scenarios, including rare and dangerous situations not easily encountered or safely tested in the real world.

### Testing and Evaluation

- **Real-World Testing**: Expensive and time-consuming.
- **Simulation**: Offers automated, parallel, and scalable testing, allowing for the examination of active algorithms and the generation of ground truth data for machine learning models.
- **Data Sets**: Passive testing for perception and state estimation algorithms. However, they offer a limited view of the world and can't test active components like planning algorithms effectively.

### Datasets

Several datasets have been made available by both academic institutions and companies to facilitate research and development in autonomous driving technologies. These datasets typically include a wide range of sensor data (e.g., LiDAR, camera images, radar) and sometimes additional annotations like semantic labels or object bounding boxes. Prominent datasets mentioned in the lecture include:

- **Kitti Dataset**: A benchmark suite for computer vision tasks in the context of autonomous driving, providing stereo images, LiDAR scans, and GPS positions.
- **Semantic Kitti**: An extension of the Kitti Dataset that includes semantic labels for every point in the 3D LiDAR scans.
- **Oxford RobotCar Dataset**: Contains over 100 repetitions of a consistent route through Oxford, UK, captured over a year, including various weather conditions and seasons.
- **Waymo Open Dataset**: Provided by Waymo, offering high-resolution sensor data and annotations for a variety of driving scenarios.
- **Argoverse**: Contains 3D tracking annotations for vehicles and pedestrians, as well as high-definition maps.
- **Berkeley DeepDrive (BDD100k)**: Offers a diverse set of video sequences recorded in urban and rural areas under various weather and lighting conditions.

### How Datasets Are Used

Datasets serve multiple purposes in the development of autonomous driving systems:

- **Algorithm Development and Testing**: Researchers and developers use datasets to develop and test computer vision, perception, and state estimation algorithms. The diversity of scenarios captured in these datasets helps in designing robust algorithms.
- **Machine Learning Model Training**: Datasets, especially those with annotations, are crucial for training machine learning models. The models learn to recognize patterns, objects, and behaviors from the labeled data.
- **Benchmarking and Evaluation**: Many datasets come with benchmarking suites, allowing researchers to evaluate and compare the performance of their algorithms against standard metrics and the results of other teams.

### Algorithms That Can Be Tested With Datasets

- **Perception Algorithms**: Object detection, semantic segmentation, and instance segmentation algorithms can be tested using datasets. These algorithms benefit from annotated images and LiDAR scans that provide ground truth labels for training and evaluation.
- **State Estimation Algorithms**: Localization and mapping algorithms like SLAM can be evaluated using datasets that offer synchronized sensor data along with ground truth positions.
- **Motion Prediction**: Algorithms predicting the future states of dynamic objects can be tested using datasets with sequential data and annotations for object trajectories.

### Limitations of Datasets

While datasets are invaluable for certain types of algorithm development, they have limitations:

- **Active Algorithms**: Datasets are less suitable for testing algorithms that involve active interaction with the environment, such as planning and control algorithms. Since datasets are static and passive, they cannot simulate the dynamic responses of the vehicle and other road users to the actions taken by the autonomous system.
- **Rare and Hazardous Scenarios**: Although datasets can capture a wide range of driving conditions, they may not adequately represent very rare or hazardous driving scenarios critical for testing the safety and robustness of autonomous driving systems.
- **Sensor Configuration Changes**: Datasets are tied to specific sensor configurations and placements. If the autonomous vehicle's sensor setup changes (e.g., a new LiDAR model or a different camera setup), the dataset may not accurately reflect the data the revised system would collect, limiting its usefulness for testing algorithms designed for the new configuration.

While datasets are essential tools for developing and testing a range of algorithms in autonomous driving, their static nature limits their applicability for testing interactive and dynamic behaviors, necessitating the use of simulations and other methods for comprehensive testing.

### Course Components

- **Lectures**: Cover control, planning, perception, and practical industry perspectives.
- **Programming Projects**: Focus on implementing control, planning, and perception components.
- **Seminars**: Discuss state-of-the-art research papers.
- **Examination**: Assess understanding and application of course content.

This course aims to equip students with a foundational understanding of autonomous vehicles, emphasizing both theoretical knowledge and practical application through projects and seminars.