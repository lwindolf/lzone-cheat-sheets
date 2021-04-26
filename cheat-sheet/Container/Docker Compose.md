## CLI

     docker-compose up           # start docker-compose.yml from current dir
     docker-compose down

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

### Service

To assign a service a fixed IP

    services:
      app:
        image: busybox
        command: ifconfig
        networks:
          app_net:
            ipv4_address: 172.16.238.10
            ipv6_address: 2001:3984:3989::10

## Setup Troubleshooting

### Couldn't connect to Docker daemon at http+docker://localhost - is it running?

Ensure systemd unit is configured correctly and has TCP socket configured. 
If not edit with `sudo systemctl edit docker.service` and provide

    [Service]
    ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375

Also set env var DOCKER_HOST

    export DOCKER_HOST=127.0.0.1:2375
