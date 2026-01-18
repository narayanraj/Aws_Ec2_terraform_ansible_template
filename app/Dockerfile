# Dockerfile for Flask web app
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
RUN chmod -R 755 /app
EXPOSE 5000
CMD ["python", "main.py"]
