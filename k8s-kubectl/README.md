# k8s-kubectl

#### Kubectl is a command line interface for running commands against Kubernetes clusters.

kubectl looks for a file named config in the $HOME/.kube directory. You can specify other kubeconfig files by setting the KUBECONFIG environment variable or by setting the --kubeconfig flag.

**Official Doc Links:**

- https://kubernetes.io/docs/tasks/tools/install-kubectl/
- https://kubernetes.io/docs/reference/kubectl/overview/
- https://kubernetes.io/docs/reference/kubectl/cheatsheet/

## Docker Usage

Build the docker image using provided Dockerfile and use it directly for example in a local
minikube K8s cluster:

```bash
docker run -it --rm \
-v "$($HOME/.kube)":/root/.kube/ \
-v "$($HOME/.minikube)":/root/.minikube/ \
binbash/k8s-kubectl:v1.12.10 get nodes
```

**NOTE:** Check docker image tags which will correspond with the proper K8s version you're currently running:
- DOCKER_TAG = `v1.11.xx`
- DOCKER_TAG = `v1.12.xx`
- DOCKER_TAG = `v1.13.xx`
- DOCKER_TAG = `v1.14.xx`
- DOCKER_TAG = `v1.15.xx`

### Test Execution

```bash
$ make test-run-kubectl-minikube

minikube start --profile minikube_v1.12.10 --kubernetes-version v1.12.10 --vm-driver virtualbox --cpus 4 --memory 12288
* [minikube_v1.12.10] minikube v1.3.0 on Linuxmint 18.3
* Using the running virtualbox "minikube_v1.12.10" VM ...
* Waiting for the host to be provisioned ...
* Preparing Kubernetes v1.12.10 on Docker 18.06.2-ce ...
* Relaunching Kubernetes using kubeadm ...
* Waiting for: apiserver proxy etcd scheduler controller dns
* Done! kubectl is now configured to use "minikube_v1.12.10"

minikube --profile minikube_v1.12.10 status
host: Running
kubelet: Running
apiserver: Running
kubectl: Correctly Configured: pointing to minikube-vm at 192.168.99.109

sed -i -e "s/\\/home\\/delivery/\\/root/g" ~/.kube/config

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 version
Client Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.10", GitCommit:"e3c134023df5dea457638b614ee17ef234dc34a6", GitTreeState:"clean", BuildDate:"2019-07-08T03:50:59Z", GoVersion:"go1.10.8", Compiler:"gc", Platform:"linux/amd64"}
Server Version: version.Info{Major:"1", Minor:"12", GitVersion:"v1.12.10", GitCommit:"e3c134023df5dea457638b614ee17ef234dc34a6", GitTreeState:"clean", BuildDate:"2019-07-08T03:40:54Z", GoVersion:"go1.10.8", Compiler:"gc", Platform:"linux/amd64"}

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 config --kubeconfig=/root/.kube/config view --minify
apiVersion: v1
clusters:
- cluster:
    certificate-authority: /root/.minikube/ca.crt
    server: https://192.168.99.109:8443
  name: minikube_v1.12.10
contexts:
- context:
    cluster: minikube_v1.12.10
    user: minikube_v1.12.10
  name: minikube_v1.12.10
current-context: minikube_v1.12.10
kind: Config
preferences: {}
users:
- name: minikube_v1.12.10
  user:
    client-certificate: /root/.minikube/client.crt
    client-key: /root/.minikube/client.key

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 --context=minikube_v1.12.10 get nodes
NAME       STATUS   ROLES    AGE    VERSION
minikube   Ready    master   7d7h   v1.12.10

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 --context=minikube_v1.12.10 get svc
NAME         TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
kubernetes   ClusterIP   10.96.0.1    <none>        443/TCP   7d7h

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 --context=minikube_v1.12.10 get pods --all-namespaces
NAMESPACE     NAME                               READY   STATUS    RESTARTS   AGE
kube-system   coredns-bb49df795-cw7kl            1/1     Running   7          7d7h
kube-system   coredns-bb49df795-rh6rb            1/1     Running   7          7d7h
kube-system   etcd-minikube                      1/1     Running   2          26m
kube-system   kube-addon-manager-minikube        1/1     Running   9          7d7h
kube-system   kube-apiserver-minikube            1/1     Running   2          26m
kube-system   kube-controller-manager-minikube   1/1     Running   0          7s
kube-system   kube-proxy-p99pc                   1/1     Running   7          6d7h
kube-system   kube-scheduler-minikube            1/1     Running   8          7d7h

docker run -it --rm -v ~/.kube:/root/.kube -v ~/.minikube:/root/.minikube -e "KUBECONFIG=/root/.kube/config" binbash/k8s-kubectl:v1.12.10 --context=minikube_v1.12.10 get pods --namespace=kube-system
NAME                               READY   STATUS    RESTARTS   AGE
coredns-bb49df795-cw7kl            1/1     Running   7          7d7h
coredns-bb49df795-rh6rb            1/1     Running   7          7d7h
etcd-minikube                      1/1     Running   2          26m
kube-addon-manager-minikube        1/1     Running   9          7d7h
kube-apiserver-minikube            1/1     Running   2          26m
kube-controller-manager-minikube   1/1     Running   0          8s
kube-proxy-p99pc                   1/1     Running   7          6d7h
kube-scheduler-minikube            1/1     Running   8          7d7h

minikube stop --profile minikube_v1.12.10
* Stopping "minikube_v1.12.10" in virtualbox ...
* "minikube_v1.12.10" stopped.

sed -i -e "s/\\/root/\\/home\\/delivery/g" ~/.kube/config
```

**NOTE:** Consider al the code and examples from the current repo `Makefile` for re-building and a minikube local K8s env approach