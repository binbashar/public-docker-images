.PHONY: build
DOCKER_TAG = 2.174

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

build: ## build docker image
	docker build -t binbash/jenkins:${DOCKER_TAG} -t binbash/jenkins:latest .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/jenkins:${DOCKER_TAG} -t binbash/jenkins:latest .

push: ## push docker image to registry
	docker push binbash/jenkins:${DOCKER_TAG} && docker push binbash/jenkins:latest 
