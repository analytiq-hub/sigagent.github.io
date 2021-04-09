---
layout: post
title: "Andrej Karpathy on The Robot Brains podcast"
author:
- Andrei Radulescu-Banu
---
[Podcast](https://shows.acast.com/the-robot-brains/episodes/andrej-karpathy-on-the-visionary-ai-in-teslas-autonomous-dri)

Andrej Karpathy is Director of AI and Autopilot Vision at Tesla. Talks about his academic work, his OpenAI stint, consulting with Tesla, getting to know Elon Musk - and being invited to lead the AI effort at Tesla. Some interesting tidbits:

* Elon Musk has this uncanny ability to take a complex problem, and distill it into something very simple. According to Karpathy, that's his superpower. Karpahty, brilliant guy himself, says he still does not understand how Elon Musk does it.
* Elon Musk, also, is like the late Steve Jobs, difficult & demanding to work with.
* The AI stack in Tesla cars, like many of you know, uses cameras and radars, not lidars - and has to be able to work in the pre-deployed fleet of cars. Not feasible to install lidars, given the hardware can't be easily upgraded on the fleet.
* They have their own GPU processor, build their own embedded computer that fits under the dash, use two redundant paths for planning (i.e., need double the compute power)
* Test drivers include large pool of select customers - good business model to get test drivers for free.
* AI algorithms run on stitched 360 degrees camera view. Lots of engineering goes into stitching those camera views, according to Karpathy
* The number of engineers doing AI programming is not large, but the number of technicians adding annotations is large.
* Karpahty says this is a new programming paradigm for AI based software - a change he says will slowly expand to other software domains
* It's a big shift in organization, and in flow of development. Essentially, the technicians who do annotations become programmers, b/c what they annotate impacts how the AI algorithms change
* According to Karpathy, other companies like Waymo are at a disadvantage, b/c they need to hire their own test drivers, and can maybe get 50 test cars, which is insufficient to scale things  up, given the scale of annotation needed to train AI algorithms
* Waymo uses lidars, and no drivers, but - not reported elsewhere - their driverless cars are currently followed by a 2nd car where the engineer stands by to remotely take over the empty car
* Waymo also needs to map the streets in advance. Tesla does not need that
* Karpathy says the AI portion of the stack slowly takes over more and more components that used to be manually programmed. This is inevitable in an AI system, he says