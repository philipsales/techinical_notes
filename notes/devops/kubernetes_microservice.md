---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Kubernetes Microservice
  language: kubernetes 
  name: kubernetes microservice
---
(kubernetes_microservice)=

# Microservices in Kubernetes 
```Interactive Notes Link - https://interactive.linuxacademy.com/diagrams/LearnMicroServicesByDoing.html```


## kubeadm
- tool created to provide best practices for create k8 cluster
- provide basic and functioning cluster
## kubelet 
- services that run on all cluster nodes
- used to execute commands on various components of the cluster
## kubectl 
- command utility to interact with k8 cluster
- allows to deploy and manage applications
- interact and configure cluster resources

## Prerequisite for Cluster
- unique hostname, Mac Addres, product_uuid for each node
    - Mac Address: can be found in ipconfig
    - product_uuid: sudo cat /sys/class/dmi/id/product_uuid
- network connectivity for all nodes
- open required ports
    - Master ports (all TCP)
        - 6443
        - 2379-2380
        - 10251
        - 10252
    - Worker ports (all TCP)
        - 10250
        - 30000-32767
- disable swap (`if cluster recieves much traffic or production level`)
    - $ swapoff -a
    - remove or comment swap entry 
        - /etc/fstab

## Initialize the cluster on Master - MASTER NODE
```
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```
- kubeadm init
    - command to setup local user and join nodes to the cluster
- --pod-network-cidr 
    - is needed using the flannel networking plugin
- to verify 
    - RUN kubectl version

    ### Expected result
    ```
    Your Kubernetes control-plane has initialized successfully!
    To start using your cluster, you need to run the following as a regular user:
    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    You should now deploy a pod network to the cluster.
    Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
    https://kubernetes.io/docs/concepts/cluster-administration/addons/
    Then you can join any number of worker nodes by running the following on each as root:
    kubeadm join 10.148.0.16:6443 --token 8hmltn.2scqijaba2dh8v3g \
        --discovery-token-ca-cert-hash sha256:d73475c6ccf103c705bffe7bc25d14ab2fd6126bb4b864338f17ef554c4e6ed6 
    ```

### Create .kube directory in usrs home directory - MASTER NODE
```
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

### Join the non-master node to the cluster as root user - SLAVE NODE
```
sudo kubeadm join 10.148.0.16:6443 --token 8hmltn.2scqijaba2dh8v3g \
    --discovery-token-ca-cert-hash sha256:d73475c6ccf103c705bffe7bc25d14ab2fd6126bb4b864338f17ef554c4e6ed6
```
- use sudo when running `kubeadm`

### Verify the cluster nodes - MASTER NODE
```
kubectl version
kubectl get nodes
```

## Configure cluster network using Flannel plugin

### Install Flannel - ALL NODES
```
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf
```

### Apply the changes - ALL NODES
```
sudo sysctl -p
```

### Install Flannel using YAML template - MASTER NODE
```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
```

### Verify installation
```
kubectl get nodes
kubectl get node master -o yaml
kubectl describe node <nodename>
```
- note: Expect the cluster nodes to be `Ready` state

```
kubectl get pods -n kube-system
```
- to verify if flannel are running

### Create namespace
```
kubectl create namespace dev
kubectl get namespaces
kubectl describe namespaces dev
kubectl delete namespaces dev
```

### Different ways to Create Pods
1. run command (deprecated)
    ```
    kubectl run <pod_name> --image=nginx
    ```
1. deployment command
    ```
    kubectl create deployment <pod_name> --image=nginx
    e.g. kubectl create deployment test2 --image=nginx
    kubectl get pods
    ```
1. STDIN method 
    ```
    cat << EOF | kubectl create -f -
    > apiVersion: v1
    > kind: Pod
    > metadata:
    >    name: nginx
    > spec:
    >    containers:
    >    - name: nginx
    >    image: nginx
    > EOF
    ```
1. Get additional information
    ```
    kubectl describe pod <pod_name>`
    ```
1. Delete pods
    ```
    kubectl get deployments
    kubectl delete pod <pod_name>
    kubectl delete deployment <pod_name>
    ```
    - note: if pods was created thru deployment, the deployment must deleted, 
    otherwise deployment will just reintialize/heal the pod
    ```
    kubectl delete pod <pod_name> --now
    ```
    `--now:` make deletion fasters

### Installing microservices 

