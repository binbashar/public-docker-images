.PHONY: build
DOCKER_TAG = 0.0.1

build:
	docker build -t binbash/php7.1-composer:${DOCKER_TAG} -t binbash/php7.1-composer:latest .

build-no-cache:
	docker build --no-cache -t binbash/php7.1-composer:${DOCKER_TAG} -t binbash/php7.1-composer:latest .

push:
	docker push binbash/php7.1-composer:${DOCKER_TAG} && docker push binbash/php7.1-composer:latest
