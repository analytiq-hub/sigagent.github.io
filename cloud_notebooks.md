---
layout: page
title: Cloud Notebooks
---

#### Cloud Notebook Platforms
* [Google Colab](https://colab.research.google.com/)
  * Free tier with GPU/TPU access
  * Premium with better GPUs, even longer runtimes
* [Kaggle Notebooks](https://www.kaggle.com/code)
  * Free GPU/TPU access
  * Integrated with Kaggle datasets and competitions
* [Amazon SageMaker Studio Lab](https://studiolab.sagemaker.aws/)
  * Free tier with 15GB storage and GPU access
  * No AWS account required
* [Databricks Community Edition](https://community.cloud.databricks.com/)
* [Paperspace](https://www.paperspace.com/notebooks)
  * Acquired by DigitalOcean
* [Saturn Cloud](https://saturncloud.io/)
  * Free tier
  * Dask integration for distributed computing
* [Deepnote](https://deepnote.com/)
  * Collaborative notebooks with real-time editing
  * Free tier with basic compute
* [Hex](https://hex.tech/)
  * Data apps from notebooks
  * Free community tier
* [Observable](https://observablehq.com/)
  * JavaScript-based notebooks
  * Strong visualization capabilities

#### Comparison Factors
* **Cost Structure**: Free tier limitations, pay-as-you-go vs. subscription
* **Hardware Access**: GPU/TPU availability and performance tiers
* **Collaboration**: Real-time editing, sharing, version control
* **Integration**: Pre-installed libraries, data source connections
* **Persistence**: Runtime limitations, idle shutdown policies
* **Storage**: Amount of free storage, data persistence between sessions

#### Tips for Cloud Notebooks
* Always implement checkpointing for long-running computations
* Use version control integration when available
* Download important notebooks regularly as backup
* For GPU work, optimize code before execution to maximize limited free GPU time
* Consider mounting cloud storage (Google Drive, S3) for persistent data access

#### Other
* [Colab](/colab)
* [Jupyter Notebooks](/jupyter)
* [Data Visualization](/data_visualization)
* [Cloud Data Platform](/cloud_data_platform)
* [Machine Learning](/machine_learning)
* [MLOps](/mlops) 