---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Docker 
  language: docker 
  name: docker 
---
(docker)=
# Docker

## Docker Environment
Updating os dependencies 
```
sudo apt-get update
```

Installing Packages 
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

Add Docker’s official GPG key:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify fingerprints:
```
sudo apt-key fingerprint 0EBFCD88
```

Use the following command to set up the stable repository
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```

Update apt 
```
sudo apt-get update
```

Install the latest version of Docker CE  = Ubuntu 14.04 LTS
```
sudo apt-get install docker-ce docker-ce-cli containerd.io 
```

Install the latest version of Docker CE  = Ubuntu 16.04 LTS
```
sudo apt-get install -y docker-ce
```

Start docker at start and when system reboot
```
sudo systemctl start docker && sudo systemctl enable docker
```

Add cloud_user to the docker group
```
sudo usermod -aG docker cloud_user
```

## Docker Engine Components
1. docker client
1. docker daemon (dockerd)
1. containerd
1. runc

## Docker Images
* template for containers
* images as Classes, container as intances
* built from *Dockerfile* instructions
* made of multiple layers

## Docker Container
* top level writable layer
* writable layer is deleted when container is delted

## DockerHub
* public docker registry 


## Docker Management Commands
1. builder
1. config
1. container
1. engine
1. image 
1. network
1. node

```
docker image ls --help
docker image ls
docker image pull nginx
docker image inspect <image_id>
```

## Docker Container Comands
### Container Comands
* --exec: run a command in a running container
* --stats: live usage of conatiner
* --rm: remove container when it exits
* -it: interactive psuedo TTY 
* -d: detach background process


```
docker container ls --help
docker container run  -P <host_port:container_port> -d --name nginx_test <image_id/image_name> 

docker container run  -P 8080:80 -d --name=nginx_test 7d0cdcc60a96

docker container inspect <container_id/container_name> 

docker container attach <container_id/container_name>

docker container exec -it <container_id> /bin/bash
docker container exec -it <container_id> ls /usr/share/nginx/html/

docker container pause <container_id>

```

List running containers
```
docker container ls -a
docker container ls -a
docker container ls 
```

Clean all stopped containers
```
docker container prune -f
docker system prune -f
```

Clean all started and stopped containers
```
docker container rm -f <container_id>
```

### Creating Containers
* --expose: make the port available for mapping 
* -p: publish containers port to the host
* -P: random port ansignment for host port
* exec: executing/running a command on a container

#### Exec command
##### Exec caveat 
1. only run if container is running
1. command will run in default directory
1. if Dockerfile has working_dir directive, it will use that directory
1. exec comand can specify /bin/bash to take in the command prompt,
   and commands will be executed within container
1. commands can be done or on long running process
##### Exec 3 ways to execute commands
1. CMD command in Dockerfile
1. docker exec -it and run command inside container
1. docker exec -it <container_id> /bin/bash ls /etc/usr/share/nginx/html/

##### 2 ways to access container
1. docker exec -it <container_name> /bin/bash 
1. docker container start -ia <container_name>


```
docker container run  -P <host_port:container_port> -d --name nginx_test <image_id/image_name> 

docker container run  -P 8080:80 -d --name=nginx_test 7d0cdcc60a96
docker container port <container_id>
```

### Container Logging
```
docker container logs -tf <container_id/container_name>
docker container stats
docker container top <container_id/container_name>  
```

### Container Network 
* libnetwork
#### Network drivers
1. bridge 
    * default docker network
    * software bridge
1. host 
    * works on linux
1. overlay
    * distributed netowrk on multiple docker host
    * docker swarm
1. macvlan 
    * allows assign MAC address to container
    * simulates to be physical device on network
1. none 
1. Network plugin 
####  COntainer Network Model
##### Building blocks
1. Sandboxes
    * isolates network stock 
        * networking interfaces
        * ports
        * dns
        * route tables 
1. Endpoints
    * virtual network interfaces (virtual IP address)
1. Network
    * software implemented


### Networking Commands 
```
docker network --help
docker network ls
docker network inspect bridge
docker network create br00
docker network rm br00
```
Connect container to a network
```
docker container run -d --name network-test03 -p 8081:80 nginx
docker network create br01
docker network connect <network_name> <container_name>
e.g. docker netowkr connect br01 network-test03

