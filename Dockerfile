# Use a lightweight Python image
FROM python:3.9-slim

# Set working directory inside the container
WORKDIR /app

# Copy requirements file and install dependencies
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# Copy your code and model into the container
COPY app/app.py ./app.py
COPY model ./model

# Expose the default Gradio port
EXPOSE 7860

# Run the app
CMD ["python", "app.py"]
