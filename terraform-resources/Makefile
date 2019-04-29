.PHONY: build
DOCKER_TAG = 0.12.0-beta2

build:
	docker build -t binbash/terraform-resources:${DOCKER_TAG} -t binbash/terraform-resources:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

build-no-cache:
	docker build --no-cache -t binbash/terraform-resources:${DOCKER_TAG} -t binbash/terraform-resources:latest --build-arg TERRAFORM_VERSION='${DOCKER_TAG}' .

push:
	docker push binbash/terraform-resources:${DOCKER_TAG}  && docker push binbash/terraform-resources:latest
