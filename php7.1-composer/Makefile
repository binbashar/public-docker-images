.PHONY: build
DOCKER_TAG = 0.0.1

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: # build docker image
	docker build -t binbash/php7.1-composer:${DOCKER_TAG} -t binbash/php7.1-composer:latest .

build-no-cache: # build docker image no cache
	docker build --no-cache -t binbash/php7.1-composer:${DOCKER_TAG} -t binbash/php7.1-composer:latest .

push: # push docker image to registry
	docker push binbash/php7.1-composer:${DOCKER_TAG} && docker push binbash/php7.1-composer:latest
