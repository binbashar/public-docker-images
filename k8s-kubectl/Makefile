.PHONY: build
SHELL            := /bin/bash
MAKEFILE_PATH    := ./Makefile
MAKEFILES_DIR    := ../@bin/makefiles

define DOCKER_TAG_LIST
"v1.15.1" \
"v1.16.13" \
"v1.17.9" \
"v1.17.12" \
"v1.18.9"
endef

DOCKER_REPO_NAME := binbash
DOCKER_IMG_NAME  := k8s-kubectl

LOCAL_OS_KUBE_DIR := ~/.kube
LOCAL_OS_MINIKUBE_DIR := ~/.minikube
LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_HOME_DIR_ESCAPED := \\/home\\/${LOCAL_OS_USER}
DOCKER_IMG_USER = root
K8S_CONTEXT := minikube_${DOCKER_TAG}
K8S_KUBECTL_CONFIG_FILE_NAME := config
K8S_KUBECTL_CONFIG_FILE_PATH := /${DOCKER_IMG_USER}/.kube/config

define K8S_KUBECTL_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTL_CMD_BASH_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=bash binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

help:
	@echo 'Available Commands:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf " - \033[36m%-18s\033[0m %s\n", $$1, $$2}'

#==============================================================#
# INITIALIZATION                                               #
#==============================================================#
init-makefiles: ## initialize makefiles
	rm -rf ${MAKEFILES_DIR}
	mkdir -p ${MAKEFILES_DIR}
	git clone https://github.com/binbashar/le-dev-makefiles.git ${MAKEFILES_DIR}

-include ${MAKEFILES_DIR}/docker/docker-hub-build-push-tag-list-single-arg.mk

test-run-kubectl-bash: ## docker run bash
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTL_CMD_BASH_PREFIX}
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl: ## docker run kubectl commands
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} version
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} config --kubeconfig=/${DOCKER_IMG_USER}/.kube/${K8S_KUBECTL_CONFIG_FILE_NAME} view --minify
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get nodes
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get svc
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get pods --all-namespaces
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get pods --namespace=kube-system
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl-minikube: ## docker run kubectl commands on minikube
	@echo ''
	minikube start --profile ${K8S_CONTEXT} --kubernetes-version ${DOCKER_TAG} --vm-driver virtualbox --cpus 4 --memory 12288
	@echo ''
	minikube --profile ${K8S_CONTEXT} status
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} version
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} config --kubeconfig=/${DOCKER_IMG_USER}/.kube/${K8S_KUBECTL_CONFIG_FILE_NAME} view --minify
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get nodes
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get svc
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get pods --all-namespaces
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8S_CONTEXT} get pods --namespace=kube-system
	@echo ''
	minikube stop --profile ${K8S_CONTEXT}
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl-minikube-delete: # deletes testing minikube cluster
	minikube delete --profile ${K8S_CONTEXT}
