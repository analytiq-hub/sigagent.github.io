---
title: "Paddle OCR, conversation with Bard"
categories: ocr
author: Andrei Radulescu-Banu
layout: post
---

---

Q: Which paddle OCR models are the best?

---

Choosing the "best" PaddleOCR model depends on your specific needs and priorities. Here's a breakdown of different models and their strengths:

PP-OCRv4:
* Latest: Released in August 2023, it's the most up-to-date model.
* Accuracy: Offers the highest accuracy for both Chinese and English scenes (server version).
* Speed: Comes in two versions, mobile and server. The mobile version prioritizes speed while maintaining good accuracy, making it suitable for edge devices.
* Versatility: Supports over 80 languages.

PP-OCRv3:
* Mature: A well-established option with good overall performance.
* Balanced: Offers a good balance between accuracy and speed.
* Lightweight: Easier to deploy on resource-constrained devices than PP-OCRv4.
* Wide language support: Covers over 80 languages.

Other models:
* DB, EAST, SAST: Text detection models with focus on accuracy and robustness.
* CRNN, RARE, StarNet, Rosetta, SRN: Text recognition models with varying strengths in speed, accuracy, and specific script recognition (e.g., handwriting).

Recommendations:
* Priority: Accuracy: Choose PP-OCRv4 (server version) for most accurate text recognition across languages.
* Priority: Speed: Choose PP-OCRv4 (mobile version) for fast inference on mobile devices or other edge devices.
* Limited resources: Consider PP-OCRv3 or specific detection/recognition models based on your needs.
* Specific language or script: Investigate models trained for those languages, like RARE for handwriting recognition.

For further guidance, here are some resources:
* PaddleOCR Model Zoo: https://github.com/PaddlePaddle/Paddle2ONNX/blob/develop/docs/en/model_zoo.md
* PaddleOCR Models List: https://github.com/PaddlePaddle/PaddleOCR
* PaddleOCR Quickstart: https://github.com/PaddlePaddle/PaddleOCR

Remember, the best model depends on your specific context. Testing different models and comparing their performance on your datasets can help you make the best choice.

---

Q: How do I run pp-ocrv4 in server mode?

---

Here are the steps on how to run PP-OCRv4 in server mode:

1. Installation:

* Ensure you have PaddlePaddle installed. Follow the official installation guide for your environment: https://www.paddlepaddle.org.cn/install/quick: https://www.paddlepaddle.org.cn/install/quick
* Install PaddleOCR:
```bash
```pip install paddleocr

2. Download Models:

* Download the server model of PP-OCRv4:
```bash
mkdir -p ~/.paddleocr/server/models
wget https://paddleocr.bj.bcebos.com/PP-OCRv4/chinese/ch_PP-OCRv4_server_infer.tar -P ~/.paddleocr/server/models
tar -xf ~/.paddleocr/server/models/ch_PP-OCRv4_server_infer.tar -C ~/.paddleocr/server/models
```

3. Start Server:

* Launch the server:
```bash
paddleocr --det model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_det_infer \
          --rec model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_rec_infer \
          --cls model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_cls_infer \
          --use_angle_cls true --server_port 8868
```

4. Send Requests:

* Use a client or HTTP requests to send images to the server. Example with curl:
```bash
curl -X POST -F "image=@test.jpg" http://127.0.0.1:8868/ocr/v1/accurate
```

Additional Notes:
* Languages: If using a language other than Chinese, download the appropriate model from the PaddleOCR Model Zoo.
* CPU: For CPU-only inference, add `--use_gpu false` to the server command.
* Customization: Refer to PaddleOCR's documentation for configuration options, model customization, and deployment.
* GPU: If using GPU, ensure you have CUDA and cuDNN installed.
* Port: Customize `--server_port` if needed.
* Image Paths: Adjust the image path in the curl command as needed.
profile picture

---

Q: How can I run the server model locally?

---

To run the PP-OCRv4 server model locally, follow these steps:

1. Installation and Model Download:

* Install PaddlePaddle: Follow the official instructions for your environment: https://www.paddlepaddle.org.cn/install/quick
* Install PaddleOCR: `pip install paddleocr`
* Download Server Model:
* Create a directory: `mkdir -p ~/.paddleocr/server/models`
* Download the model: `wget https://paddleocr.bj.bcebos.com/PP-OCRv4/chinese/ch_PP-OCRv4_server_infer.tar -P ~/.paddleocr/server/models`
* Extract the model: `tar -xf ~/.paddleocr/server/models/ch_PP-OCRv4_server_infer.tar -C ~/.paddleocr/server/models`

2. Start the Server:

Open a terminal and run:
```bash
paddleocr --det model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_det_infer \
          --rec model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_rec_infer \
          --cls model_name=ch_PP-OCRv4_server_infer/ch_PP-OCRv4_cls_infer \
          --use_angle_cls true --server_port 8868
```

This starts the OCR server on your local machine, listening on port 8868.

3. Send Requests:

Use a client or HTTP requests to send images for OCR. Example with curl:

```bash
curl -X POST -F "image=@test.jpg" http://127.0.0.1:8868/ocr/v1/accurate
```

Replace `test.jpg` with the path to your image.

Key Points:
* Languages: If using languages other than Chinese, download appropriate models from the PaddleOCR Model Zoo.
* CPU Usage: For CPU-only inference, add --use_gpu false to the server command.
* GPU Usage: If using GPU, ensure CUDA and cuDNN are installed.
* Port: Customize --server_port if needed.
* Documentation: Refer to PaddleOCR's documentation for more configuration options, customization, and deployment.

---

Q: How can I run the server model in python?

---

While you can't directly run the server model in pure Python, here's how to integrate it using HTTP requests:

1. Set Up Server:

