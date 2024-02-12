---
layout: post
title: "Ashok Elluswamy: Foundation Models for Autonomy"
author:
- Andrei Radulescu-Banu
---
Ashok's 2023 CVPR Workshop on Autonomy talk video: [Foundation Models for Autonomy](https://www.youtube.com/watch?v=6x-Xb_uT7ts&list=PLvXze1V52Yy3QxWYFfWhCFrzUjZqY1jgN&index=10)

A ChatGPT summary posted by a youtube commenter (slightly corrected):

- The speaker, Ashok Elluswamy, is the head of the Tesla Autopilot team. He took over when Andrej Karpathy left.
- Ashok presents their work on what they believe will be the foundation model for autonomy and robotics.
- Tesla has shipped the full self-driving beta software to all purchasers in the United States and Canada, with roughly 400,000 vehicles having driven up to 250 million miles on the full self-driving beta program.
- The self-driving stack is scalable and can navigate to any destination within the US, handling intersections, stopping at traffic lights, and interacting with other objects.
- The system is driven primarily by eight cameras on the car that provide a full 360-degree coverage.
- The self-driving stack is based on modern machine learning, with many components folded into neural networks. This is different from the traditional approach to self-driving, which uses localization maps and various sensors.
- The system works primarily with cameras, and it performs quite well.
- The speaker discusses the importance of occupancy networks in their stack, which predict whether a voxel in 3D space is occupied or not. This model task is general and robust to ontology errors.
- The occupancy networks also predict the flow of voxels in the future, providing arbitrary motion. Everything runs in real time.
- The architecture of the system may look complicated, but it's quite straightforward. Videos from multiple cameras stream in, and a large Transformer block builds up features and does temporal attention with some geometry thrown in.
- The same architecture can be used for other tasks needed for driving, such as predicting lanes and roads.
- Lanes are crucial for driving tasks but are challenging to predict due to their high-dimensional nature, graph structure, and large uncertainty. They can span the entire road, fork, merge, and sometimes even humans cannot agree on their structure.
- The team uses state-of-the-art generative modeling techniques, such as autoregressive transformers, to predict lanes. This approach is similar to GPT and predicts lanes one token at a time, considering the full graph structure.
- Moving objects like vehicles, trucks, and pedestrians need to be detected with their full kinematic state. The models used are multi-modal, taking in not just camera video streams but also other inputs like the vehicle's own kinematics and navigation instructions.
- The entire motion planning can also be done using a network, making the system a modern machine learning stack where everything is done end-to-end.
- The success of this system is attributed to the sophisticated auto-labeling pipeline that provides data from the entire fleet. This allows for multi-trip reconstruction, where multiple Tesla vehicles driving through the same location provide their video clips and kinematic data to construct the entire 3D scene.
- The team uses multi-trip reconstruction to gather data from the entire fleet, enabling them to reconstruct lanes, road lines, and other elements from anywhere on Earth.
- They use a hybrid approach to Neural Radiance Fields (NeRF) and general 3D reconstruction, which results in accurate and clear reconstructions of the scene, including vehicles, barriers, and trucks.
- Additional neural networks are run offline to produce labels for lanes, roads, and traffic lights, creating a vector representation that can be used as labels for the online stack.
- The system can auto-label traffic lights, predicting their shape, color, and relevancy, and these predictions are multi-view consistent.
- These predictions provide a superhuman understanding of the world from cameras, creating a foundation model that can be used in various places.
- The system helps with both autonomous and manual driving, providing emergency braking for crossing vehicles. This is a new feature, as crossing objects are harder to predict than vehicles in your own lane.
- The team is working on learning a more general world model that can represent arbitrary things, using recent advances in generative models like Transformers and diffusion.
- The neural network can predict future video sequences given past videos. It predicts for all eight cameras around the car jointly, understanding depth and motion on its own without any 3D priors.
- The model can be action-conditioned. For example, given the same past context, when asked for different futures (like keep driving straight or change lanes), the model can produce different outcomes.
- This creates a neural network simulator that can simulate different futures based on different actions, representing things that are hard to describe in an explicit system.
- Future prediction tasks can also be done in semantic segmentation or reprojected to 3D spaces, predicting future 3D scenes based on the past and action prompting.
- The team is working on solving various nuances of driving to build a general driving stack that can drive anywhere in the world and be human-like, fast, efficient, and safe.
- Training these models requires a lot of compute power. Tesla is aiming to become a world leader in compute with their custom-built training hardware, Dojo, which is starting production soon.
- The models are not just being built for the car but also for the robot, with several networks shared between the car and the robot.
- The foundational models for vision that the team is building are designed to understand everything and generalize across cars and robots. They can be trained on diverse data from the fleet and require a lot of compute power.
- The team is excited about the progress they expect to make in the next 12 to 18 months.
- In the Q&A session, the speaker explains that they can track moving objects in the 3D reconstruction with their hybrid NeRF approach, using various cues and signals in the data.
- The world model for future prediction tasks is a work in progress, but it's starting to work now, providing a simulator where they can roll out different outcomes and learn representations.
- The use of autoregressive models for predicting lanes is due to the graph structure of lanes and the need to model a distribution in high-dimensional space. This approach provides clear, non-blurry predictions that are useful downstream.
- The voxel size in the occupancy network output is a trade-off between memory and compute and can be configured based on the needs of the application.
- The same principles of the world model should apply to humanoid robots. The model should be able to imagine what actions like picking up a cup or walking to a door would look like.
- The occupancy network is used for collision avoidance in the full self-driving (FSD) system. It's particularly useful for dealing with unusual vehicles or objects that are hard to model using other methods.
- The general world model is still being optimized and hasn't been shipped to customers yet. It might be ready later in the year.
- The system doesn't use high-definition maps, so alignment isn't super critical. The maps used are low-definition, providing enough information to guide the network on which roads and lanes to take.
