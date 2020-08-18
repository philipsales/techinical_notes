---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Kubernetes Developer 
  language: kubernetes 
  name: kubernetes_developer
---
(kubernetes_developer)=

```Interactive Notes Link - https://interactive.linuxacademy.com/diagrams/LearnMicroServicesByDoing.html```
# Certified Kubernetes Application Developer (CKAD)

## Kubernetes API Primitivies/Kubernetes Objects
- every `Objects` have
    - Spec
        - desired state of the pod
    - Status
        - current actual state
- Kubernetes Objects examples
    - Pod
    - Node
    - Service
    - ServiceAccount
        ```
        kubectl api-resources
        ```


## Pod
- basic unit and building blocks in k8
- consist of 1 or more container
- often have 1 container + shared resources

    ```
    apiVersion: v1
    kind: Pod
    metadata:
    name: my-pod
    labels:
        app: myapp
    spec:
    containers:
    - name: myapp-container
        image: busybox
        command: ['sh', '-c', 'echo kuberentes && sleep 3600']
    ```
1. Create pod 
    ```
    kubectl create -f pod.yaml
    ```
1. Apply changes
    ```
    kubectl apply -f pod.yaml
    ```
    - note: you can't change everything to running pod

1. Apply changes to running pod
    ```
    kubectl edit pod podname -n sock-shop
    ```
    - `will see generated configuration in the file`
    - same output as the command 
        ```
        kubectl get pod podname -n sock-shop -o yaml
        ```

## Namespaces
- keep Objects categorized and organized 
- unspecified are automatically assigned to default namespace
- Purpose
    1. Multiple different applications running in the same cluster
        - take all different pods associated with each application
    1. Multiple teams working on the same cluster
        - give access to own namespace without interfering to others

1. Create namespace
```
kubectl create ns <namespace>
kubectl create namespace <namespace> 
```

## Container Configuration
1. Custom Command 
1. Argument Command 
1. ContainerPort Command 

## ConfigMap
- represents key-value store of configuration data
- centralized place to store configure data within cluster
- configuration data can be passed to pods then t containers

### 2 methods of using ConfigMap
1. Create ConfigMap as Pod 
    1. Create ConfigMap and kubectl create
    1. Create Pod using referencing using ` configMapKeyRef` attribute 
1. Create ConfigMap as Mounted Volume (ie. file that is mounted to container)
    1. Create ConfigMap and kubectl create
    1. Create ConfigMap as Pod with `volumeMounts` attribute 
    ```
    kubectl logs my-configmap-volume-pod
    kubectl exec my-configmap-volume-pod -- ls /etc/config
    ```

## Security Context 
- define privileges and access control settings for a pod
- needed if a pod needs special OS level permission 

1. Create users - SLAVE NODES 
    ```
    sudo useradd -u 2000 container-user-0
    sudo groupadd -g 3000 container-group-0
    sudo useradd -u 2001 container-user-1
    sudo groupadd -g 3001 container-group-1
    ```

1. Create a file to test user permissions - SLAVE NODES
    ```
    sudo mkdir -p /etc/message
    echo "hello world" | sudo tee -a /etc/message/message.txt

    sudo chown 2000:3000 /etc/message/message.txt
    sudo chmod 640 /etc/message/message.txt
    ```

1. Create the security context pod - MASTER NODES
    ```
    kubectl create -f my-securitycontext-pod.yaml
    ```

1. View the access logs - MASTER NODES
    ```
    kubectl logs my-securitycontext-pod 
    ```

1. View permission level of the execution - MASTER NODES
    ```
    kubectl exec my-securitycontext-pod -- ps
    ```

## Resource Requirements
- resource request (minimum requirements)
- limits (maximum value)
- memory is measured in `Megabytes` e.g 64Mi   
- cpu is measured in `milliCPUs` 250m

## Secrets
- password
- api token
- certificate keys

### YAML method
1. Create secret yaml config
```
kubectl apply f my-secret.yaml
```
- `unencrypted form`: best practice is delete after creatioin

1. Create the pod that will consume the secret config
```
kubectl apply f my-secret-pod.yaml
```

## Service Account
- allows containers running in pods to access Kubernetes API
- system generated user account
- are use when you want to authenticate machines with other services
```
kubectl get serviceaccount
kubectl get sa 
```


## Multi Container Pods
- pods with more than one container that all work together as single unit

## Liveness and Readiness Probes
- Probes
    - Allow customize how k8 determines status of container
- Liveness Probe
    - detect the over all health of container
    - governs when the cluster will automically stop or restart container
    - allow to provide own custom criteria do define if container is health
        - if criteria is not met, container will restart
- Readiness Probe
    - detect whether or not the pod is `ready to take request`
### Ways to detect status
1. Run a command
    - using the `command exec` attribute