docker network inspect br01 
```
### Networking Containers - Subnet and Gateway

Create a network with subnet and gateway
```
docker network create --subnet 10.1.0.0/24 --gateway 10.1.0.1 br02
docker network prune

docker network create --subnet 10.1.0.0/24 --gateway 10.1.0.1 --ip-range=10.1.4.0/24 --driver=bridge --label=host4network  br04

docker container inspect  <container_id> | grep IPAddr
```

Adding a container to a network
```
docker container run -d --name -it --network <network_label> <image_id> <cmd>
```
e.g.
```
docker container run --name nginx_network_test -it --network br02 nginx /bin/bash
```
Assigning an IP to a container 
```
docker container run -d --name -it --network <network_label> --ip <IP> <image_id> <cmd>
```
e.g. 
```
docker container run --name nginx_network_test -it --ip 10.11.4.1 --network br02 nginx
```

Adding a container to a network
```
docker network connect <network_label> <container_id/container_name>
```
e.g. 
```
docker network create -d bridge --internal localhost_network

docker container run -d --name test_connection --network localhost_netowrk nginx_iamge
```
* --internal: not bound to any interfaces

### Storage - Volume and Mount Overview 
#### Categories of data store 
1. Non-persistent
    * by default all containers use local storage
    * storage location
        * Linux: /var/lib/docker/<Storage-driver>/
    * storage drivers
        * Ubuntu: overaly or aufs
1. Persistent
    * Volumes
        * How to create volumes
            1. Create the volume
            1. Create your container
        * decoupled from containers
        * third-party drivers
            = located in Linux: /var/lib/docker/volumnes
            * Block storage - high peformance, random access straoge
                - e.g Amazon EBS
            * File storage - high performance workload
                - e.g NFS, Amazon EFS
            * object storage - large data blobs that don't change often
                - e.g Amazon S3
    * Mount 

### Volume Commands 
- Volume: a new directory is created within Docker's storage directory on the host machine, and docker manages that directory's content
- easier to migrate and backup
- safely shared with multiple containers
- content can have pre-populated
```
docker volume --help
docker volume create <volume_label>
docker volume inspect <volume_label>
docker volume rm <volume_label>
docker volume prune -f
```
### Bind Mounts Commands 
- limited functionality than volumes
- Mount: a file or folder in host machine is mounted on a container

Using the bind mount flag
```
docker container run -d 
    --name <container_label>
    --mount type=bind,source=<source>,target=<target> <image>
```
1. *cannot be seen `docker volume ls`*
1. *`traditional way of mounting`*

e.g.
```
mkdir target
docker container run -d  \
    --name nginx-bind-mount1 \
    --mount type=bind,source="$(pwd)"/target,target=/app nginx 
```
*type = bind OR volume*


Using the volume flag
- *volume file/folder is created if not exists*
```
docker container run -d 
    --name <container_label>
    -v <source>:<target> <image>
```
1. *`with $(pwd) if host machine is the source path`*
1. *`without $(pwd) if docker container is the source path`*

e.g. 
```
docker container run -d \
    --name nginx-bind-mount1 \
    -v <source>:<target> <image>
```
### Using Volume for Storage 
Using mount flag
```
docker volume create html-volume
docker container run -d \
    --name nginx-volume1 \
    --mount type=volume,source=html-volume,target=/usr/share/nginx/html/ \
    nginx
```
Using volume flag
```
docker container run -d \
    --name nginx-volume2 \
    -v html-volume:/usr/share/nginx/html/ \
    nginx
