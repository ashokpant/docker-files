DOCKERHUB ?= ashokpant
TAG ?= latest

ifndef FOLDER
$(error FOLDER is required. Example: make build FOLDER=fastapi-api)
endif

IMAGE_NAME := $(notdir $(abspath $(FOLDER)))
FULL_IMAGE := $(DOCKERHUB)/$(IMAGE_NAME):$(TAG)

.PHONY: build push run clean

build:
	docker build -t $(FULL_IMAGE) $(FOLDER)

push: build
	docker push $(FULL_IMAGE)

run:
	docker run --rm -it $(FULL_IMAGE) bash

clean:
	docker rmi $(FULL_IMAGE) || true