1. Make http request within the pod
    - using the `httpGet` attribute



- pods with more than one container that all work together as single unit

## Liveness and Readiness Probes
- Probes
    - Allow customize how k8 determines status of container
- Liveness Probe
    - detect the over all health of container
    - governs when the cluster will automically stop or restart container
    - allow to provide own custom criteria do define if container is health
        - if criteria is not met, container will restart
- Readiness Probe
    - detect whether or not the pod is `ready to take request`
### Ways to detect status
1. Run a command
    - using the `command exec` attribute
1. Make http request within the pod
    - using the `httpGet` attribute


## Container Logging
- access the logs of pod by calling the pod name or `metadata name` attribute

1. for single container pod
    ```
    kubect logs counter
    ```
1. for multi-container pod
    ```
    kubect logs <pod_name> -c <container_name>
    ```

## Metric Server 
- provides API for resource usage
- access data about pods, nodes

### Install metrics server
```
cd ~/
git clone https://github.com/linuxacademy/metrics-server

kubectl apply -f ~/metrics-server/deploy/1.8+/
```

### Verify installation
```
kubectl get --raw /apis/metrics.k8.io/
```

## Monitoring Applications
```
kubectl top pods
kubectl top pod <pod_name>
kubectl top pods -n <namespaces>
kubectl top nodes
```

## Debugging 
1. Find the problem and locate pods
    ```
    kubectl get <object type>
    kubectl get pods
    kubectl get namespace
    kubectl get pods --all-namespaces
    kubectl describe pod <pod_name> -n <namespace>
    kubectl logs <pod_name> -n <namespace>
    ```
    - note: check the `Events` section in describe

1. Fix the problem
    ```
    kubectl edit pod <pod_name> -n <namespace>
    ```
    - note: if `edit` is used, it will automatically rerun the pod

    1. Export the running pod configuration
        ```
        kubectl get <object type> <object name> -n <namespace> -o yaml --export > file.yaml
        ```
        e.g
        ```
        kubectl get pod nginx -n nginx-ns -o yaml --export > nginx-pod.yaml
        ```
        - to preserve the specification so it can be recreated after the changes are created
        - to get clean YAML definition that can be edited. Useful to delete modify, and re-create object

    1. Edit the YAML file 

    1. Delete the running pod
        ```
        kubectl delete pod nginx -n nginx-ns 
        ```
    1. Delete the running pod
        ```
        kubectl apply -f nginx-pod.yaml -n nginx-ns 
        ```
        - note: always add namespace because export doesnt include namespace attribute

## Label
- key-value pair
- are attached to kubernetes objects
- used to identify attributes of objcts whcin can be used to select
- uses the `metadata.labels` attribute
    ```
    kubectl get pods --show-labels
    ```
## Selectors
- used to identify specific group of objects using `labels`

1. `Equality-based` selector
    ```
    kubectl get pods -l app=my-app
    kubectl get pods -l environment!=production
    ```

1. `Set-based` selector
    ```
    kubectl get pods -l 'environment in (production,development)' 
    ```

1. Chain `Multiple` selector
    ```
    kubectl get pods -l app=my-app,environment=production 
    ```

## Annotations
- similar to `label` attribute
- use to store custom metadata about objects
- not intended to be identifying
- cannot be used as part of selector
- useful for external tool or automation for custom data field 

## Deployment 
- declarative way of managing set of **`replica`** pods
- refines a desired state of the pods
- `spec.selector` attribute
    - provide a way to select a list of pods based on list of labels
- `spec.template` attribute
    - a pod template that will be used to create pods that are port of the deployment
    - desired state of the pods 
    - a pod descriptor similar to `kind: Pod`
    - `selector.matchLabels.app` must match `template.metadata.labels`

1. Edit deployment
    ```
    kubect edit deployment <deployment_name>
    ```
    - note: can edit replicas the pods that are running

## Deployment - RollingUpdates 
- tools for managing changes
- update deployment to new version of container by gradual update of replicas with no `downtime`

1. Change the image of container into newer version
    ```
    kubectl set image deployment/<deployment_name> <container_name>=<image_name> --recored
    ```
    e.g.
    ```
    kubectl set image deployment/nginx-rolling-deployment nginx=nginx:1.7.9 --record
    ```
    - note: `--record` keeps track of changes to allow rollback

1. Check rollout status 
    ```
    kubectl rollout status deployment/nginx-rolling-deployment
    ```

## Deployment - Rollbacks 
## Deployment - Rollbacks 
- tools for managing changes
- revert to previous state

1. List of previous updates
    ```
    kubectl rollout history deployment/<deployment_name>
    ```
    e.g. 
    ```
    kubectl rollout history deployment/nginx-rolling-deployment 
    ```
1. Detailed List of previous updates for specific deployment
    ```
    kubectl rollout history deployment/nginx-rolling-deployment --revision=2
    ```
