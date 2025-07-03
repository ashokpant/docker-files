FROM python:3.10

LABEL maintainer = "ashokpant@treeleaf.ai"
LABEL description="CV base image"
LABEL version="1.0"
LABEL vendor="Treeleaf"

ARG GIT_TOKEN
ARG GRPC_HEALTH_PROBE_VERSION=v0.4.19

ENV GRPC_HEALTH_PROBE_VERSION=$GRPC_HEALTH_PROBE_VERSION
ENV GIT_TOKEN $GIT_TOKEN


RUN wget -qO/bin/grpc_health_probe https://github.com/grpc-ecosystem/grpc-health-probe/releases/download/${GRPC_HEALTH_PROBE_VERSION}/grpc_health_probe-linux-amd64 && \
    chmod +x /bin/grpc_health_probe

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys FEEA9169307EA071
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B57C5C2836F4BEB
RUN apt-get update --allow-releaseinfo-change


RUN apt-get install build-essential libzbar-dev -y
RUN apt-get install -y libzbar0
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y
RUN pip install Cython

RUN pip3 install poetry
RUN poetry config virtualenvs.create false

WORKDIR /tmp
COPY pyproject.toml /tmp
COPY poetry.lock /tmp

RUN poetry install --no-dev

