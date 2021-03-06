.PHONY: build
SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG       := 1.18.154
DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := aws-cli

LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_AWS_CONF_DIR := ~/.aws/bb

AWS_REGION := us-east-1
AWS_IAM_PROFILE := bb-dev-devops

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

test-run-awscli-bash: ## docker run bash
	${AWSCLI_CMD_BASH_PREFIX}

test-run-awscli-ver: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version

test-run-awscli: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version
	${AWSCLI_CMD_PREFIX} ec2 describe-instances --region ${AWS_REGION} --profile ${AWS_IAM_PROFILE}

test: test-run-awscli-ver ## ci docker image tests
