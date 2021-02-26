## CLI Usage

Podman is CLI compatible to Docker. See the [Docker cheat sheet](/cheat-sheet/Docker).

## Docker compatibility

By default Podman supports only OCI images, so some docker stuff like

    SHELL ["/bin/bash", "-o", "pipefail", "-c"]

does not work. To still use it switch to Docker format when building

    podman build --format docker .