1. **`Roll back`** to previous state 
    ```
    kubectl rollout undo deployment/nginx-rolling-deployment --to-revision=1
    ```
## Jobs and CronsJobs
- Pods: used to run containers that are intended to run constantly
- Jobs: used to run containers that does some work and shutdowns when work is finish 
- CronJob: similar with Jobs, but can be scheduled
    - contains spec `schedule` attribute

## Services
- abstraction layer which provides network access to a dynamic set of pods
- most services use a `selector` to determine which pods will receive traffic through the service


    ### ports.port 
    - specifies the port that the service will listen on
    - the port that the client will use to access
    - `does not need to be the same port that the containers on the pods are listening on`
    ### ports.targetPort
    - specifies the port that traffic will be forwarded on the pods
    - the port the actual pods are listening
        - note: if port and targetPort are the same, can be omitted

    ```
    kubectl get services
    kubectl get svc 
    kubectl get endpoints <service_name>
    kubectl get ep <service_name>
    ```


### Types of services
1. **ClusterIp**
    - `default` and most common
    - exposed within the cluster using internal IP
    - service is also accessible using cluster DNS
1. **NodePort**
    - exposed the service outside the cluster
    - commonly used for `testing purposes`
    - this service is exposed externally via a port which listens on each node in the cluster
    - selects an open port on all the nodes and listens on the port on each one of the node
1. **LoadBalancer**
    - `only works` if cluster is setup with cloud provider (i.e AWS, GCP)
    - the service is exposed through a load balancer that is creatd on the cloud platform
1. **ExternalName**
    - maps the service to an external address
    - used to allow resources within cluster to access things outside the cluster through a service
    - does not proxy traffic

## Network Policies
- control the traffic that comes in and out
- `default`, all pods in the cluster can communicate with any other pod

- `podSelector`: determines which pods to apply the network policy
   ###  `3 Types of selector`
    - podSelector: match pod selector
    - namespaceSelector: match pod namespace
        - when both podSelector and nameSelector exist, the matching pods selector must be within the namespace
    - ipBlock
        - specificies `cidr` range of IPs that will match the rule
        - mostly used for traffic from/to outside the cluster
- `policyTypes`: Sets whete the policy is ingress, egress, or both
- `ingress`: incoming traffic
- `egress`: outgoing traffic
- `rules`: whitelist-based
- `ports`: specifies the protocol and ports that match the rule
- `from/to`: specifies the source/destination of network traffic that match the rule

- flannel does not support network policies by itself
    - install additional plugin - `Calico`   
    ```
    wget -O canal.yaml https://docs.projectcalico.org/v3.5/getting-started/kubernetes/installation/hosted/canal/canal.yaml

    kubectl apply -f canal.yaml
    ```

1. Create pods
    ```
    kubectl apply -f network-policy-secure-pod
    kubectl apply -f network-policy-client-pod
    ```
1. Test pods connectivity
    1. Get IP of pod network-policy-secure-pod
    ```
    kubect get pods network-policy-secure-pod -o wide
    ```
    1. Ping the network-policy-secure-pod from the network-policy-client-pod
    ```
    kubectl exec network-policy-client-pod -- curl 10.244.1.89
    ```
1. Build Network Policy
    ```
    kubectl apply -f network-policy
    kubectl get networkpolicies
    kubectl describe networkpolicy network-policy
    ```
1. Update the pod selector label to fit the Network Policy
    ```
    ```
1. `Test:` Ping the network-policy-secure-pod from the network-policy-client-pod
    ```
    kubectl exec network-policy-client-pod -- curl 10.244.1.89
    ```

## Volumes
- `emptyDir`: volumes create storage on a node when the pod is assigned to the node
    - the storage disappears when the pod leaves the node
    - quick access to storage
    - shared storage between containers
- `mountPath`: is the location of volume inside the container where the storage will be mounted

## State Persistence
- k8 is desigend to manage `stateless` containers

    ### 2 Types of `Persistent Storage`
    1. Persistent Volumes (PV)
        - represents a storage resource 
        - comparable to a `node`
            - represents CPU and memory usage resources
    1. Persistent Volume Claims (PVC)
        - abstraction layer between user (pod) and persistent volumes
        - PVC automatically binds to a PV that has compatible:
            1. storageClassName
            1. accessModes

    ### Persistent Volumes Attributes
    - `hostPath`: location of the node's local filesystem for storage of volume
    - `accessModes`: permission nodes
    - `storageClassName`
    - `accessModes`


    ### Steps to bound Persistent Storage
    1. Create PV 
        e.g. mysql-persistent-volume.yaml
    1. Create PVC
        e.g. mysql-persistent-volumeclaim.yaml
    1. Create pod pointing to the PVC
        e.g. mysql-persistent-pod.yaml