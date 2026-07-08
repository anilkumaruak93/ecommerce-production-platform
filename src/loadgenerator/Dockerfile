# ============================================================
# Load Generator — Production Runtime Image
# ============================================================
FROM python:3.13-slim

WORKDIR /app

ENV PYTHONUNBUFFERED=1

COPY requirements.txt ./

RUN pip install \
    --no-cache-dir \
    --disable-pip-version-check \
    -r requirements.txt

COPY locustfile.py ./

USER 10001:10001

ENTRYPOINT ["locust"]

CMD ["-f", "locustfile.py", "--headless"]
