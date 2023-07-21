---
title: "Airbyte, Dagster, Langchain Example"
layout: post
categories: machine_learning airbyte dagster langchain python
---

References:
* [Implement AI data pipelines with Langchain, Airbyte, and Dagster](https://airbyte.com/tutorials/implement-ai-data-pipelines-with-langchain-airbyte-and-dagster)
* [LLM training pipelines with Langchain, Airbyte, and Dagster](https://dagster.io/blog/training-llms)
* [Using Airbyte with Dagster](https://docs.dagster.io/integrations/airbyte)
* Langchain [Airbyte JSON](https://python.langchain.com/docs/modules/data_connection/document_loaders/integrations/airbyte_json)

Tested on Ubuntu 20.04:
* Install docker and docker-compose
* Install and start Airbyte
    ```bash
    mkdir ~/build
    cd ~/build
    git clone https://github.com/airbytehq/airbyte.git
    cd airbyte
    ./run-ab-platform.sh 
    ```
* Once you see an Airbyte banner, the UI is ready to go at [http://localhost:8000](http://localhost:8000). It actually runs at `0.0.0.0:8000`.
  * You will be asked for a username and password. By default, that's username `airbyte` and password `password`.
  * Once you deploy airbyte to your servers, be sure to change these in your `.env` file.
  * Configure Airbyte to connect `Sample Data` source to `Local JSON` destination.
  * Pick `test` as destination path. This will result in three output files `/tmp/airbyte_local/_airbyte_raw_{stream_name}.jsonl`.
* Create the build folder:
    ```bash
    mkdir ~/build/airbyte-dagster-langchain
    cd ~/build/airbyte-dagster-langchain
    ```
* Set up `venv`, and enter the virtual environment:
    ```bash
    python3 -m venv ~/.venv/langchain
    . ~/.venv/langchain/bin/activate
    pip install openai faiss-cpu requests beautifulsoup4 tiktoken dagster_managed_elements langchain dagster dagster-airbyte dagit
    ```
* Download https://github.com/airbytehq/dagster-langchain/blob/main/ingest.py
* Edit the `airbyte_loader` to point it to one of the configured `/tmp/airbyte_local/_airbyte_raw_{stream_name}.jsonl` files
* Add the user and password here:
      ```python
      airbyte_instance = AirbyteResource(
        host="localhost",
        port="8000",
        username="airbyte",
        password="password",    
      )
      ```
* Set up Dagster
    ```shell
    if [ ! -d $DAGSTER_HOME ]; then mkdir -p $DAGSTER_HOME ]; fi
    touch ${DAGSTER_HOME}/dagster.yaml
    ```
* Put your `OPENAI_API_KEY` and `DAGSTER_HOME` in your `~/.bashrc`:
    ```shell
    export OPENAI_API_KEY=XXXg
    export DAGSTER_HOME=~/build/airbyte-dagster-langchain/dagster_home    
    ```
* Re-source the `~/.bashrc` if necessary. Re-enter the virtual env.
* Start Dagster:
    ```shell
    dagster dev -f ingest.py -h 0.0.0.0
    ```
    The `-h` parameter controls the `dagit` host, and `-p` controls the port.
* 