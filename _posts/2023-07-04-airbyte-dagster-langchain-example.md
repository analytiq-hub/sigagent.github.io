---
title: "Airbyte, Dagster, Langchain Example"
layout: post
categories: machine_learning airbyte dagster langchain python
---

Source: [Implement AI data pipelines with Langchain, Airbyte, and Dagster](https://airbyte.com/tutorials/implement-ai-data-pipelines-with-langchain-airbyte-and-dagster)

Tested on Ubuntu 18.04:
* Install docker
* Install Airbyte
    ```bash
    mkdir ~/build
    cd ~/build
    git clone https://github.com/airbytehq/airbyte.git
    cd airbyte
    ./run-ab-platform.sh 
    ```
* Once you see an Airbyte banner, the UI is ready to go at [http://localhost:8000](http://localhost:8000)! You will be asked for a username and password. By default, that's username airbyte and password password. Once you deploy airbyte to your servers, be sure to change these in your `.env` file.

* Create a build directory:

    ```bash
    mkdir -p ~/build/airbyte-dagster-langchain
    cd ~/build/airbyte-dagster-langchain
    ```

