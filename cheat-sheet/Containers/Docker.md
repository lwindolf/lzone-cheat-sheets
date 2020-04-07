## Commands

Note `<container>` is either a container id, or a container name (if such is given to a container with the --name option on start). Both can be obtained with `docker ps -a`. &lt;image> is either an image id, or an image name. Those can be obtained with the `docker image` command. Do not confuse with container id/name!

    docker exec -it <container> bash    # Log into container bash environment
    docker inspect <container>          # Instance details
    docker top     <container>          # Instance processes
    docker logs    <container>          # Instance console log
    docker port    <container>          # Shows container's port mapping. The same can be seen with "docker ps" though (row - "PORTS")
    docker diff    <container>          # Shows changes on container's filesystem. Will produce a list of files and folders prefixed by a
                                        # character. "A" is for "added", "C" is for changed.
    docker stats   <container>          # Shows the consumed resources (memory, CPU, network bandwidth)
    docker export --output="latest.tar" <container> #Export a container’s filesystem as a tar archive
    docker network create --subnet=172.18.0.0/16 elknet #Create a network
    docker run --net elknet --ip 172.18.0.22 -it ubuntu bash #Assign static IP from network    

### Listing Containers

    docker ps                           # List running containers
    docker ps -a                        # List all containers
    docker ps -s                        # List running containers including CPU/memory size

List machine readable:

    docker ps -a --format "{{.ID}},{{.Names}},{{.Status}},{{.Image}},{{.Ports}}"

### Building Images

    docker build .
    docker build -f Dockerfile.test .                     # Use another Dockerfile file name
    docker build --target <stage> .                       # Build specific target of a multi-stage Dockerfile
    docker build --build-arg MYARG=myvalue .              # Pass variables with --build-arg
    docker build --add-host <hostname>:<target> .         # Inject hostnames
    
### Using BuildKit

BuildKit is Docker next-gen build derived from Moby BuildKit. In Docker v18 and v19 it needs to be 
explicitely enabled. There are two ways to use it.

1.) via environment

    export DOCKER_BUILDKIT=1

2.) via new ["buildx"](https://docs.docker.com/buildx/working-with-buildx/) command (v19+ only)

    docker buildx build <build args>

Note: here "buildx" just serves as a wrapper to provide compatible build commands.

### Releasing Images

    docker tag <source>[:<tag>] <target>:<tag>
    docker push <target>:<tag>
    
To a private/remote registry

    docker tag <source>[:<tag>] <remote registry>/<target>:<tag>
    docker push <remote registry>/<target>:<tag>

### Container Lifecycle

    docker run -i -t ubuntu /bin/bash   # New instance from image. "-i" is for "interactive" and "t" is for terminal. Without "it" it
                                        # won't be interactive - you will get a shell/terminal, but will not be able to type anything onto 
                                        # it. Without "t" you will not get a terminal opened. The command will run and exit.
                                        
    docker run -i -t --rm ubuntu /bin/bash # If you need a one-time container, then use the --rm option. Thus, once you exit the container,
                                        # it will be removed                                  
                                         

    docker start   <container>
    docker restart <container>
    docker stop    <container>
    docker attach  <container>
    docker rm      <container>          # Removes / deletes a container (do not confuse with the "rmi" command - it removes an image!).
                                        # The container must be stopped in beforehand.

    docker cp '<id>':/data/file .       # Copy file out of container

    docker images                       # List locally stored images
    docker rmi <image>                  # Removes / deletes a locally stored image
    docker save -o <tarball> <image>    # Saves a local image as a tarball, so you can archive/transfer or inspect its content
                                        # Example: docker save -o /tmp/myimage.tar busybox
    docker history <image>              # Shows image creation history. Useful if you want to "recreate" the Dockerfile of an image -
                                        # in cases where you are interested how the image has been created.

## Dockerfile Examples

Installing packages

    FROM debian:wheezy
    RUN apt-get update
    RUN apt-get -y install python git

Adding users

    RUN useradd jsmith -u 1001 -s /bin/bash

Defining work directories and environment

    WORKDIR /home/jsmith/
    ENV HOME /home/jsmith

Mounts

    VOLUME ["/home"]

Opening ports

    EXPOSE 22
    EXPOSE 80

Start command

    USER jsmith
    WORKDIR /home/jsmith/
    ENTRYPOINT bin/my-start-script.sh
    
[Setting timezone](https://serverfault.com/a/683651)

    ENV TZ=America/Los_Angeles
    RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
    
Using variables

    RUN curl $JAR_DOWNLOAD
    ...
    CMD java ${JAVA_OPTS} ...
    
Pass those variables using `--build-arg JAR_DOWNLOAD=... --build-arg JAVA_OPTS="-D..."`

For longer commands use CMD array syntax

    CMD [ "java", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", <...>]
    
Ensure pipe errors to break the build

    SHELL ["/bin/bash", "-o", "pipefail", "-c"]

Clear apt cache

    RUN apt-get update \
      && apt-get install --no-install-recommends -y <packages> \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

## Working with private registries

In Dockerfile use syntax with /

    FROM <server>/<image>:<tag>

Define a variable registry in FROM clause and pass the hostname with `--build-arg MY_REGISTRY=docker.example.com`

    ARG MY_REGISTRY=
    FROM ${MY_REGISTRY}/myimage

## Multi-stage Dockerfiles

Starting with Docker 17.05 you can do [multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/#use-multi-stage-builds) by having multiple FROM commands in one Dockerfile

    FROM image1
    ...
    
    FROM image2
    ...
    
Above syntax example will automatically trigger two builds. Stages also can be named:

    FROM image1 as stage1
    
and explicitely called on the CLI

    docker build --target stage1 ...

## Docker Registry v2 API

https://docs.docker.com/registry/spec/api/

    /v2/_catalog                # List repositories
    /v2/<repository>/tags/list  # List tags for a given repo

## Misc

-   [Amazon EC2 Container Service](http://aws.amazon.com/ecs/) - Docker
    container support on AWS
-   [Docker Patterns](http://www.hokstad.com/docker/patterns) -
    container inheritance examples
-   [Docker Bench
    Security](https://github.com/docker/docker-bench-security) - Test
    Docker containers for security issues
-   [Docker OpenSCAP
    Checks](https://github.com/OpenSCAP/container-compliance)
-   [Container Hardening
    Script](https://gist.github.com/jumanjiman/f9d3db977846c163df12)
-   [dive: Image Layer Traversal](https://github.com/wagoodman/dive)
-   [Add CVE scanning to Docker build](https://www.tigera.io/blog/adding-cve-scanning-to-a-ci-cd-pipeline/)

### Best Practices for Images

- When using ext4: disable journaling
