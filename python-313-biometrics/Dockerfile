# syntax=docker/dockerfile:1.7

FROM python:3.13-slim-trixie

LABEL maintainer="ashok@treeleaf.ai"

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYO3_USE_ABI3_FORWARD_COMPATIBILITY=1 \
    VIRTUAL_ENV=/opt/venv \
    UV_LINK_MODE=copy \
    UV_VERSION=0.10.4 \
    UV_INSTALL_DIR=/usr/local/bin \
    PATH="/opt/venv/bin:/usr/local/bin:/usr/bin:/bin"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    git-lfs \
    build-essential \
    patchelf \
    curl \
    libgomp1 \
    libglib2.0-0 \
    libgl1 \
    libsm6 \
    libxext6 \
    libxcb1 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && uv --version

RUN uv venv "${VIRTUAL_ENV}"

WORKDIR /app
COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install --python "${VIRTUAL_ENV}/bin/python" -r requirements.txt

RUN "${VIRTUAL_ENV}/bin/python" -c "\
import fastapi, uvicorn, onnxruntime, cv2, numba, nbis, grpclib, pydantic; \
print('public runtime deps OK')"
