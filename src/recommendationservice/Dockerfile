# ============================================================
# Recommendation Service - Production Docker Image
# ============================================================

FROM python:3.11-slim

WORKDIR /app

# Install Python dependencies first for Docker layer caching
COPY requirements.txt ./

RUN pip install \
    --no-cache-dir \
    --disable-pip-version-check \
    -r requirements.txt

# Copy application files
COPY recommendation_server.py ./
COPY logger.py ./
COPY demo_pb2.py ./
COPY demo_pb2_grpc.py ./

# Application configuration
ENV PYTHONUNBUFFERED=1

EXPOSE 8080

# Run as non-root user provided by the Python base image
USER nobody

CMD ["python", "recommendation_server.py"]