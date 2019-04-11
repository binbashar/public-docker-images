.PHONY: build
terraform_version = 0.12.0-beta1

build:
	docker build -t binbash/terraform-resources:${terraform_version} --build-arg TERRAFORM_VERSION='${terraform_version}' .

push:
	docker push binbash/terraform-resources:${terraform_version}
