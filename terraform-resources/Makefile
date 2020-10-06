.PHONY: build
DOCKER_TAG = 0.13.2
DOCKER_IMG_NAME = terraform-resources

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#
# docker build & push
#
build: ## build docker image
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}  && docker push binbash/${DOCKER_IMG_NAME}:latest

#
# docker run tests
#
run-go-version: ## docker run go version
	docker run -it --rm binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-go-env: ## docker run go env
	docker run -it --rm binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} env

run-dep-version: ## docker run dep version
	docker run -it --rm --entrypoint=dep binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-terraform-version: ## docker run terraform --version
	docker run -it --rm --entrypoint=/usr/local/go/bin/terraform binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version
