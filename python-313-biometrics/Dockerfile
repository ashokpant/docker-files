# syntax=docker/dockerfile:1.7

FROM python:3.13-slim

LABEL maintainer="ashok@treeleaf.ai"
LABEL version="1.0.0"
LABEL vendor="Ashok"

WORKDIR /base

RUN apt-get update && apt-get install -y --no-install-recommends \
    git ca-certificates \
    build-essential \
    libgomp1 libxcb1 libgl1 libglx0 \
    libxext6 libsm6 libglib2.0-0 \
    patchelf \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

ENV VIRTUAL_ENV=/opt/venv
RUN uv venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN uv pip install --upgrade pip setuptools wheel

# default env flags
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1