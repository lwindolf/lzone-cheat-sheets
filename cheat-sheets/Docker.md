### Commands

    docker ps                           # List running instances
    docker ps -a                        # List all instances
    docker inspect <id>                 # Instance details
    docker top     <id>                 # Instance processes
    docker logs    <id>                 # Instance console log

    docker run -i -t ubuntu /bin/bash   # New instance from image

    docker start   <id>
    docker restart <id>
    docker stop    <id>
    docker attach  <id>
    docker rm      <id>

    docker cp '<id>':/data/file .       # Copy file out of container

    docker images                       # List locally stored images

### Dockerfile Examples

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

### Misc

-   [kubernetes](https://github.com/googlecloudplatform/kubernetes):
    Docker container cluster management
-   [CoreOS Rocket](https://coreos.com/blog/rocket/) (commercial Docker
    alternative)
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