docker container inspect nginx-volume2 
```
Using volume flag - readonly
```
docker container run -d \
    --name nginx-volume2 \
    -v html-volume:/usr/share/nginx/html/,readonly \
    nginx
```
*note: readonly*

### Dockerfile
- instructions use to build an image
- collection of read-only layers
- layers are staked

#### Best Practices 
- keep containers ephemeral 
    - stop and destroy anytime with little effort 
- Follow 6 out of 12 principle of 12 Factor App 
    - Execute app as one or more stateless processes
- Avoid unnecssary files
- Use .gitignore
- Use multi-stage builds
- Avoid uncessary packages
- Decouple applications
    - each container must have 1 concern
- Minimize the number of layers
- Sort multi-line arguments
    - have space before '\\'
- Leverage the build cache


#### Dockerfile Instructions


* FROM 
    * base image
* RUN
    * apt-get update, etc.
* ADD 
    * can have source using url
    * have more functionality than COPY
* COPY
* WORKDIR
    * applicable for any
        * RUN, CMD, ENTRYPOINT, COPY, ADD
* ARGS
    * defined variables that user can pass at `build-time`
    * --build-arg <varname>=<value> flag
    * ARGS: is variable for Dockerfile that can be sourced from docker-compose or command terminal
* ONBUILD
    * trigger instructions to the image the executes when the image is used as the base for another build
* SHELL
    * allows default shell used for the shell form of commands to be overriden
* CMD 
    * executed at runtime
    * singleton - declared only once
    * consider only the latest CMD if multiple declared
* ARGS  
    * EXECUTED at build time
* ENTRYPOINT 
    * executed at runtime

### Build Dockerfile
Build image
```
docker image build -t linuxacademy/weather-app:v1 . 
```
-f: specify dockerfile folder path and Docker filename
```
docker image build -t linuxacademy/weather-app:v1 -f Dockerfile .
```
Run image as container
```
docker container run -d --name weather-app1 -p 8081:3000 linuxacademy/weather-app:v1
```

### Dockerfile Environment Variables
- Config 3rd in 12 factor
- Store config in the environment 
    - strict separation from config and code

#### 2 ways to set variable
1. Manual way in command line - during docker image build
2. Using .env instruction in Dockerfile

#### 1st way to set variable
Build image
```
docker image build -t linuxacademy/weather-app:v2 .
```
Run image as container
```
docker container run -d \
    --name weather-app2 \
    -p 8082:3001 \
    --env PORT=3001 \
    --env NODE_ENV=development \
    linuxacademy/weather-app:v2  
```
*note: terminal commands always precedes Dockerfile*

View environment varialbes in container
```
docker container inspect <container_id>
docker container logs <container_id>
```

### Dockerfile - Build Arguiment Environment
- build time variables
- use ARG <NAME>=<DEFAULT_VALUE> in dockerfile
- use --build-arg <NAME>=<VALUE> in cmd 

- ARGS: is variable for Dockerfile
- ENV: is variable for Application/Service

Build an image build
```
docker image build -t linuxacademy/weather-app:v3 --build-arg SRC_DIR=/var/code .
```
Run image as container 
```
docker container run -d --name weather-app3 -p 8085:3000 linuxacademy/weather-app:v3
```

### Dockerfile - User Instructions - Non-privilege User
Build an image build
```
docker image build -t centos7/nonroot:v1 .
```

Run image as container 
```
docker container run -it --name test-build centos7/nonroot:v1 /bin/bash
```
Access container as non-root
```
docker container exec -it test-build /bin/bash
```
Access container as root
```
docker container exec -u 0 -it test-build /bin/bash
```

### Dockerfile - Volume Instructions
Build image
```
docker image build -t linuxacademy/nginx:v1 .
```
Run image as container
```
docker container run -d --name nginx-volume linuxacademy/nginx:v1
```

### Dockerfile - Entrypoint vs Command
1. Entrypoint 
    * not immutable
    * allows to configure a container that will run as an executables
    * overides all elements in CMD
    * if container inspected, ENTRYPOINT will appear in "Args"
    * if CMD is added in the terminal, it will be appended to the ENTRYPOINT in Dockerfile

Build image
```
docker image build -t linuxacademy/weather-app:v4 .
```
Run image as container
```
docker container run -d --name weather-app4 linuxacademy/weather-app:v4
```

### Buidling Images
#### Terminal commands
``` 
-f: path and name of Dockerfile
--force-rm: always delete immediate containers
-rm: delete immediate containers if build successful
--label: metadata for an image

