IMAGE ?= ashokpant/python-313-biometrics:latest
BIOMETRICS_PROCESSOR ?= ../../../treeleaf/biometrics-processor

.PHONY: build push export-requirements

export-requirements:
	$(MAKE) -C "$(BIOMETRICS_PROCESSOR)" export-public-requirements
	cp "$(BIOMETRICS_PROCESSOR)/requirements-public.txt" ./requirements.txt

build:
	DOCKER_BUILDKIT=1 docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)
