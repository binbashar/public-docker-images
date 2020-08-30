.PHONY: build
DOCKER_IMG_NAME = terraform-awscli-slim
DOCKER_IMG_TAG = 0.13.0
DOCKER_IMG_TAG_DEV = ${DOCKER_IMG_TAG}-dev
AWSCLI_VERSION = 1.18.126

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#
# docker build & push
#
build: ## build docker image
	DOCKER_BUILDKIT=1 docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} --build-arg AWSCLI_VERSION=${AWSCLI_VERSION} ./prd

build-no-cache: ## build docker image no cache
	DOCKER_BUILDKIT=1 docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} --build-arg AWSCLI_VERSION=${AWSCLI_VERSION} ./prd

build-dev: ## build dev docker image
	DOCKER_BUILDKIT=1 docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG_DEV} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} ./dev

build-dev-no-cache: ## build dev docker image
	DOCKER_BUILDKIT=1 docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG_DEV} --build-arg TERRAFORM_VERSION=${DOCKER_IMG_TAG} -f Dockerfile-dev ./dev

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG}

push-dev: ## push dev docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_IMG_TAG_DEV}
