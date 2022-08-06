---
layout: page
title: How to Build a Self Driving Car
---
Our goal is to describe
* The components of a self driving car
* The engineering needed to build it, incrementally, and component wise. The best technology is built by evolution of simpler components, from basic to complex.
* The skills needed to build each component
* How to find information about building the various components. Some good books describing general robotics or machine learning are available ([Probabilistic Robots](https://docs.ufpr.br/~danielsantos/ProbabilisticRobotics.pdf), and [Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow](https://www.amazon.com/Hands-Machine-Learning-Scikit-Learn-TensorFlow/dp/14920326461)). However, no book seems to exist in print at this time that will describe the full technological stack of a self driving car, from start to end. 

#### What are the components of a self driving car?
The architecture discussed here is the *modular* architecture, as opposed to the *end to end architecture* described for example [here](https://arxiv.org/pdf/2003.06404.pdf)

* Hardware: 
  * The car hardware itself could be built from scratch. However, a simpler alternative is to start with a car platform that supports drive-by-wire, extending its driving functions through its CAN bus.
    * [Comma.ai](http://comma.ai) maintains a [list of cars](https://github.com/commaai/openpilot/blob/master/docs/CARS.md) that support self-driving for the device they develop. The comma.ai software is open source. Any of the cars listed as supporting comma.ai's Open Pilot software can support self-driving through its OBD-II port.
    * References
      * Forbes: [Four Companies Selling Self-Driving Car Platforms Today, And One Coming](https://www.forbes.com/sites/davidsilver/2018/08/22/four-companies-selling-self-driving-car-platforms-today-and-one-coming/?sh=12755b6d187f) (2018)
      * EETimes: [Tracking autonomous vehicle software platforms](https://www.embedded.com/tracking-autonomous-vehicle-software-platforms/) (2020)
    * TO DO: continue
* Controller
  * Its purpose is to report sensor data to the system, and to drive the car according to a driving plan set by the planner.
    * The sensor data includes position and orientation (from GPS and IMU), speed, gear, brake status.
    * Camera, lidar, radar sensors are typically not provided to the system through the controller, to reduce the system latencies.
  * The driving plan is recomputed by the planner and resent to the controller at a sub-second rate (e.g. 10Hz, 20Hz, or 50Hz).
  * The controller takes into account the most current vehicle position when attempting to drive the car according to the driving plan. The driving plan is based on slightly older sensor data than what is currently available to the controller.
  * Typically, the controller is a real time, safety critical system.
  * The controller decides if self driving is engaged, or disengaged. The planner can provide to the controller, in addition to the 'driving plan', a 'disengage plan' which can be used to safely stop the vehicle in case a disengagement has occurred.
  * References:
    * C. Samak et al: [Control Strategies for Autonomous Vehicles](https://arxiv.org/pdf/2011.08729.pdf) (2021)
    * D. Silver: [How Control Works for Self-Driving Cars](https://www.linkedin.com/pulse/how-control-works-self-driving-cars-david-silver/) (2018)
  * TO DO: continue
* Planner - TO DO
* Perception - TO DO
  * Sensors - TO DO
  * Calibration - TO DO
  * ROC and PR curves. AUC (area under the curve). Operating points.
    * Used to compare models
    * See Geoff Hulten [Machine Learning Course - 6. ROC Curves and Operating Points](https://www.youtube.com/watch?v=XNYURf_GO1o)
* Mapping - TO DO
* System - TO DO
  * Robotics middleware - TO DO - can use ROS v2
  * Coordinate frames - TO DO
  * Recordings - TO DO
  * Replays. Use of replays for development - TO DO
* Offboard infrastructure
  * Fleet management - TO DO
  * Recordings replay - TO DO
  * Source control - this is typical infrastructure using Jenkins or Gitlab pipelines to generate package components and release installer - TO DO
  * Perception - TO DO
* Simulation - TO DO

#### End-to-End Architecture
* References
  * A. Tampu et al: [A Survey of End-to-End Driving: Architectures and Training Methods](https://arxiv.org/pdf/2003.06404.pdf) (2021)