---
title: "Dagster Example"
layout: post
categories: machine_learning python orchestrators
---

Steps to set up Dagster on Linux or Macbook:

* Create the build folder:
    ```bash
    mkdir ~/build/dagster
    cd ~/build/dagster
    ```
* Set up `pipenv`, and enter the virtual environment:
    ```bash
    pipenv install dagster dagit pandas scikit-learn
    pipenv shell
    ```