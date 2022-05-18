---
related:
  cheat-sheet: [ 'Docker', 'Dockerfile', 'Podman']
---

## Commands

Note that most `docker` parameters can be used with Buildah.

    buildah login -u <user> -p <password> <repo>
    buildah info
    
    buildah images
    buildah rmi <image>
    
    buildah bud --format docker -t <tag> --build-arg key1=value1 --build-arg key2=value2

    buildah inspect <container|image>
    
    buildah unshare cat /proc/self/uid_map         # Run in effective user namespace
