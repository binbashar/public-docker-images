.PHONY: build
DOCKER_TAG = 5.4.0
DOCKER_IMG_NAME = sec-scoutsuite
DOCKER_REPORT_PATH = /report/scoutsuite-report

LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_AWS_CONF_DIR := ~/.aws
LOCAL_OS_AWS_SCOUT_REPORT := ~/scoutsuite-report

AWS_REGION := us-east-1
AWS_IAM_PROFILE := default

define SCOUTSUITE_CMD_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-v ${LOCAL_OS_AWS_SCOUT_REPORT}:${DOCKER_REPORT_PATH} \
-e "AWS_DEFAULT_REGION=us-east-1" \
binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define SCOUTSUITE_CMD_BASH_PREFIX
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
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg SCOUTSUITE_VERSION='${DOCKER_TAG}' .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg SCOUTSUITE_VERSION='${DOCKER_TAG}' .

test-run-scoutsuite-bash: ## docker run bash
	${SCOUTSUITE_CMD_BASH_PREFIX}
	#docker cp sec-scoutsuite:/report/scoutsuite-report ${LOCAL_OS_AWS_SCOUT_REPORT}

test-run-scoutsuite: ## docker run scoutsuite commands
	${SCOUTSUITE_CMD_PREFIX} -v
	${SCOUTSUITE_CMD_PREFIX} aws --force --regions ${AWS_REGION} --profile ${AWS_IAM_PROFILE}
	sudo chown -R ${LOCAL_OS_USER}:${LOCAL_OS_USER} ${LOCAL_OS_AWS_SCOUT_REPORT}

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} && docker push binbash/${DOCKER_IMG_NAME}:latest