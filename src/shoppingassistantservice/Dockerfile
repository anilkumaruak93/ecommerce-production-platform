# ============================================================
# Stage 1: Install Python dependencies
# ============================================================
FROM python:3.13-slim AS builder

WORKDIR /app

COPY requirements.txt ./

RUN pip install \
    --no-cache-dir \
    --disable-pip-version-check \
    --prefix=/install \
    -r requirements.txt

# ============================================================
# Stage 2: Create the production runtime image
# ============================================================
FROM python:3.13-slim AS runtime

WORKDIR /app

ENV PYTHONUNBUFFERED=1

COPY --from=builder /install /usr/local

COPY shoppingassistantservice.py ./

EXPOSE 8080

USER 10001:10001

CMD ["python", "shoppingassistantservice.py"]
