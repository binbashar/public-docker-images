.PHONY: build

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#
# docker build & push
#
build: ## build docker image
	cd example-test && make build

build-no-cache: ## build docker image no cache
	cd example-test && make build-no-cache

push: ## push docker image to registry
	cd example-test && make push

#
# docker run tests
#
test-yarn-run-serve: ## docker run yarn serve
	cd example-test && make test-yarn-run-serve

test-yarn-build-nginx: ## docker run yarn build + nginx container
	cd example-test && make test-yarn-build-nginx
