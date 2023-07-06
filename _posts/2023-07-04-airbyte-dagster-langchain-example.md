---
title: "Airbyte, Dagster, Langchain Example"
layout: post
categories: machine_learning airbyte dagster langchain python
---

Source: [Implement AI data pipelines with Langchain, Airbyte, and Dagster](https://airbyte.com/tutorials/implement-ai-data-pipelines-with-langchain-airbyte-and-dagster)

* Create the build folder:
    ```bash
    mkdir ~/build/airbyte-dagster-langchain
    cd ~/build/airbyte-dagster-langchain
    ```
* Set up `pipenv`, and enter the virtual environment:
    ```bash
    pipenv install dagster dagit pandas scikit-learn
    pipenv shell
    ```

