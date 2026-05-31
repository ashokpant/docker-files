# syntax=docker/dockerfile:1.7

FROM python:3.13-slim-bookworm

LABEL maintainer="ashok@treeleaf.ai"

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1 \
    VIRTUAL_ENV=/opt/venv \
    UV_LINK_MODE=copy \
    PATH="/opt/venv/bin:/usr/local/bin:/usr/bin:/bin"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    build-essential \
    patchelf \
    libgomp1 \
    libglib2.0-0 \
    libgl1 \
    libsm6 \
    libxext6 \
    libxcb1 \
    && git lfs install \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN uv venv "${VIRTUAL_ENV}" \
    && uv pip install --python "${VIRTUAL_ENV}/bin/python" \
       --upgrade pip setuptools wheel

RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install --python "${VIRTUAL_ENV}/bin/python" \
        appdirs>=1.4.4 \
        numpy>=2.2.0 \
        numba>=0.65.0 \
        opencv-python-headless>=4.11.0 \
        onnxruntime>=1.21.0 \
        python-multipart>=0.0.29 \
        pydantic>=2.13.4 \
        fastapi \
        uvicorn \
        pytz>=2026.2 \
        requests \
        grpclib>=0.4.9 \
        protobuf>=6.31.1 \
        anyio>=4.13.0 \
        betterproto2[grpclib]>=0.10.0

WORKDIR /app