1. Download repository
```
git clone https://github.com/linuxacademy/microservices-demo
```
1. Create namespace for the application
```
kubectl create namespace sock-shop
```
1. check which apis support current Kubernetes object using
```
kubectl api-resources | grep deployment
```
1. Install microservice application under the created namespace
```
cd /microservices-demo/deploy/kubernetes
kubectl -n sock-shop create -f complete-demo.yaml
```
1. List the pods of the newly created application
```
kubectl get pods -n sock-shop -w
kubectl get pods -n sock-shop -o wide
kubectl get servies -n sock-shop
kubectl describe services -n sock-shop front-end
```
- `Note`: using `-w` allow to view pods in real-time startup
- `Note`: using `-o wide` allow wider view 

## Kubernetes API
- main gateway for interacting components with cluster
- 3 components of master node
    - API Server
        - only components that interact with distributed key-value store etcd.
        - exposed by `kube-apiserver` endpoint
            - serves as the frontend on kubernetes control panel
    - Controller Manager
    - Scheduler

## API Terminology
1. Resource Type: name used in the URL (pods, services, etc)
1. Kind: concrete representation in JSON
    - Object: represents persistent entity
    - List: collection of resources
    - Simple: specific actions on objects and non-persistent entities
1. Collection: list of instances of resource type
1. Resource: single instance of resource type

## Interacting with the API
1. using `kubectl` and `kubeadm`
    - e.g. kubectl get pods --all-namespaces
1. calling API directly using REST calls
    - `with kubectl proxy` -
        - e.g kubectl proxy --port=8080 &
          then to interact, curl http://localhost:8080/api/
    - `without kubectl proxy`
        - e.g. kubectl describe secret


## Service Discovery
- automically detecting available services and connect to them

### 2 Modes 
1. Environment Variables
    - will be assigned by kubelet whenever pod is runned in a node
    - host and port must be set (`minimum requirement`)
    e.g.
    ```
    kubectl get pods -n sock-shop
    kubectl exec <pod_name> -n sock-shop -- env
    kubectl exec carts-7bbbd7779d-5trcx -n sock-shop  -- env
    ```
2. DNS
    - default means of service discovery
    - the `recommended` way
    - cluster add-ons
    - enabling DNS across the cluster allows all pods to perform automatic name resolution for all services
    - `CoreDNS`: default DNS server for kubernetes


### Corefile
- is kept in a configmap and can be updated to add plugins which provide new functionality for CoreDNS
    ```
    kubectl get configmap --all-namespaces
    kubectl describe configmap coredns -n kube-system
    kubectl get deployments --all-namespaces
    kubectl describe deployments -n kube-system coredns
    ```

## Replication 
- multiple instances of application spread across the cluster
- replicate pods and containers accross cluster
- replicaSets + Deployments perform this action

1. ReplicationController
    - deprecated
1. ReplicaSet
    - support new set-based selector requirements
    - don't used by themselves
1. Deployments
    - `preferred` method for deploying and updating a set of pods with replication
    - managed their own ReplicaSets
        - no need to managed ReplicaSets outside deployment

    Run ReplicaSet in Deployment
    ```
    kubectl create -f deployment.yaml
    ```

## Ingress
- API object that managers external access to services in cluster
- typically in HTTP request
- entryway by which services in a private cluster are accessed
- can be configured to provide services with 
    - externally reachable URLS
    - load balanced traffic
    - SSL termination
    - name-based virtual hosting
- supported controllers are CGE and `nginx`

Describe ingress flow
```
kubectl get services --all-namespaces
kubectl describe services <pod_name> -n <namespace>

kubectl get deployments --all-namespaces
kubectl describe deployments <pod_name> -n <namspace>

kubectl get pods --all-namespaces
```

## Scaling
### Manual Scaling
```
kubectl get deployments -n <namespace>
```
1. Updating the Yaml
    1. Update the deployment section in spec.replicas in yaml
    1. Apply changes
    ```
    kubectl apply -f <path>/file.yaml
    kubectl get deployments -n <namespace>
    kubectl get pods -n <namespace>
    ```

1. Scale-up direclty from command line
    ```
    kubectl get deployments -n <namespace>
    kubectl scale deployment/<deploymentname> -n <namespace> --replicas=3
    ```
1. Scale-down direclty from command line
    ```
    kubectl scale deployment/<deploymentname> -n <namespace> --replicas=1
    ```

## Automatic Scaling

1. Horizontal Pod Autoscaler (`HPA`)
- based on observed CPU utilization or other provided metrics

    1. Create HPA
    ```
    kubectl autoscale deployment <deploymentname> -n <namespace> --min 2 --max 6 --cpu-percentage 65
    ```
    1. Verify
    ```
    kubectl get deployments -n <namespace>
    kubectl get hpa -n <namespace>
    ```
    1. Delete HPA 
    ```
    kubectl delete hpa -n sock-shop front-end
    ```

## Self-Healing
- pod not created through a *`deployment`* or other replication method
`will not automatically recover`
