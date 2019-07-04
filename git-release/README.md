# git release automation with git-chglog and semtag

#### git-chglog
CHANGELOG generator implemented in Go (Golang). Anytime, anywhere, Write your CHANGELOG.

- Official **git-chglog** [documentation available on GitHub project repo](https://github.com/git-chglog/git-chglog).

#### semtag
Semantic Tagging Script for Git. This is a script to help out version bumping on a project following the Semantic Versioning specification. It uses Git Tags to keep track the versions and the commit log between them, so no extra files are needed. It can be combined with release scripts, git hooks, etc, to have a consistent versioning.

- Official **semtag** [documentation available on GitHub project repo](https://github.com/pnikosis/semtag).


## Docker Usage

### git-chglog
Build the docker image using provided Dockerfile and use it directly:

```bash
docker run -it --rm -v "$PWD:/data" binbash/git-chglog
```

Alternatively create an alias in your ~/.bashrc by copying the line below

```bash
alias git-changelog='docker run -it --rm -v "$PWD:/data" binbash/git-chglog'
```

#### Example git-chglog
`docker run -it --rm -v "$PWD:/data" binbash/git-chglog --init`

Then

`docker run -it --rm -v "$PWD:/data" binbash/git-chglog -o CHANGELOG.md`

### semtag
Build the docker image using provided Dockerfile and use it directly:

```bash
export LOCAL_OS_SSH_DIR="~/.ssh"
export LOCAL_OS_GIT_CONF_DIR="~/.gitconfig"

docker run --rm -v $PWD:/data:rw \
-v $LOCAL_OS_SSH_DIR:/root/.ssh \
-v $LOCAL_OS_GIT_CONF_DIR:/etc/gitconfig \
--entrypoint=/opt/semtag/semtag/semtag \
-it binbash/git-release
```

**NOTE:** Alternatively create an alias in your ~/.bashrc with the command presented above.

#### Example semtag
```bash
export LOCAL_OS_SSH_DIR="~/.ssh"
export LOCAL_OS_GIT_CONF_DIR="~/.gitconfig"

docker run --rm -v $PWD:/data:rw \
-v $LOCAL_OS_SSH_DIR:/root/.ssh \
-v $LOCAL_OS_GIT_CONF_DIR:/etc/gitconfig \
--entrypoint=/opt/semtag/semtag/semtag \
-it binbash/git-release get
```

### Example composing both `git-chglog` & `semtag` in a `Makefile`

```makefile
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
```