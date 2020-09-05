.PHONY: build
DOCKER_IMG_NAME = terraform-awscli-terratest-slim
DOCKER_IMG_TAG = 0.13.2

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: ## build docker image
	DOCKER_BUILDKIT=1 docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} .

build-no-cache: ## build docker image no cache
	DOCKER_BUILDKIT=1 docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} .

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}
