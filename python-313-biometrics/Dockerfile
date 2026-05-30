# syntax=docker/dockerfile:1.7

FROM python:3.11-slim-bookworm

LABEL maintainer="ashok@treeleaf.ai"

WORKDIR /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    VIRTUAL_ENV=/opt/venv \
    PATH="/opt/venv/bin:/usr/local/bin"

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    git \
    build-essential \
    patchelf \
    libgomp1 \
    libglib2.0-0 \
    libgl1 \
    libsm6 \
    libxext6 \
    libxcb1 \
    && rm -rf /var/lib/apt/lists/*

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

RUN uv venv $VIRTUAL_ENV \
    && uv pip install --python $VIRTUAL_ENV/bin/python -U pip setuptools wheel

COPY pyproject.toml uv.lock ./

RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

COPY . .

CMD ["python", "-m", "app"]