---
layout: page
title: How to Build a Self Driving Car
---
Under construction! With more updates coming soon.

* [Book plan](https://docs.google.com/document/d/15Rc6v16nYicFrKGgcgL0Z0sjlAdeHwIArOOi_doQgKM/edit#)

Our goal is to describe
* The components of a self driving car
* The engineering needed to build it, incrementally, and component wise. The best technology is built by evolution of simpler components, from basic to complex.
* The skills needed to build each component
* How to find information about building the various components. Some good books describing general robotics or machine learning are available ([Probabilistic Robots](https://docs.ufpr.br/~danielsantos/ProbabilisticRobotics.pdf), and [Hands-On Machine Learning with Scikit-Learn, Keras, and TensorFlow](https://www.amazon.com/Hands-Machine-Learning-Scikit-Learn-TensorFlow/dp/14920326461)). However, no book seems to exist in print at this time that will describe the full technological stack of a self driving car, from start to end.

#### At a glance
* A self driving car has planner, controller, and computer vision sensors
* [Insert architecture diagram]
  * The planner computes the path the car should follow. For example: drive along the 1st lane, stop at the intersection, wait for crossing traffic, then turn left
  * The controller will set the motors and actuators - i.e., set the gear to forward, set the speed, set the steering, or break
  * The controller will report back the sensor data - i.e., gps position (car is equipped typically with dual gps, to get both position and direction. Also, current time, steering angle, speed, gear.
    * Controller is equipped with some GPS-enhancing sensors, e.g. gyro and IMU, allowing it to estimate position when GPS is temporarily not available, e.g. beause the car is in a tunnel. This allows it to interpolate a more precise GPS
  * The GPS tick from the satellite comes at 1Hz (1pps). The controller needs to report sensor data to perception and to the planner at higer frequency. This could be anywhere between 50Hz to 5Hz.
* Frequency considerations
  * If the frequency is high, the system will do obstacle avoidance in a timely fashion.
  * However, the compute power necessary to handle high frequency is proportional to the frequency. Higher frequency means, proportionally - more CPU power, and larger FPGA (or FPGAs).
* The planner <-> controller cycle runs in a continuous loop, at high frequency.
* However, vision sensors can't maintain the same high frequency, due to the compute requirements.
* Vision sensors will use a higher data bandwith, and will run at slower frequency, typically 5-50Hz (but closer to the low end of the range).
* Vision sensors include one or more cameras, lidars, radars...
  * [Insert diagram here of vision sensors]
* Data flow for vision is vision_sensor->planner.
  * This is b/c vision sensors are passive sensors.
* That being said, vision sensor data needs to be cleaned up, and synchronized. Ground points need to be marked.
* Vision sensor data is not passed directly to the planner. In between, we have the detection nodes. The following types of detections are performed:
  * Auto-calibration of the sensors.
  * Accummulated occupancy grid. This is used by the planner to determine the drivable area. The occupancy grid is discretized into voxels. Voxels that are occupied multiple frames are accummulated, and determine the accummulated occupancy grid.
  * Synchronization of multiple sensors - so data can be processed in a synchronized fashion, not in interspersed chunks.
  * Lidar motion compensation, for rotational lidars - in case it is not performed by the lidar itself.
  * Segmentation - including ground segmentation.
  * SLAM - simultaneous localization and mapping
    * This has a different, simpler implementation when the vehicle moves in a closed circuit - e.g., on a warehouse floor,  on a public transportation route, in a well-known campus, or in a parking lot.
    * If an over the road vehicle, the map infrastructure is a lot more complicated, and needs to be dynamically updated, requiring extra back-end infrastructure.
    * SLAM is an industry term for the algorithm designed to improve the quality of localization (GPS) by fusing it with visual sensor data about known static obstacles on the map.
  * Static object detection - specialized for the types of static objects. For example: traffic signage. Parked vehicles. Treating static objects separately in the detection pipeline allows for more efficient algorithms specialized for static objects.
  * Dynamic object detection, incluing pedestrian detection.
  * Object tracking. Object prediction.
    * Sometimes, this is implemented as a single deep learning layer fused with the object detection layer.
    * Other times, this is implemented as separate layers.

#### Development cycle
* The underlying robotics platform needs to support individual developers who specialize in specific components: planner, controller, various perception components.
* Each component needs to be able to run independently, in unit testing mode - with inputs replayed from recordings, so developers can do their work without having to bring the entire system up
* Here is where Robot OS (ROS) comes in handy. It is basically a pub/sub system where each node is an independent process, and messages between nodes can be recorded to disk, and can be replayed.
* Developers can pick a ROS node, start it manually, replay the input messages, and do development to ensure that the output messages are working as expected
* ROS, however, is not able to do deterministic replays. Question: is there a similar middleware that can accomplish that?
* Also, ROS is not safety-critical, and not even real time.
  * Real-time means that it can respond to a stimulus witin a very short, quantifiable time interval - so upper bounds for latencies in processing can be estimated from components to the entire system
  * Safety critical means that, additionally, the failure rate is very small, and quantifiable - so failure rates can be estimated from components to the entire system
* One advantage of ROS is that nodes can be either C++, or Python. The overall system has some nodes implemented in Python, and some in C++. As development gets closer to production, all nodes need to be moved to C++ - and, ideally, multiple nodes need to be merged into one, to achieve higher performance.
* Whatever the middleware may be, an orchestrator is used to control the start/stop of each component, as well as monitoring their health

#### Transforms
* TO DO

#### Simulation
* The system is difficult to test each time in its entirety. It's not mere equipment on a rack in a lab - so different testing techniques are necessary
* Simulation is run either as component-in-the-loop, software-in-the-loop, hardware-in-the-loop

#### Back-end cloud system
* Recordings are uploaded to cloud blob storage
  * Could be just the sensor data - or the full recordings
  * This could result in tens of terabytes of recordings per vehicle per day.
  * Upload is either automated - or manual
* These recordings become input to the Data Lake, where recordings are processed for
  * Offline segmentation and object detection annotations
  * Offline perception
* Data needs to be curated into scenes, which are sequences of frames

#### What are the components of a self driving car?
The architecture discussed here is the *modular* architecture, as opposed to the *end to end architecture* described for example [here](https://arxiv.org/pdf/2003.06404.pdf)

* Companies
  * Waymo
    * [Google’s Waymo invests in LIDAR technology, cuts costs by 90 percent](https://arstechnica.com/cars/2017/01/googles-waymo-invests-in-lidar-technology-cuts-costs-by-90-percent/) (2017)
    * [Dragomir Anguelov research](https://arxiv.org/search/?query=Dragomir+Anguelov&searchtype=all&source=header)

* Hardware: 
  * The car hardware itself could be built from scratch. However, a simpler alternative is to start with a car platform that supports drive-by-wire, extending its driving functions through its CAN bus.
    * [Comma.ai](http://comma.ai) maintains a [list of cars](https://github.com/commaai/openpilot/blob/master/docs/CARS.md) that support self-driving for the device they develop. The comma.ai software is open source. Any of the cars listed as supporting comma.ai's Open Pilot software can support self-driving through its OBD-II port.
    * Sensors
      * Radar
      * Lidar
      * Ultrasonic sensors
      * Cameras
      * GNSS
      * IMU
      * Odometers
    * References
      * Forbes: [Four Companies Selling Self-Driving Car Platforms Today, And One Coming](https://www.forbes.com/sites/davidsilver/2018/08/22/four-companies-selling-self-driving-car-platforms-today-and-one-coming/?sh=12755b6d187f) (2018)
      * EETimes: [Tracking autonomous vehicle software platforms](https://www.embedded.com/tracking-autonomous-vehicle-software-platforms/) (2020)
      * Hanky Sjafrie: [Introduction to Self-Driving Vehicle Technology](https://www.amazon.com/Introduction-Self-Driving-Technology-Artificial-Intelligence/dp/0367321254/), Chap. 2
      * Shaostan Liu et al: [Creating Autonomous Vehicle Systems](https://www.amazon.com/Creating-Autonomous-Synthesis-Lectures-Computer/dp/1681739356) (2021),Chap. 2, 3
      * S. Ranjan, S. Senthamilarasu: [Applied Deep Learning and Computer Vision for Self-Driving Cars](https://www.amazon.com/Applied-Learning-Computer-Vision-Self-Driving/dp/1838646302) Chap. 1
      * Lidar
        * [5 Ways to Optimize Your LiDAR Data](https://www.youtube.com/watch?v=omKu1pYf5uE) (2022)
* System - TO DO
  * Robotics middleware - TO DO - can use ROS v2
  * Coordinate frames - TO DO
  * Recordings - TO DO
  * Replays. Use of replays for development - TO DO
    * Deterministic replays - TO DO
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
  * Calibration - TO DO
  * Confusion matrix. P/R (precision and recall).
    * See G. Hulten: [Machine Learning Course - 2. Introduction to Evaluating Models (Lecture 2 of 23)](https://www.youtube.com/watch?v=iyjb9UBcdM8)
  * ROC and PR curves. AUC (area under the curve). Operating points.
    * Used to compare models
    * See G. Hulten: [Machine Learning Course - 6. ROC Curves and Operating Points](https://www.youtube.com/watch?v=XNYURf_GO1o)
  * References
    * S. Ranjan et al: [Applied Deep Learning and Computer Vision for Self-Driving Cars: Build autonomous vehicles using deep neural networks and behavior-cloning techniques](2020)
    * L. Venturi, K. Korda: [Hands-On Vision and Behavior for Self-Driving Cars](https://www.amazon.com/Applied-Learning-Computer-Vision-Self-Driving/dp/1838646302) (2020)
* Mapping - TO DO
* Datasets
  * [KITTY](http://www.cvlibs.net/datasets/kitti/setup.php)
    * GPS
    * Velodyne HDL-64E lidar
    * Four cameras
    * 10Hz frequency
  * [NuScenes]
    * One lidar
    * Six cameras
    * Maps
  * [ARGO]
    * Two lidars
    * Nine cameras
    * Maps
  * [Waymo](https://arxiv.org/pdf/1912.04838.pdf)
    * Five lidars
    * Five cameras
    * 10Hz frequency
  * References: Table at [Waymo](https://arxiv.org/pdf/1912.04838.pdf) p. 2
* Offboard infrastructure
  * Fleet management - TO DO
  * Recordings replay - TO DO
  * Source control - this is typical infrastructure using Jenkins or Gitlab pipelines to generate package components and release installer - TO DO
  * Perception - TO DO
* Simulation - TO DO

#### End-to-End Architecture
* References
  * A. Tampu et al: [A Survey of End-to-End Driving: Architectures and Training Methods](https://arxiv.org/pdf/2003.06404.pdf) (2021)