---
layout: page
mathjax: true
title: GPUs
---
#### CUDA
* Nvidia: [CUDA C++ Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#abstract)
* Nvidia: [CUDA C/C++ Basics](https://www.olcf.ornl.gov/wp-content/uploads/2013/02/Intro_to_CUDA_C-TS.pdf)

#### Blogs
* [Tim Dettmers](https://timdettmers.com/):
  * [Which GPU(s) to Get for Deep Learning: My Experience and Advice for Using GPUs in Deep Learning](https://timdettmers.com/2023/01/30/which-gpu-for-deep-learning/), 2023

#### Quantization
* [Tim Dettmers](https://timdettmers.com/):
  * [LLM.int8() and Emergent Features](https://timdettmers.com/2022/08/17/llm-int8-and-emergent-features/), Aug 2022
* Y. Belkada, T. Dettmers: [A Gentle Introduction to 8-bit Matrix Multiplication for transformers at scale using Hugging Face Transformers, Accelerate and bitsandbytes](https://huggingface.co/blog/hf-bitsandbytes-integration)
  * While, ideally the training and inference should be done in FP32, it is two times slower than FP16/BF16
  * Experimentially, we have discovered that instead of using the 4-byte FP32 precision, we can get an almost identical inference outcome with 2-byte BF16/FP16 half-precision, which halves the model size.
  * LLM.int8(): zero degradation matrix multiplication for Large Language Models
  * In essence, LLM.int8() seeks to complete the matrix multiplication computation in three steps:
    * From the input hidden states, extract the outliers (i.e. values that are larger than a certain threshold) by column.
    * Perform the matrix multiplication of the outliers in FP16 and the non-outliers in int8.
    * Dequantize the non-outlier results and add both outlier and non-outlier results together to receive the full result in FP16.


#### Companies
* Tesla
  * [Tesla Hardware 3 (Full Self-Driving Computer) Detailed](https://www.autopilotreview.com/tesla-custom-ai-chips-hardware-3/)
  * [Tesla FSD Chip - Revolutionary or Over Hyped?](https://www.youtube.com/watch?v=zdUHp3y8VkU&feature=emb_rel_end)
  

#### Other
* [Artificial Intelligence](artificial_intelligence.md)
* [Cloud Data Platform](cloud_data_platform.md)
* [Cognitive Science](cognitive_science.md)
* [Computation Theory](computation_theory.md)
* [Machine Learning](machine_learning.md)
* [Meta Learning](meta_learning.md)
* [MLOps](mlops.md)
* [Natural Language Processing](natural_language_processing.md)
* [Probabilities and Statistics](probabilities_and_statistics.md)
* [Robotics](robotics.md)
* [Self Driving Cars](self_driving_cars.md)
* [Computational Topology](computational_topology.md)
