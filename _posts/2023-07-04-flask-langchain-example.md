---
title: "Flask & Langchain Example"
layout: post
categories: machine_learning flask langchain python
---

Steps on Ubuntu 22.04:
* Create a virtual environment, install required packages:
  * `python3 -m venv ~/.venv/flask-langchain`
  * `. ~/.venv/flask-langchain/bin/activate`
  * `pip install langchain[llms]==0.0.229` # By now this has been superseded
  * `pip install flask==2.3.2`
  * `pip install openai faiss-cpu requests beautifulsoup4 tiktoken`