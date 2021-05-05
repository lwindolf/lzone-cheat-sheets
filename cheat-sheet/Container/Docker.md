## Commands

### Container vs image ids

Note in the following examples `<container>` is either a container id, or a container name (if such is given to a container with the --name option on start). Both can be obtained with `docker ps -a`. &lt;image> is either an image id, or an image name. Those can be obtained with the `docker image` command. Do not confuse with container id/name!

### Listing Containers

    docker ps                           # List running containers
    docker ps -a                        # List all containers
    docker ps -s                        # List running containers including CPU/memory size

List machine readable:

{% raw %}
    docker ps -a --format "{{.ID}},{{.Names}},{{.Status}},{{.Image}},{{.Ports}}"
{% endraw %}

### Inspecting containers

    docker exec -it <container> bash    # Log into container bash environment
    docker inspect <container>          # Instance details
    docker top     <container>          # Instance processes
    docker logs    <container>          # Instance console log
    docker port    <container>          # Shows container's port mapping. The same can be seen with "docker ps" though (row - "PORTS")
    docker diff    <container>          # Shows changes on container's filesystem. Will produce a list of files and folders prefixed by a
                                        # character. "A" is for "added", "C" is for changed.
    docker stats   <container>          # Shows the consumed resources (memory, CPU, network bandwidth)
    docker export --output="latest.tar" <container> #Export a container’s filesystem as a tar archive

### Starting containers

Start a container with default entrypoint and in background

    docker start -it ubuntu

Start a container with a command like `/bin/bash`

    docker run -i -t ubuntu /bin/bash   # New instance from image. "-i" is for "interactive" and "t" is for terminal. Without "it" it
                                        # won't be interactive - you will get a shell/terminal, but will not be able to type anything onto 
                                        # it. Without "t" you will not get a terminal opened. The command will run and exit.
                                        
    docker run -i -t --rm ubuntu /bin/bash # If you need a one-time container, then use the --rm option. Thus, once you exit the container,
                                        # it will be removed                                  

Start with port forwarding

    docker run -p 8080:8080 myserver

Create a network and start container in this network

    docker network create --subnet=172.18.0.0/16 elknet        # Create a network 'elknet'
    docker run --net elknet --ip 172.18.0.22 -it ubuntu bash   # Assign static IP from network    

### Container and image lifecycle

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

### Networks

    docker network ls
    docker network rm <network id>
    docker network inspect <network id>

## Docker Registry v2 API

https://docs.docker.com/registry/spec/api/

    /v2/_catalog                # List repositories
    /v2/<repository>/tags/list  # List tags for a given repo

## DockerHub Rate Limits + Solutions

https://inlets.dev/blog/2020/10/29/preparing-docker-hub-rate-limits.html

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
