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

**NOTE:** Consider al the code and examples from the current repo `Makefile` for re-building and a minikube local K8s env approach
