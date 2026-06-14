IMAGE ?= ashokpant/python-313-biometrics:latest
PLATFORMS ?= linux/amd64,linux/arm64

.PHONY: build push

build:
	DOCKER_BUILDKIT=1 docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMAGE) \
		.

push:
	DOCKER_BUILDKIT=1 docker buildx build \
		--platform $(PLATFORMS) \
		--tag $(IMAGE) \
		--push \
		.