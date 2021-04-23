## CLI Usage

Podman is CLI compatible to Docker. See the [Docker cheat sheet](/cheat-sheet/Docker).

## Docker compatibility

By default Podman supports only OCI images, so some docker stuff like

    SHELL ["/bin/bash", "-o", "pipefail", "-c"]

does not work. To still use it switch to Docker format when building

    podman build --format docker .

## Running without root

Things to test

    cat /etc/subuid /etc/subgid                     # -> should print user definitions    
    getcap /usr/bin/newuidmap /usr/bin/newgidmap    # -> should print "cap_setuid+ep"

e.g. in a k8s build pod, might cause

    newuidmap: write to uid_map failed: Operation not permitted

Can be solved by

    chmod 4755 /usr/bin/newgidmap
    chmod 4755 /usr/bin/newuidmap