``` 
#### Building image using remote url
``` 
docker image build -t <name>:<tag> <git_url>#<REF>
docker image build -t <name>:<tag> <git_url>#:<directory>
docker image build -t <name>:<tag> <git_url>#<REF>:<directory>

docker image build -t linuxacademy/weather-app:github https://github.com/linuxacademy/content-weather-app.git#remote-build
``` 

#### Building image using tar file
``` 
docker image build -t <name>:<tag> - < <filename>.tar.gz

docker image build -t linuxacademy/weather-app:from-tar - < weather-app.tar.gz
``` 
*the `tar file` must have Dockerfile inside*

#### Using MULTI-STAGE BUILDS 
- stages are not named, are integers number
- use AS NAME to name 
- use --rm in terminal build to remove immediate containers
``` 
docker image build -t linuxacademy/weather-app:multi-stage-build  .
``` 

#### Using Tagging
Use the commit hash Git as image tag
``` 
git log -1 --pretty=%H
``` 
User docker image tag to create a new tagged image
``` 
docker image tag <source_image>:<tag> <target_image>:<tag>
```
#### Using Dockerhub
Tag the docker image
```
docker image tag <source_image>:<tag> <dockerhub_username>:<tag>

docker image tag linuxacademy/weather-app:b301a90001b1524de26f9fdd92694e61cf2d3724 philipsales/weather-app:b301a90001b1524de26f9fdd92694e61cf2d3724
```
Push the docker image to dockerhub
```
docker login -u philipsales

docker image push philipsales/weather-app:b301a90001b1524de26f9fdd92694e61cf2d3724
```

#### Docker Volume (e.g Mysql)
1. Create volume
```
docker volume create mysql_data
```
1. Create container  for MySQL
```
docker container run -d --name app-database \
    --mount type=volume,source=mysql_data,target=/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=P4ssW0rd0! \
    mysql:latest
```
#### Managing Image History 
```
docker image history node:lastest
```
#### Saving and Loading Image 
- store binary artifacts (i.e. tar)
```
docker image save <IMAGE_ID> > <FILENAME>.tar
docker image save <IMAGE_ID> -o <FILENAME>.tar
docker image save <IMAGE_ID> --output <FILENAME>.tar

gzip <FILENAME>.tar 
```
- inspect tar build image
```
tar tvf <FILENAME>.tar
```

- Load an image from tar archive
```
docker image load < <FILENAME>.tar
docker image load --input <FILENAME>tar.gz
```
#### Inspect Running Process
```
docker container top <container_id/name>
docker container stats <container_id/name>
```

#### Auto-Restart 
- restart flags
1. no
1. on-failure - will restart container if exits due to error
1. always - will restart container is stop
1. unless-stopped - similar to always, but will not restart of intentinally stop
```
docker container run -d --name <container_label> -stop-container --restart always <image_id>
```

#### Docker Events 
- real-time events from docker container and docker server `NOT application inside container`
```
docker system events
docker system events --since '1h'
docker system events --filter event=start --since '1h'
docker system events --filter event=attach \
                     --filter event=die \
                     --filter event=stop --since '1h'
