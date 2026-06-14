IMAGE ?= ashokpant/python-313-biometrics-service:latest
PLATFORMS ?= linux/amd64

.PHONY: build push

build:
	DOCKER_BUILDKIT=1 docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMAGE) \
		--load \
		.

push:
	DOCKER_BUILDKIT=1 docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMAGE) \
		--push \
		.
