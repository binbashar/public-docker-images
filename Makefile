.PHONY: help
SHELL := /bin/bash

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'


init-makefiles: ## initialize makefiles
	rm -rf ./@bin/makefiles
	mkdir -p ./@bin/makefiles
	git clone https://github.com/binbashar/le-dev-makefiles.git ./@bin/makefiles/
	echo "" >> ./Makefile
	sed -i '/^#include.*/s/^#//' ./Makefile

#
## IMPORTANT: Automatically managed -> don't uncomment this line
#
#include ./@bin/makefiles/circleci/circleci.mk
#include ./@bin/makefiles/release-mgmt/release.mk







