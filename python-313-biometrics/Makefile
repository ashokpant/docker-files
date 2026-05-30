IMAGE_NAME ?= python-313-biometrics
REGISTRY ?= docker.io
USERNAME ?= ashokpant
TAG ?= latest

FULL_IMAGE := $(REGISTRY)/$(USERNAME)/$(IMAGE_NAME):$(TAG)

.PHONY: build push release run clean

build:
	docker build -t $(FULL_IMAGE) .

push:
	docker push $(FULL_IMAGE)

release: build push

run:
	docker run --rm -it $(FULL_IMAGE)

clean:
	docker rmi $(FULL_IMAGE) || true

update-dependencies:
	uv lock
	uv sync

upgrade-dependencies:
	uv lock --upgrade
	uv sync