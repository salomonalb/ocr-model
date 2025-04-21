FROM python:3.9-slim

WORKDIR /app

COPY model /app/model
COPY app/app.py /app/app.py
COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

CMD ["python", "app.py"]
