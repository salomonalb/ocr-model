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
ADD https://github.com/salomonalb/ocr-model/releases/download/v1.0/pytorch_model.bin ./model

# Expose Gradio's default port
EXPOSE 7860

# Run the Gradio app
CMD ["python", "app.py"]
