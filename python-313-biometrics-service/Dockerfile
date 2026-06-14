# syntax=docker/dockerfile:1.7
#
# Base image for biometrics-poc-service.
# Pre-installs Python 3.13 runtime deps into /app/.venv for fast app image builds.

FROM python:3.13-slim-trixie AS builder

LABEL maintainer="ashok@treeleaf.ai"

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    UV_LINK_MODE=copy \
    UV_COMPILE_BYTECODE=1 \
    UV_INSTALL_DIR=/usr/local/bin \
    VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:/usr/local/bin:/usr/bin:/bin"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && uv --version

RUN uv venv "${VIRTUAL_ENV}"

WORKDIR /build
COPY requirements.txt .

RUN --mount=type=cache,target=/root/.cache/uv \
    uv pip install --python "${VIRTUAL_ENV}/bin/python" -r requirements.txt

RUN "${VIRTUAL_ENV}/bin/python" -c "\
import boto3, cv2, fastapi, grpclib, numpy, pgvector, psycopg, pydantic, sqlalchemy, uvicorn; \
import betterproto2; \
print('biometrics-service base deps OK')"

FROM python:3.13-slim-trixie

LABEL org.opencontainers.image.title="python-313-biometrics-service" \
      org.opencontainers.image.description="Python 3.13 base image for biometrics-poc-service" \
      maintainer="ashok@treeleaf.ai"

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    VIRTUAL_ENV=/app/.venv \
    PATH="/app/.venv/bin:/usr/local/bin:/usr/bin:/bin"

# OpenCV headless runtime libraries only (no build toolchain in final image).
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    libgomp1 \
    libglib2.0-0 \
    libgl1 \
    libsm6 \
    libxext6 \
    libxcb1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY --from=builder /app/.venv /app/.venv

RUN useradd -m -u 1000 appuser \
    && chown -R appuser:appuser /app

USER appuser

CMD ["python", "--version"]
