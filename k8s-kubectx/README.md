# k8s-kubectx

#### Fast way to switch between clusters and namespaces in kubectl with KubeCTX & KubeNS

**Official Project repo:** https://github.com/ahmetb/kubectx

## Features

This repository provides both `kubectx` and `kubens` tools.

**`kubectx`** helps you switch between clusters back and forth:
![kubectx demo GIF](https://github.com/ahmetb/kubectx/raw/v0.6.1/img/kubectx-demo.gif)

**`kubens`** helps you switch between Kubernetes namespaces smoothly:
![kubens demo GIF](https://github.com/ahmetb/kubectx/raw/v0.6.1/img/kubens-demo.gif)

## Docker Usage

Build the docker image using provided Dockerfile and use it directly for example in a local
minikube K8s cluster:

```bash
docker run -it --rm \
-v "$($HOME/.kube)":/root/.kube/ \
-v "$($HOME/.minikube)":/root/.minikube/ \
binbash/k8s-kubectx:v1.12.10
```

**NOTE:** Check docker image tags which will correspond with the proper K8s version you're currently running:
- DOCKER_TAG = `v1.11.xx`
- DOCKER_TAG = `v1.12.xx`
- DOCKER_TAG = `v1.13.xx`
- DOCKER_TAG = `v1.14.xx`
- DOCKER_TAG = `v1.15.xx`

### Test Execution

1. Interactively run the container
```bash
docker run -it --rm \
-v ~/.kube:/root/.kube \
-v ~/.minikube:/root/.minikube \
-e "KUBECONFIG=/root/.kube/config" \
--entrypoint=bash \
binbash/k8s-kubectx:v1.12.10
```

2. Test `kubectl` / `kubectx` / `kubens`
```
bash-5.0# kubectl config get-contexts
CURRENT   NAME                CLUSTER             AUTHINFO            NAMESPACE
          minikube_v1.11.10   minikube_v1.11.10   minikube_v1.11.10
*         minikube_v1.12.10   minikube_v1.12.10   minikube_v1.12.10   kube-system
          minikube_v1.13.8    minikube_v1.13.8    minikube_v1.13.8
          minikube_v1.14.4    minikube_v1.14.4    minikube_v1.14.4
          minikube_v1.15.1    minikube_v1.15.1    minikube_v1.15.1

bash-5.0# kubectx
minikube_v1.11.10
minikube_v1.12.10
minikube_v1.13.8
minikube_v1.14.4
minikube_v1.15.1

bash-5.0# kubectx minikube_v1.11.10
Switched to context "minikube_v1.11.10".

bash-5.0# kubectx minikube_v1.12.10
Switched to context "minikube_v1.12.10".

bash-5.0# kubens
default
kube-public
kube-system

bash-5.0# kubens kube-public
Context "minikube_v1.12.10" modified.
Active namespace is "kube-public".

bash-5.0# kubectl get pods
No resources found.

bash-5.0# kubens kube-system
Context "minikube_v1.12.10" modified.
Active namespace is "kube-system".

bash-5.0# kubectl get pods
NAME                               READY   STATUS    RESTARTS   AGE
coredns-bb49df795-cw7kl            1/1     Running   11         7d8h
coredns-bb49df795-rh6rb            1/1     Running   11         7d8h
etcd-minikube                      1/1     Running   0          47s
kube-addon-manager-minikube        1/1     Running   13         7d8h
kube-apiserver-minikube            1/1     Running   0          27s
kube-controller-manager-minikube   1/1     Running   0          37s
kube-proxy-p99pc                   1/1     Running   11         6d8h
kube-scheduler-minikube            1/1     Running   12         7d8h
```

### Example from the current repo `Makefile` for a minikube local K8s env

```makefile
.PHONY: build
#DOCKER_TAG := v1.11.10
DOCKER_TAG := v1.12.10
#DOCKER_TAG := v1.13.8
#DOCKER_TAG := v1.14.4
#DOCKER_TAG := v1.15.1

LOCAL_OS_KUBE_DIR := ~/.kube
LOCAL_OS_MINIKUBE_DIR := ~/.minikube
LOCAL_OS_USER := $(shell whoami)
LOCAL_OS_HOME_DIR_ESCAPED := \\/home\\/${LOCAL_OS_USER}
DOCKER_IMG_NAME = k8s-kubectx
DOCKER_IMG_USER = root
K8S_CONTEXT := minikube_${DOCKER_TAG}
K8S_KUBECTL_CONFIG_FILE_NAME := config
K8S_KUBECTL_CONFIG_FILE_PATH := /${DOCKER_IMG_USER}/.kube/config

define K8S_KUBE_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTX_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubectx binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBENS_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubens binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
endef

define K8S_KUBECTL_CMD_PREFIX
docker run -it --rm \
-v ${LOCAL_OS_KUBE_DIR}:/${DOCKER_IMG_USER}/.kube \
-v ${LOCAL_OS_MINIKUBE_DIR}:/${DOCKER_IMG_USER}/.minikube \
-e "KUBECONFIG=${K8S_KUBECTL_CONFIG_FILE_PATH}" \
--entrypoint=/usr/local/bin/kubectl binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}
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

build: ## build docker image
	docker build -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg K8S_VERSION='${DOCKER_TAG}' .

build-no-cache: ## build docker image no cache
	docker build --no-cache -t binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG} -t binbash/${DOCKER_IMG_NAME}:latest --build-arg K8S_VERSION='${DOCKER_TAG}' .

test-run-kubectx-bash: ## docker run bash
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTL_CMD_BASH_PREFIX}
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectx-kubens-cmds: ## docker run kubectx and kubens --help to test
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBE_CMD_PREFIX} kubectx --help && kubectl config get-contexts
	@echo ''
	${K8S_KUBE_CMD_PREFIX} kubens --help && kubectl get ns
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectx-kubens: ## test-run: docker run with kubectx and kubens overrided entrypoints.
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	${K8S_KUBECTX_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBECTX_CMD_PREFIX}
	${K8S_KUBECTX_CMD_PREFIX} ${K8S_CONTEXT}
	@echo ''
	${K8S_KUBENS_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBENS_CMD_PREFIX}
	${K8S_KUBENS_CMD_PREFIX} kube-system
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl: ## docker run kubectl commands
	@echo ''
	sed -i -e "s/${LOCAL_OS_HOME_DIR_ESCAPED}/\\/${DOCKER_IMG_USER}/g" ${LOCAL_OS_KUBE_DIR}/config
	@echo ''
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} version
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} config --kubeconfig=/${DOCKER_IMG_USER}/.kube/${K8S_KUBECTL_CONFIG_FILE_NAME} view --minify
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get nodes
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get svc
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --all-namespaces
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --namespace=kube-system
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl-kubectx-minikube: ## docker run kubectl, kubectx and kubens cmds on minikube
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
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get nodes
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get svc
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --all-namespaces
	@echo ''
	${K8S_KUBECTL_CMD_PREFIX} --context=${K8s_CONTEXT} get pods --namespace=kube-system
	@echo ''
	@echo '#===================='
	@echo '# KUBECTX + KUBENS  #'
	@echo '#===================='
	${K8S_KUBECTX_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBECTX_CMD_PREFIX}
	${K8S_KUBECTX_CMD_PREFIX} ${K8S_CONTEXT}
	@echo ''
	${K8S_KUBENS_CMD_PREFIX} --help
	@echo ''
	${K8S_KUBENS_CMD_PREFIX}
	${K8S_KUBENS_CMD_PREFIX} kube-system
	@echo''
	minikube stop --profile ${K8S_CONTEXT}
	@echo ''
	sed -i -e "s/\\/${DOCKER_IMG_USER}/${LOCAL_OS_HOME_DIR_ESCAPED}/g" ${LOCAL_OS_KUBE_DIR}/config

test-run-kubectl-minikube-delete: # deletes testing minikube cluster
	minikube delete --profile ${K8S_CONTEXT}

push: ## push docker image to registry
	docker push binbash/${DOCKER_IMG_NAME}:${DOCKER_TAG}  && docker push binbash/${DOCKER_IMG_NAME}:latest
```