Follow the steps in the previous responses to start the server using the command-line interface.

2. Python Client Code:

```python
import requests

url = "http://127.0.0.1:8868/ocr/v1/accurate"  # Server address and endpoint
image_path = "test.jpg"  # Path to your image

with open(image_path, "rb") as f:
    img_data = f.read()

response = requests.post(url, files={"image": img_data})

if response.status_code == 200:
    results = response.json()
    for result in results:
        text = result["data"]
        print(text)
else:
    print("OCR request failed with status code:", response.status_code)
```

Explanation:

* Import requests: Library for making HTTP requests.
* Set URL and image path: Point to the server's endpoint and your image.
* Read image data: Open the image in binary mode and read its contents.
* Send POST request: Send an HTTP POST request to the server with the image data.
* Check response: If successful (status code 200), parse the JSON response containing OCR results.
* Print text: Iterate through the results and print the extracted text.
* Handle errors: If the request fails, print the status code.

Remember:
* Ensure the server is running before executing the Python code.
* Adjust the URL and image path accordingly.
* For non-Chinese languages, use appropriate server model paths.
* Explore PaddleOCR's documentation for more advanced usage and customization.
profile picture

---

Q: How can I run the server mode model with pdfs?

---

PaddleOCR's server model accepts images, not PDFs directly. To process PDFs:

1. Extract Images:
* Python Libraries: Use libraries like PyMuPDF or pdf2image to extract images from PDF pages:

```python
import fitz  # PyMuPDF

doc = fitz.open("my_pdf.pdf")
for page_index in range(len(doc)):
    page = doc[page_index]
    pix = page.get_pixmap()
    pix.save("page_{}.jpg".format(page_index))  # Save as JPEG
```

2. Process Images:

Send each extracted image to the server model using the provided Python code or curl:

```python
import requests

url = "http://127.0.0.1:8868/ocr/v1/accurate"
image_path = "page_1.jpg"  # Example image path
# ... (rest of the code to send the request and process results)
```

3. Combine Results:

Aggregate text results from each image to reconstruct the overall text content of the PDF.
Alternative: Client-Side Processing:

For flexibility and control, consider using PaddleOCR's Python API for client-side processing:

```python
import paddleocr
# ... (initialize PaddleOCR with model paths)

ocr = paddleocr.PaddleOCR(lang="ch")  # Example for Chinese
with open("my_pdf.pdf", "rb") as f:
    pdf_data = f.read()
    text = ocr.ocr(pdf_data)  # Directly process PDF data
```

Remember:

* Adapt code for your specific language models and PDF handling needs.
* Consider error handling and PDF structure for accurate text extraction.
profile picture
* Does the client-side API give best results? Or should I use the server-side API for best results?
* Here's a comparison of client-side and server-side APIs for PaddleOCR, considering accuracy and other factors:

Accuracy:
* Server-side models: Often larger and more accurate, especially for PP-OCRv4. They can handle complex text scenarios and diverse languages better.
* Client-side models: May be slightly less accurate but prioritize speed and efficiency.

Other Factors:
* Hardware: Server-side models typically run on powerful servers with GPUs for faster processing. Client-side models rely on device hardware, which can limit performance for larger images or heavy workloads.
* Network Latency: Client-side processing avoids network delays, ensuring faster response times. Server-side processing adds network overhead, which can impact speed if the server is remote or the network is slow.
* Privacy: Client-side processing keeps sensitive data within the device, enhancing privacy. Server-side processing involves sending data to a server, raising privacy concerns.
* Customization: Client-side APIs offer more control over model selection, configuration, and integration with other tools. Server-side APIs may have limited customization options, depending on the setup.

Choosing the Best Approach:

* Prioritize accuracy: Choose the server-side API, especially for PP-OCRv4 and complex text recognition tasks.
* Prioritize speed and offline usage: Choose the client-side API.
* Prioritize privacy: Choose the client-side API.
* Need real-time processing or limited network connectivity: Choose the client-side API.
* Need advanced customization and control: Choose the client-side API.

Recommendations:
* Experiment: Test both approaches with your specific use cases to determine the best fit.
* Consider hybrid approaches: For flexibility, consider using client-side API for initial processing and server-side API for accuracy-critical tasks or large-scale processing.

---

Q: What GPU is required for the server-side model?

---

While using a GPU can significantly improve the speed of PaddleOCR's server-side model, especially PP-OCRv4, it's not strictly required. You can also run the model on CPU, although you'll experience slower inference times.

GPU Recommendations:
* For optimal performance: Use an NVIDIA GPU with at least 8GB of memory. High-end cards like the RTX 3080 or A100 can offer significant speed boosts.
* Mid-range GPUs: Cards like the RTX 2080 or RTX 3060 can provide good performance while being more affordable.
* Lower-end GPUs: Even GPUs with 4GB of memory, like the GTX 1660 Ti, can offer some speedup compared to CPU-only inference.

Factors to Consider:
* Model size: Larger models like PP-OCRv4 benefit more from a powerful GPU.
* Batch size: Processing multiple images simultaneously demands more GPU memory.
Workload: If you have high-volume OCR tasks, a powerful GPU is more crucial.
* Alternatives:
  * CPU: If you can't use a GPU or prioritize lower cost, CPU-only inference is still possible, especially for smaller models or moderate workloads.
  * Cloud GPUs: Consider cloud platforms like Google Cloud or Amazon Web Services that offer on-demand access to powerful GPUs for specific tasks.

Remember:
* Choose a GPU based on your budget, needs, and workload.
* Test different hardware and configurations to find the optimal balance between performance and cost.
* Refer to PaddleOCR documentation for specific hardware compatibility and resource usage information.

I hope this helps you choose the right GPU for your PaddleOCR server-side model!