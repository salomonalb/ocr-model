# Use a lightweight Python image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy your code and the model metadata (without the binary)
COPY app/app.py ./app.py
COPY model ./model

# Download the missing binary into the same model folder
RUN curl -L -H "Authorization: token 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" \
         -o /app/model/pytorch_model.bin \
         https://github.com/salomonalb/manga-ocr-model-and-client/releases/download/v1.0/pytorch_model.bin

# Expose Gradio's default port
EXPOSE 7860

# Run the Gradio app
CMD ["python", "app.py"]
