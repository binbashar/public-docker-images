.PHONY: build
DOCKER_TAG = 0.12.0-beta2

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: # build docker image
	docker build -t binbash/terraform-resources:${DOCKER_TAG} -t binbash/terraform-resources:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

build-no-cache: # build docker image no cache
	docker build --no-cache -t binbash/terraform-resources:${DOCKER_TAG} -t binbash/terraform-resources:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

push: # push docker image to registry
	docker push binbash/terraform-resources:${DOCKER_TAG}  && docker push binbash/terraform-resources:latest
