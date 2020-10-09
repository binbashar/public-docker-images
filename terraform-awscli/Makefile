.PHONY: build
SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG       := 0.13.2
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := terraform-awscli

LOCAL_OS_AWS_CONF_DIR := ~/.aws/bb
AWS_REGION            := us-east-1
AWS_IAM_PROFILE       := bb-apps-devstg-devops

define AWSCLI_CMD_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define AWSCLI_CMD_BASH_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
--entrypoint=bash ${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG}
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

# aws-cli
#
run-awscli-bash: ## docker run bash
	${AWSCLI_CMD_BASH_PREFIX}

run-awscli-version: ## docker run awscli version command
	${AWSCLI_CMD_PREFIX} --version

run-awscli: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version
	${AWSCLI_CMD_PREFIX} ec2 describe-instances --region ${AWS_REGION} --profile ${AWS_IAM_PROFILE}

# go & terraform
#
run-go-version: ## docker run go version
	docker run -it --rm --entrypoint=/usr/local/go/bin/go \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-go-env: ## docker run go env
	docker run -it --rm --entrypoint=/usr/local/go/bin/go \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} env

run-dep-version: ## docker run dep version
	docker run -it --rm --entrypoint=dep \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-python-version: ## docker run python --version
	docker run -it --rm --entrypoint=/usr/bin/python \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-terraform-version: ## docker run terraform --version
	docker run -it --rm --entrypoint=/usr/local/go/bin/terraform \
	${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-all: run-go-version run-go-env run-dep-version run-python-version run-terraform-version

test: run-awscli-version run-all ## ci docker image tests

