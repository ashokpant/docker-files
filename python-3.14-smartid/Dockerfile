FROM python:3.12-slim

LABEL maintainer="ashok@treeleaf.ai"
LABEL version="1.0.0"
LABEL vendor="Ashok"

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    curl \
    vim \
    git \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade pip setuptools

WORKDIR /base
COPY requirements.txt /base/
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1
CMD ["python3"]
