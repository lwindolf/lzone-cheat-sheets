## CLI Usage

Podman is CLI compatible to Docker. See the [Docker cheat sheet](/cheat-sheet/Docker).

## Docker compatibility

By default Podman supports only OCI images, so some docker stuff like

    SHELL ["/bin/bash", "-o", "pipefail", "-c"]

does not work. To still use it switch to Docker format when building

    podman build --format docker .

## Running without root

Things to test 

    podman unshare cat /proc/self/uid_map

    cat /etc/subuid /etc/subgid                     # -> should print user definitions    
    getcap /usr/bin/newuidmap /usr/bin/newgidmap    # -> should print "cap_setuid+ep"
    
    sysctl -a | grep kernel.unprivileged_userns_clone  # -> should be "1"

If you change UID/GID mappings or the sysctl either reboot or

    podman system migrate

e.g. in a k8s build pod, might cause

    newuidmap: write to uid_map failed: Operation not permitted

Can be solved by

    chmod 4755 /usr/bin/newgidmap
    chmod 4755 /usr/bin/newuidmap

## Systemd Integration

    podman generate systemd --new --name <unit name>
    systemctl enable <unit name>
    systemctl start <unit name>

## Registry Configuration

See `/etc/containers/registries.conf`

To configure air-gapped mirror add:

    [[registry]]
    prefix = "docker.io"
    location = "mymirror.example.com/somepath"

## Handling other architectures

    # Check which architectures have been pulled
    podman image inspect docker.io/debian | jq -r '.[] | .Architecture'
    
    # Check which architectures are available
    podman manifest inspect docker.io/debian | grep architecture
    
    podman pull --arch=arm debian:latest

## Misc

- [Best Practices for Buildah in container](https://developers.redhat.com/blog/2019/08/14/best-practices-for-running-buildah-in-a-container)
- [Matrix of nested podman possibilities](https://www.redhat.com/sysadmin/podman-inside-container)
