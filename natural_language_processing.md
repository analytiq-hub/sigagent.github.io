---
layout: page
mathjax: true
title: Natural Language Processing
---
#### Articles
* [BERT: Pre-training of Deep Bidirectional Transformers for Language Understanding](https://arxiv.org/pdf/1810.04805.pdf), J. Devlin et al (2019)
* [The Annotated Transformer](http://nlp.seas.harvard.edu/2018/04/03/attention.html), A. Rush et al (2018)
* [Attention Is All You Need](https://arxiv.org/pdf/1706.03762.pdf), A. Vaswani et al (2017)
* [Doing more with less: meta-reasoning and meta-learning in humans and machines](https://cocosci.princeton.edu/papers/doing-more-with-less.pdf) (2023)


#### Language Models
* [Training Compute-Optimal Large Language Models](https://arxiv.org/pdf/2203.15556.pdf), J. Hoffman et al (2022)
* [PaLM: Scaling Language Modeling with Pathways](https://arxiv.org/pdf/2204.02311.pdf), A. Chowdhery et al (2022)
* [LLaMA: Open and Efficient Foundation Language Models](https://research.facebook.com/publications/llama-open-and-efficient-foundation-language-models/), G. Lample et al, Meta (2023)

#### Explainability
* OpenAI: S. Bills et al: [Language models can explain neurons in language models](https://openaipublic.blob.core.windows.net/neuron-explainer/paper/index.html) (2023)

#### Tech stack
*  Matt Bornstein, Rajko Radovanovic: [Emerging Architectures for LLM Applications](https://a16z.com/2023/06/20/emerging-architectures-for-llm-applications/) (2023)
   * Andrei's [tweet](https://twitter.com/bitdribble/status/1672233355914428417)

#### Courses
* [Full Stack LLM Bootcamp](https://fullstackdeeplearning.com/llm-bootcamp/) (2023)
  * Charles Frye: [Learn to Spell: Prompt Engineering](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/prompt-engineering/)
    * D. Dohan et al: [The Language Model Cascades](https://arxiv.org/pdf/2207.10342.pdf) (2022)
    * The primary goal of prompting is subtractive; it focuses the mass of predictions to hone in on a specific world by conditioning the probabilistic model.
  * Josh Tobin:
    * [Prompt Engineering](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/prompt-engineering/)
    * [LLMOps](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/llmops/)
  * Harrison Chase: [Agents](https://fullstackdeeplearning.com/llm-bootcamp/spring-2023/chase-agents/)
* Maxime Labonne: [Large Language Model Course](https://github.com/mlabonne/llm-course), [blog](https://mlabonne.github.io/blog/)

#### Derivatives of LLaMA
* E. Hu et al: [LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685), 2021
  * LoRA freezes the pre-trained model weights and injects trainable rank decomposition matrices into each layer of the Transformer architecture
  * Greatly reducing the number of trainable parameters for downstream tasks
  * LoRA makes training more efficient and lowers the hardware barrier to entry by up to 3 times when using adaptive optimizers
  * The simple linear design allows us to merge the trainable matrices with the frozen weights when deployed, introducing `no inference latency` compared to a fully fine-tuned model, by construction.
  * Should work with dense layers
  * Benefits
    * The most significant benefit comes from the reduction in memory and storage usage. For a large Transformer trained with Adam, we reduce that VRAM usage by up to 2/3 if r << dmodel as we do not need to store the optimizer states for the frozen parameters. On GPT-3 175B, we reduce the VRAM consumption during training from 1.2TB to 350GB. With r = 4 and only the query and value projection matrices being adapted, the checkpoint size is reduced by roughly 10,000× (from 350GB to 35MB)4. This allows us to train with significantly fewer GPUs and avoid I/O bottlenecks. Another benefit is that we can switch between tasks while deployed at a much lower cost by only swapping the LoRA weights as opposed to all the parameters. This allows for the creation of many customized models that can be swapped in and out on the fly on machines that store the pre-trained weights in VRAM. We also observe a 25% speedup during training on GPT-3 175B compared to full fine-tuning5 as we do not need to calculate the
gradient for the vast majority of the parameters    
* C. Wu et al: [PMC-LLaMA: Further Finetuning LLaMA on Medical Papers](https://arxiv.org/pdf/2304.14454.pdf) (2023)
* aituts.com: Yubin: [How to run Meta's LLaMA on your computer (Windows, Linux tutorial)](https://aituts.com/llama/) (Mar 2023)

#### Courses
* A. Karpathy: [Let's build GPT: from scratch, in code, spelled out.](https://www.youtube.com/watch?v=kCc8FmEb1nY) (2023)
  * Github: [nanoGPT](https://github.com/karpathy/nanoGPT), Andrei's [fork](https://github.com/andrei-radulescu-banu/nanoGPT)
  * Notebook: [gpt_dev.ipynb](https://github.com/andrei-radulescu-banu/nanoGPT/blob/master/gpt_dev.ipynb)
  * Tokenizers: [sentencepiece](https://github.com/google/sentencepiece), [tiktoken](https://github.com/openai/tiktoken)


#### Posts
* Veysel Kocaman: [Introduction to Spark NLP: Foundations and Basic Components](https://towardsdatascience.com/introduction-to-spark-nlp-foundations-and-basic-components-part-i-c83b7629ed59) (2019)
* [Lilian Weng](https://lilianweng.github.io)
  * [Controllable Neural Text Generation](https://lilianweng.github.io/posts/2021-01-02-controllable-text-generation/) (Jan 2021)
  * [Prompt Engineering](https://lilianweng.github.io/posts/2023-03-15-prompt-engineering/) (Mar 2023)
* K. Rink: [Leverage LLMs Like GPT to Analyze Your Documents or Transcripts](https://towardsdatascience.com/leverage-llms-like-gpt-to-analyze-your-documents-or-transcripts-c640a266ad52) (2023)
* Jay Alammar: [The Illustrated Transformer](http://jalammar.github.io/illustrated-transformer) (2019)
* S. Raschka: [Understanding Large Language Models](https://magazine.sebastianraschka.com/p/understanding-large-language-models) (2023). A Cross-Section of the Most Relevant Literature To Get Up to Speed.
* Databricks: Mike Conover et al: [Free Dolly: Introducing the World's First Truly Open Instruction-Tuned LLM](https://www.databricks.com/blog/2023/04/12/dolly-first-open-commercially-viable-instruction-tuned-llm)

#### Talks
* [Advanced Natural Language Processing with Apache Spark NLP](https://www.youtube.com/watch?v=V9NBkxvSZmU&t=237s) (2021)
* Yannic Kilcher
  * [GPT-3: Language Models are Few-Shot Learners](https://www.youtube.com/watch?v=SY5PvZrJhLE&list=PL1v8zpldgH3pQwRz1FORZdChMaNZaR3pu&index=20) (Paper Explained)
* PI School: Lukasz Kaiser: [Attention is all you need; Attention neural network models](https://www.youtube.com/watch?v=rBCqOTEfxvg) (2018)
* [John Schulman - Reinforcement Learning from Human Feedback: Progress and Challenges](https://www.youtube.com/watch?v=hhiLw5Q_UFg) (2023)
* [Mapping the future of *truly* Open Models and Training Dolly for $30 — with Mike Conover of Databricks](https://www.latent.space/p/mike-conover?utm_source=twitter&utm_medium=social&utm_campaign=twitter-embed#details) (2023)
* Latent Space:
  * [Latent Space Live: Responding to the Leaked Google vs OpenAI strategy memo ](https://www.youtube.com/watch?v=GR8i7PfWaVw) (2023)
  * [Training Mosaic's "llongboi" MPT-7B in 9 days for $200k with an empty logbook, how to prep good data for your training, and the future of open models](https://www.latent.space/p/mosaic-mpt-7b#details) (2023)

#### Tools
* [Langchain](https://python.langchain.com/en/latest/getting_started/getting_started.html)
* [Pinecone](https://www.pinecone.io/)
* [Replit](https://replit.com)
* [Langview](https://twitter.com/rupert_parry/status/1653780093712633859) demo
* [Mosaic](https://www.mosaicml.com) - open source LLM infrastructure for enterprise market.
  * [BioMedLM: a Domain-Specific Large Language Model for Biomedical Text](https://www.mosaicml.com/blog/introducing-pubmed-gpt) (2022)
    * Data stored in S3
    * Training on cheaper cloud infrastructure than EC2
    * Data loading with [mosaicml/streaming](https://github.com/mosaicml/streaming)
 * [Unstructured](https://www.unstructured.io/)
   * [How Unstructured Unlocked 100k+ Pages of IRS Manuals](https://medium.com/@unstructured-io/leveraging-enterprise-specific-data-with-llms-how-unstructured-unlocked-100k-pages-of-irs-manuals-33e16308c1e3) (2023)
* Summarization
  * [WordTune](http://wordtune.com)
* [llama2-chatbot](https://llama2.ai/) [github](https://github.com/a16z-infra/llama2-chatbot) by Matt Bornstein et al
* [SciSpace Copilot](https://typeset.io/) chrome extension

#### Models
* [OpenAlpaca](https://github.com/yxuansu/OpenAlpaca)
* [alpaca-lora](https://github.com/tloen/alpaca-lora), [huggingface](https://huggingface.co/spaces/tloen/alpaca-lora)
* Vicuna [FastChat](https://github.com/lm-sys/FastChat)
  * [Chat with Open Large Language Models](https://chat.lmsys.org/)
  * [Run Vicuna-13B On Your Local Computer](https://www.youtube.com/watch?v=F_pFH-AngoE), tutorial (GPU)
  * Nischal Harohalli Padmanabha: [A step-by-step guide to running Vicuna-13B Large Language Model on your GPU / CPU machine](https://www.linkedin.com/pulse/step-by-step-guide-running-vicuna-13b-large-language-nischal/) (2023)
    * g4dn.4xlarge EC2 instance
      * Memory - 64GB
      * GPU - Not mandatory, but advised. Tesla T4 - 16GB
      * CPU - 16 Core
      * Disk space - 200 GB
* Simon Willison's Weblog:
  * [Large language models are having their Stable Diffusion moment](https://simonwillison.net/2023/Mar/11/llama/) (2023)
  * [Running LLaMA 7B and 13B on a 64GB M2 MacBook Pro with llama.cpp](https://til.simonwillison.net/llms/llama-7b-m2) (2023)
* [ggerganov/llama.cpp](https://github.com/ggerganov/llama.cpp)
  * ggerganov: [What is the meaning of hacked?](https://github.com/ggerganov/llama.cpp/issues/33#issuecomment-1465108022)
* [gorilla](https://github.com/ShishirPatil/gorilla)
  * Ben Wodecky: [Meet Gorilla: The AI Model That Beats GPT-4 at API Calls](https://aibusiness.com/nlp/meet-gorilla-the-ai-model-that-beats-gpt-4-at-api-calls) (2022)
* [toolformer](https://github.com/lucidrains/toolformer-pytorch)

#### Scale of Models
* Harm de Vries: [Go smol or go home](https://www.harmdevries.com/post/model-size-vs-compute-overhead/), Apr 2023
  * Andrej Karpathy tweet: [The 'Chincilla trap' and the deVries post](https://twitter.com/karpathy/status/1654898539661754368)
* [oobabooga/text-generation-webui](https://github.com/oobabooga/text-generation-webui)
* Tim Dettmers tweet: [Next week: bitsandbytes 4-bit closed beta that allows you to finetune 30B/65B LLaMA models on a single 24/48 GB GPU (no degradation vs full fine-tuning in 16-bit)](https://twitter.com/Tim_Dettmers/status/1654917326381228033), May 2023

#### Fine Tuning
* [huggingface/peft](https://github.com/huggingface/peft), supports LORA, Prefix-Tuning, P-Tuning, Prompt Tuning, AdaLoRA. Runs on consumer hardware.
  * Mark Tenenholtz: [tweet](https://twitter.com/marktenenholtz/status/1655582062663852036): Everyone can fine-tune LLMs on a single GPU.
* Databricks:
  * Sean Owen: [Fine-Tuning Large Language Models with Hugging Face and DeepSpeed](https://www.databricks.com/blog/2023/03/20/fine-tuning-large-language-models-hugging-face-and-deepspeed.html) (2023)

### Open Source Movement
* Andrej Karpathy tweet: [Roughly speaking the story as of now](https://twitter.com/karpathy/status/1654892810590650376?cn=ZmxleGlibGVfcmVjcw%3D%3D&refsrc=email), Apr 2023
  

#### Companies
* Hugging Face
  * AssemblyAI: [Getting Started With Hugging Face in 15 Minutes: Transformers, Pipeline, Tokenizer, Models](https://www.youtube.com/watch?v=QEaBAZQCtwE) (2022)
  * 1littecoder: [What is Hugging Face - Crash Course (No Coding): ML Products for Beginners](https://www.youtube.com/watch?v=x8gdOPO35HA) (2022)

#### Other
* [Artificial Intelligence](/artificial_intelligence)
* [Autonomous Agents](/autonomous_agents)
* [Cognitive Science](/cognitive_science)
* [Computation Theory](/computation_theory)
* [Meta Learning](/meta_learning)
* [Natural Language Processing](/natural_language_processing)
* [Probabilities and Statistics](/probabilities_and_statistics)
* [Robotics](/robotics)
* [Self Driving Cars](/self_driving_cars)
* [Computational Topology](/computational_topology)
