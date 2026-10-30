FROM python:3.12-slim
WORKDIR /app
COPY app.py .
ENV API_TOKEN=DEMO_ONLY_NOT_A_REAL_SECRET
EXPOSE 8080
CMD ["python", "app.py"]
