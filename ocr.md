---
layout: page
mathjax: true
title: Optical Character Recognition
---
* [Transformers vs. OCR: an in-depth comparison for Information Extraction](https://python.plainenglish.io/transformers-vs-ocr-who-can-actually-read-better-192e6b044dd3) (2023)
* Anh Tuan: [Tutorial: OCR with PaddleOCR (PP-OCR)](https://medium.com/@anhtuan_40207/tutorial-ocr-with-paddleocr-pp-ocr-9a4342e4d7f) (2022)
* Neuralearn: [Extract Tables from PDF and convert to Excel sheet with Paddle OCR text detection and recognition](https://www.youtube.com/watch?v=HZh31OGiQRQ) (2023)
* G. Kim et al: [OCR-free Document Understanding Transformer](https://arxiv.org/pdf/2111.15664.pdf) (2022).
  * Donut [github](https://github.com/clovaai/donut), [huggingface](https://huggingface.co/docs/transformers/model_doc/donut)
* PaddleOCR
  * [Github quickstart](https://github.com/PaddlePaddle/PaddleOCR/blob/release/2.7/doc/doc_en/quickstart_en.md)
  * [PaddleOCR: Unveiling the Power of Optical Character Recognition](https://learnopencv.com/optical-character-recognition-using-paddleocr/#Paddle-OCR-) (2022)
* Hacker News: [Our search for the best OCR tool (2019)](https://news.ycombinator.com/item?id=32053525) (2022)
* [OCR in 2024: Benchmarking Text Extraction/Capture Accuracy](https://research.aimultiple.com/ocr-accuracy/)
* [OmniAI OCR Benchmark](https://getomni.ai/ocr-benchmark) (2025)

#### Process unstructured data into JSon
* https://jxnl.github.io/instructor/ - It's a thin wrapper over LLM + a few additional parsing / extraction capabilities
* https://github.com/1rgs/jsonformer - applies constrained token generation over the logits - so more useful for HuggingFace powered models
* https://github.com/outlines-dev/outlines - claims more features

#### Table Extraction 
* Benchmarks
  * SciTSR (Scientific Table Structure Recognition Dataset)
    * [Dataset Link](https://github.com/Academic-Hammer/SciTSR)
    * Contains 15,000 tables from scientific papers in PDF format
    * Focuses on complex table structures with merged cells and hierarchical headers
    * Includes both images and ground truth annotations in JSON format

  * TableBank
    * [Dataset Paper](https://arxiv.org/abs/1903.01949)
    * [Dataset Link](https://github.com/doc-analysis/TableBank)
    * 417,234 tables from Word and LaTeX documents
    * Labeled with both table detection and structure recognition annotations
    * Automatic labeling process using digital document formats

  * PubTabNet
    * [Dataset Link](https://github.com/ibm-aur-nlp/PubTabNet)
    * [Paper](https://arxiv.org/abs/1911.10683)
    * 568,000 tables extracted from PubMed Central Open Access Subset
    * HTML representation of table structures
    * Includes both simple and complex table layouts

  * ICDAR Competitions Datasets
    * [DocLayNet](https://github.com/DS4SD/DocLayNet)
    * Focus on both modern and historical documents
    * Includes table detection, structure recognition, and cell content extraction tasks

  * ViDoRe Benchmark
    * [Dataset Link](https://github.com/illuin-tech/vidore-benchmark)
    * Comprehensive evaluation of document retrieval systems
    * 100,000+ documents with rich visual elements
    * Includes complex tables, figures, and layout structures

  * TabStruct-Net
    * [Dataset Link](https://github.com/Academic-Hammer/TabStruct-Net)
    * 6,000+ tables from scientific papers
    * Specialized in handling complex hierarchical table structures
    * Includes cell relationship annotations

  * FinTabNet
    * [Dataset Link](https://developer.ibm.com/data/fintabnet/)
    * 111,690 tables from financial documents (10-K reports)
    * Annotated with table structure and cell semantic types
    * Includes complex financial tables with nested headers and spanning cells
    * Specifically designed for financial document understanding

#### Companies
* [Nanonets](https://nanonets.com/)


#### Other
* [Artificial Intelligence](/artificial_intelligence)
* [AI Agents](/ai_agents)
* [Cognitive Science](/cognitive_science)
* [Computation Theory](/computation_theory)
* [Computational Topology](/computational_topology)
* [Language Models](/language_models)
* [Meta Learning](/meta_learning)
* [Probabilities and Statistics](/probabilities_and_statistics)
* [Robotics](/robotics)
* [Self Driving Cars](/self_driving_cars)
