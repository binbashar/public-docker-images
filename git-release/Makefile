.PHONY: build
DOCKER_TAG = 0.0.2
DOCKER_IMG_NAME = git-release
DOCKER_PWD_DIR := $(shell pwd)
DOCKER_SEMTAG_CMD := /opt/semtag/semtag/semtag

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: ## build docker image
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest .

run-git-chglog: ## docker run git-chglog
	docker run -it --rm -v "${DOCKER_PWD_DIR}:/data" binbash/git-release --version

run-git-semtag: ## docker run semtag
	docker run -it --rm -v "${DOCKER_PWD_DIR}:/data" --entrypoint=${DOCKER_SEMTAG_CMD} binbash/git-release --version

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} && docker push binbash/${DOCKER_IMG_NAME}:latest
