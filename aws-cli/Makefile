.PHONY: build
DOCKER_TAG = 1.16.265
DOCKER_IMG_NAME = aws-cli

LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_AWS_CONF_DIR := ~/.aws

AWS_REGION := us-east-1
AWS_IAM_PROFILE := bb-dev-devops

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

build: ## build docker image
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest .

test-run-awscli-bash: ## docker run bash
	${AWSCLI_CMD_BASH_PREFIX}

test-run-awscli: ## docker run awscli commands
	${AWSCLI_CMD_PREFIX} --version
	${AWSCLI_CMD_PREFIX} ec2 describe-instances --region ${AWS_REGION} --profile ${AWS_IAM_PROFILE}

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} && docker push binbash/${DOCKER_IMG_NAME}:latest