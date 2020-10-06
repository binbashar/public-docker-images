.PHONY: build
DOCKER_TAG = 0.13.2
DOCKER_IMG_NAME = terraform-awscli

LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_AWS_CONF_DIR := ~/.aws/bb-le

AWS_REGION := us-east-1
AWS_IAM_PROFILE := bb-apps-devstg-devops

define AWSCLI_CMD_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define AWSCLI_CMD_BASH_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-e "AWS_DEFAULT_REGION=us-east-1" \
--entrypoint=bash binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

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
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} && docker push binbash/${DOCKER_IMG_NAME}:latest

#
# docker run tests
#

# aws-cli
#
run-awscli-bash: ## docker run bash
	${AWSCLI_CMD_BASH_PREFIX}

run-awscli: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version
	${AWSCLI_CMD_PREFIX} ec2 describe-instances --region ${AWS_REGION} --profile ${AWS_IAM_PROFILE}

# go & terraform
#
run-go-version: ## docker run go version
	docker run -it --rm --entrypoint=/usr/local/go/bin/go \
	binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-go-env: ## docker run go env
	docker run -it --rm --entrypoint=/usr/local/go/bin/go \
	binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} env

run-dep-version: ## docker run dep version
	docker run -it --rm --entrypoint=dep \
	binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} version

run-python-version: ## docker run python --version
	docker run -it --rm --entrypoint=/usr/bin/python \
	binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-terraform-version: ## docker run terraform --version
	docker run -it --rm --entrypoint=/usr/local/go/bin/terraform \
	binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} --version

run-all: run-go-version run-go-env run-dep-version run-python-version run-terraform-version

