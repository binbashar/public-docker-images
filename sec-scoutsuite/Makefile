.PHONY: build

SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

DOCKER_TAG         := 5.10.0
DOCKER_REPO_NAME   := binbash
DOCKER_IMG_NAME    := sec-scoutsuite
DOCKER_REPORT_PATH := /report/scoutsuite-report

LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_AWS_CONF_DIR := ~/.aws/bb
LOCAL_OS_AWS_SCOUT_REPORT := ~/scoutsuite-report

AWS_REGION := us-east-1
AWS_IAM_PROFILE := default

define SCOUTSUITE_CMD_PREFIX
docker run -it --rm \
--name ${DOCKER_IMG_NAME} \
-v ${LOCAL_OS_AWS_CONF_DIR}:/root/.aws \
-v ${LOCAL_OS_AWS_SCOUT_REPORT}:${DOCKER_REPORT_PATH} \
-e "AWS_DEFAULT_REGION=us-east-1" \
${DOCKER_REPO_NAME}/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define SCOUTSUITE_CMD_BASH_PREFIX
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

test-run-scoutsuite-bash: ## docker run bash
	${SCOUTSUITE_CMD_BASH_PREFIX}
	#docker cp sec-scoutsuite:/report/scoutsuite-report ${LOCAL_OS_AWS_SCOUT_REPORT}

test-run-scoutsuite-version: ## docker run scoutsuite commands
	${SCOUTSUITE_CMD_PREFIX} -v

test-run-scoutsuite: ## docker run scoutsuite commands
	${SCOUTSUITE_CMD_PREFIX} -v
	${SCOUTSUITE_CMD_PREFIX} aws --force --regions ${AWS_REGION} --profile ${AWS_IAM_PROFILE}
	sudo chown -R ${LOCAL_OS_USER}:${LOCAL_OS_USER} ${LOCAL_OS_AWS_SCOUT_REPORT}

test: test-run-scoutsuite-version ## ci docker image tests