```
- *`attach` command is destructive*
#### Managing Stop Containers 
```
docker container prune
```
```
docker container ls -a -q
docker container ls -a -f status=exited
docker container ls -a -q -f status=exited
docker container ls -a -q -f status=exited | wc -l
docker container ls -a -q -f status=exited | grep weather-app 
```
```
docker container rm <container_id> <container_id> <container_id>
```

### Managing Containers - Portainer
```
docker volume create portainer_data
docker container run -d --name portainer -p 8080:9000 \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v portainer_data:/data portainer/portainer
```

### Updating Containers - Watchtower
- monitor running docker containers to see any changes
- will restart the container using new image 
- keeps the containers up to date

1. Build Image
    ```
    docker login -u philipsales
    docker image build -t philipsales/my-express .
    ```
1. Push image to docker
    ```
    docker image push philipsales/my-express
    ```
1. Run a app container using the image
    ```
    docker container run -d --name watched-app -p 80:3000 --restart always philipsales/my-express
    ```

1. Run the watchtower container from the remote image
    ```
    docker container run -d --name watchtower \
    --restart always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    v2tec/watchtower -i 15
    ```

1. **REBUILD** the image for any code changes
    ```
    docker image build -t philipsales/my-express:latest --no-cache .
    ```
    *`--no-cache`: use to rebuild image if do not need to use previous layers*

1. Repush the image to repository
    ```
    docker image push philipsales/my-express:latest
    ```
    ***NOTE***: *docker container was not rebuilt and restarted, instead changes to image were push to repository. Latest image was pulled from the repository and reflected in the container*

### Installing Docker Compose
Download latest version
```
sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
```
Apply executable permissions
```
sudo chmod +x /usr/local/bin/docker-compose
```
### Docker Compose Commands
-f: file command
```
docker-compose up -f folder/docker-compose.yml 
```

docker version is related to docker engine version
```
docker version
```

To reflect changes in Dockerfile
```
docker-compose build --no-cache
docker-compose up -d 
```

long syntax
```
volumes:
    - type: volume
      source: mydata
      target: /data
      volume:
        nocopy: true
```

### Docker Security 
- secret is only available in Docker Swarm

#### Capabilities
- by default, containers have no limits
- limit the container resources
```
docker container run -d --name resource-limits --cpus=".5" --memory=512M --memory-swap=1G <image_id>
```
#### Check Docker Host security 
- container will run series of check to host
```
docker container run --rm -it --network host --pid host --userns host --cap-add audit_control \ 
    -e DOCKER_CONTENT_TRUST=$DOCKER_CONTENT_TRUST \
    -v /var/lib:/var/lib \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /usr/lib/systemd:/usr/lib/systemd \
    -v /etc:/etc --label docker_bench_security \
    docker/docker-bench-security
```
#### Docker Content Trust
- signing images

Creating an image tag  
```
docker image tag philipsales/openrefine:3.0 philipsales/openrefine-signed

```
Creating a key
```
docker trust key generate [NAME]
e.g.
docker trust key generate philipsales
```

Add signer
```
docker trust signer add --key [PEM] [NAME] [REPOSITORY]
e.g.
    docker trust signer add --key philipsales.pub philipsales philipsales/openrefine-signed
```

Sign a repository
```
docker trust sign philipsales/openrefine-signed:latest
```
*automatically pushes images to repository*

Enable docker content trust (DCT)
```
export DOCKER_CONTENT_TRUST=1
```
- **any image pulled that has not been signed will be rejected**
- temporary settings only using export

**Permanently** enable DCT settings
- /etc/docker/daemon.json
```
{
    "content-trust": {
        "mode": "enforced"
    }
}
```
- restart docker daemon


Push image to repository
```
docker image push philipsales/openrefine-signed:latest 
```



Remove signer
```
docker trust signer remove [NAME] [REPOSITORY]
```

Importing a key
```
docker trust key load [PEM] --name [NAME]
```

### Docker Seccrets 
- must use version 3.1 for secrets
- only for Swarm
```
docker swarm init
```
#### 2 ways for secrets

1. using stdin
    ```
    openssl rand -base64 20 | docker secret create my_secret_data -
    ```
1. using file
    ```
    openssl rand -base64 20 > secret.txt
    ```