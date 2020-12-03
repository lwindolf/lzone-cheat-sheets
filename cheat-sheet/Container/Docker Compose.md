## Setup Troubleshooting

### Couldn't connect to Docker daemon at http+docker://localhost - is it running?

Ensure systemd unit is configured correctly and has TCP socket configured. 
If not edit with `sudo systemctl edit docker.service` and provide

    [Service]
    ExecStart=/usr/bin/dockerd -H fd:// -H tcp://127.0.0.1:2375

Also set env var DOCKER_HOST

    export DOCKER_HOST=127.0.0.1:2375
