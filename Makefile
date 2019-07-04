.PHONY: help
SHELL := /bin/bash
LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_SSH_DIR := ~/.ssh
LOCAL_OS_GIT_CONF_DIR := ~/.gitconfig

PWD_DIR := $(shell pwd)

# pre-req -> https://github.com/pnikosis/semtag
define GIT_SEMTAG_CMD_PREFIX
docker run --rm \
-v ${PWD_DIR}:/data:rw \
-v ${LOCAL_OS_SSH_DIR}:/root/.ssh \
-v ${LOCAL_OS_GIT_CONF_DIR}:/etc/gitconfig \
--entrypoint=/opt/semtag/semtag/semtag \
-it binbash/git-release
endef

GIT_SEMTAG_VER := $(shell ${GIT_SEMTAG_CMD_PREFIX} final -s minor)

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

release: ## releasing based on semantic tagging script for Git
	# pre-req -> https://github.com/pnikosis/semtag
	${GIT_SEMTAG_CMD_PREFIX} --version
	${GIT_SEMTAG_CMD_PREFIX} get
	${GIT_SEMTAG_CMD_PREFIX} final -s minor

changelog-init: ## git changelog (https://github.com/git-chglog/git-chglog) config initialization -> ./.chglog
	@if [ ! -d ./.chglog ]; then\
		docker run --rm -v ${PWD_DIR}:/data -it binbash/git-release --init;\
		sudo chown -R ${LOCAL_OS_USER}:${LOCAL_OS_USER} ./.chglog;\
    else\
		echo "==============================";\
    	echo "git-chglog already initialized";\
    	echo "==============================";\
    	echo "$$(ls ./.chglog)";\
    	echo "==============================";\
    fi

changelog: ## git changelog (https://github.com/git-chglog/git-chglog)
	docker run --rm -v ${PWD_DIR}:/data -it binbash/git-release -o CHANGELOG.md --next-tag ${GIT_SEMTAG_VER}
	sudo chown -R ${LOCAL_OS_USER}:${LOCAL_OS_USER} ./.chglog
	sudo chown -R ${LOCAL_OS_USER}:${LOCAL_OS_USER} ./CHANGELOG.md

