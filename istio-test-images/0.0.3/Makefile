IMAGE = registry.demoonair.com/istio-test
TAG   = 0.0.3

.PHONY: build
build:
	@docker build  --no-cache -t $(IMAGE):$(TAG) .

.PHONY: push
push:
	@docker push $(IMAGE):$(TAG)
