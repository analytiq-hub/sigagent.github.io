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

### Testing and Evaluation

- **Real-World Testing**: Expensive and time-consuming.
- **Simulation**: Offers automated, parallel, and scalable testing, allowing for the examination of active algorithms and the generation of ground truth data for machine learning models.
- **Data Sets**: Passive testing for perception and state estimation algorithms. However, they offer a limited view of the world and can't test active components like planning algorithms effectively.

### Course Components

- **Lectures**: Cover control, planning, perception, and practical industry perspectives.
- **Programming Projects**: Focus on implementing control, planning, and perception components.
- **Seminars**: Discuss state-of-the-art research papers.
- **Examination**: Assess understanding and application of course content.

This course aims to equip students with a foundational understanding of autonomous vehicles, emphasizing both theoretical knowledge and practical application through projects and seminars.