---
layout: page
title: Colab
---

#### Colab and GitHub
* [Using Colab with GitHub](https://colab.research.google.com/github/googlecolab/colabtools/blob/master/notebooks/colab-github-demo.ipynb)
* [How to Deal With Files in Google Colab: Everything You Need to Know](https://neptune.ai/blog/google-colab-dealing-with-files), S. Sadangi (2021)
* [How to use Google Colaboratory to clone a GitHub Repository to your Google Drive?](https://medium.com/@ashwindesilva/how-to-use-google-colaboratory-to-clone-a-github-repository-e07cf8d3d22b), A. DeSilva (2019)

#### Workflow
* Open [https://colab.research.google.com/github/](https://colab.research.google.com/github/) to browse your GitHub repo (or any public that contain Jupyter notebooks)
* Load the notebook in Colab
* Sometimes the notebook references other files in the github repo. Add the following to your Colab notebook to download the repo (replace `bitdribble/LDL` with `<github_user>/<repo>`):
```
# Colab starts shell in /content
!rm -rf LDL
!git clone https://github.com/Bitdribble/LDL.git
```
* Sometimes you need extra python modules installed. Create a `colab_requirements.txt` in your git repo, and load it from the notebook:
```
!pip install -r /content/LDL/colab_requirements.txt
```
* Sometimes you need to download data. Invoke a shell command from your git repo to do that:
```
!/content/LDL/data/mnist/download_mnist.sh
```
* Before running the rest of the notebook, sometimes you need to `cd` to a folder. We use `%` so the command is executed in the notebook environment, using `!` would execute it in its own environment:
```
%cd /content/LDL/stand_alone
```
* Run the rest of the notebook, and fix any remaining issues
* When done, click `File->Save a Copy in GitHub`. Add a `Open in Colab` badge.
  * I save notebooks in a separate top-level folder called `colab`, so I don't break the source notebooks.
  * You need to grant Colab permission to your GitHub account.
* For an example setup, see [https://github.com/bitdribble/LDL](https://github.com/bitdribble/LDL)


#### Notes
* In Colab, use `!shell_cmd` to execute a shell command.
* To execute it in the Colab environment, rather than as a subcommand, do `%shell_cmd`. This is useful when changing directory, for example.

#### Other
* Tools
  * [Altair Charts](/altair)
  * [Colab](/colab)
  * [Editors](/editors)

