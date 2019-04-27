.PHONY: build
DOCKER_TAG = 2.174

build:
	docker build -t binbash/jenkins:${DOCKER_TAG} -t binbash/jenkins:latest .

build-no-cache:
	docker build --no-cache -t binbash/jenkins:${DOCKER_TAG} -t binbash/jenkins:latest .

push:
	docker push binbash/jenkins:${DOCKER_TAG} && docker push binbash/jenkins:latest 
