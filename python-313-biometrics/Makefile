IMAGE ?= ashokpant/python-313-biometrics:latest
PLATFORMS ?= linux/amd64,linux/arm64

.PHONY:build-multi
build-multi:
	DOCKER_BUILDKIT=1 docker buildx build --platform $(PLATFORMS) -t $(IMAGE) .

.PHONY: build
build: build-multi

.PHONY: push
push: 	docker push $(IMAGE)