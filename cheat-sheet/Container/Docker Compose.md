## CLI

     docker-compose up           # start docker-compose.yml from current dir
     docker-compose down

## Custom Build Context

     services:
       webapp:
         build:
           context: ./webapp
           dockerfile: Dockerfile.webapp
           args:
             buildno: 1

## Custom Network Config

Examples from [compose documentation](https://docs.docker.com/compose/compose-file/compose-file-v2/#ipv4_address-ipv6_address)

### Network

To assign a network a fixed CIDR range

    networks:
      app_net:                                   # <-- any name goes here
        driver: bridge
        enable_ipv6: true
        ipam:
          driver: default
          config:
            - subnet: 172.16.238.0/24
              gateway: 172.16.238.1
            - subnet: 2001:3984:3989::/64        
              gateway: 2001:3984:3989::1
              
To make a service use it

    service:
      my_app:
        [...]
        networks:
          - app_net

### Service

To assign a service a fixed IP

    services:
      my_app:
        image: busybox
        command: ifconfig
        networks:
          app_net:
            ipv4_address: 172.16.238.10
            ipv6_address: 2001:3984:3989::10

## Mounting Volumes

    services:
      my_app:
        volumes:
        # Actual volume mounts
        - vol1:/db
        - vol2:/mnt/vol2
        - vol3:/mnt/nfs
        
        # Bind mounts
        - src/tests:/opt/app/tests
        - /etc/ssl/certs/myCA.crt:/etc/ssl/certs/myCA.crt
                
    volumes:
      vol1:                  # Auto-create volume
      vol2:
        external: true       # No auto-create volume, create with `docker volume create` manually
      vol3:
        driver: local        # NFS mounted volume
        driver_opts:
         type: "nfs"
         o: "addr=10.40.0.199,nolock,soft,rw"
         device: ":/docker/example"

## Secrets

    services:
      my_app:
        [...]
        secrets:
        - source: KEY1
          target: /opt/app/key.pem
          
     secrets:
       KEY1:
         file: secrets/key1.pem
         
## Health Checking

    services:
      my_app:
        [...]
        healthcheck:
           test: >
             curl --noproxy "*" -v -f -s http://127.0.0.1:8080/myapp
           interval: 15s
           timeout: 5s
           retries: 20
           start_period: 30s

## Setup Troubleshooting

### Couldn't connect to Docker daemon at http+docker://localhost - is it running?

Ensure systemd unit is configured correctly and has TCP socket configured. 
If not edit with `sudo systemctl edit docker.service` and provide

    [Service]
    ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375

Also set env var DOCKER_HOST

    export DOCKER_HOST=127.0.0.1:2375
