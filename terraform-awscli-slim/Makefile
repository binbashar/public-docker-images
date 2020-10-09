.PHONY: build
SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG       := 0.13.2
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := terraform-awscli-slim

LOCAL_OS_AWS_CONF_DIR := ~/.aws/bb
AWS_REGION            := us-east-1
AWS_IAM_PROFILE       := bb-apps-devstg-devops
AWS_DOCKER_ENTRYPOINT := aws

define AWSCLI_CMD_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
--entrypoint=${AWS_DOCKER_ENTRYPOINT} \
${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

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

#
# docker run tests
#

# awscli
#
run-awscli-version: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version

# terraform & python
#
run-python-version: ## docker run python --version
	docker run -it --rm --entrypoint=python3 \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-terraform-version: ## docker run terraform --version
	docker run -it --rm \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

test: run-awscli-version run-python-version run-terraform-version ## ci docker image tests

