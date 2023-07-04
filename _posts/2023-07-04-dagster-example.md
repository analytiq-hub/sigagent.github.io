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

* Create `hello-dagster.py`

    ```python
    import pandas as pd
    import requests

    from dagster import MetadataValue, Output, asset


    @asset
    def hackernews_top_story_ids():
        """Get top stories from the HackerNews top stories endpoint.

        API Docs: https://github.com/HackerNews/API#new-top-and-best-stories.
        """
        top_story_ids = requests.get(
            "https://hacker-news.firebaseio.com/v0/topstories.json"
        ).json()
        return top_story_ids[:10]


    # asset dependencies can be inferred from parameter names
    @asset
    def hackernews_top_stories(hackernews_top_story_ids):
        """Get items based on story ids from the HackerNews items endpoint."""
        results = []
        for item_id in hackernews_top_story_ids:
            item = requests.get(
                f"https://hacker-news.firebaseio.com/v0/item/{item_id}.json"
            ).json()
            results.append(item)

        df = pd.DataFrame(results)

        # recorded metadata can be customized
        metadata = {
            "num_records": len(df),
            "preview": MetadataValue.md(df[["title", "by", "url"]].to_markdown()),
        }

        return Output(value=df, metadata=metadata)
    ```

* In the same directory as `hello-dagster.py`, run `dagster dev`. This command starts a web server to host Dagster's user interface:

     ```shell
     dagster dev -f hello-dagster.py
     ```

* In your browser, navigate to [http://localhost:3000/](http://localhost:300).

* Click *Materialize All* to run the pipeline and create your assets. 