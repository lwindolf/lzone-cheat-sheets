## Dockerfile Examples

Installing packages

    FROM debian:wheezy
    
    ENV DEBIAN_FRONTEND=noninteractive             # Always have this on Debian-based distros!
    
    # Always combine update + install to avoid apt caching issues!
    # Always disable recommends to get no extra packages!
    RUN apt-get update \
     && apt-get install -y --no-install-recommends python git

Copy files

    COPY sourcefile.txt /app
    COPY sourcefile.txt config.ini /app/           # Note the trailing slash on target with multiple files 
    COPY dir1 /app

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

