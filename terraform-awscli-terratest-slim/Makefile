.PHONY: build
SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG       := 0.13.2
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := terraform-awscli-terratest-slim

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# INITIALIZATION                                               #
#==============================================================#
init-makefiles: ## initialize makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/binbashar/le-dev-makefiles.git ${MAKEFILES_DIR}

-include ${MAKEFILES_DIR}/docker/docker-hub-build-push-single-arg.mk

# terraform & python
#
run-go-version: ## docker run go version
	docker run -it --rm --entrypoint=go \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-go-env: ## docker run go env
	docker run -it --rm --entrypoint=go \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} env

run-dep-version: ## docker run dep version
	docker run -it --rm --entrypoint=dep \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-python-version: ## docker run python --version
	docker run -it --rm --entrypoint=python3 \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-terraform-version: ## docker run terraform --version
	docker run -it --rm --entrypoint=terraform \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

test: run-go-version run-go-env run-dep-version run-python-version run-terraform-version ## ci docker image tests

