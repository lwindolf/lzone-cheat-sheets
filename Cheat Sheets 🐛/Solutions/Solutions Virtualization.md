Some simple decision matrix on Linux virtualization solutions

### Virtualization for Developers

Developers use virtualization to quickly spin up systems to test new
features. Either you use images build by some CI process or you ad-hoc
install machines with your automation/deployment/orchestration solution.
Solutions criterias:

-   Testing on laptops/desktop PCs:
    -   **LXC or Docker containers** on average PCs
    -   **Vagrant+VirtualBox** high-end PCs
-   Testing on self-hosted servers:
    -   **Docker** using CI-build images
    -   **KVM** with automation/deployment tool chain
-   Testing in the cloud:
    -   Choose a cloud with good self-service
    -   Self-service needs to be scriptable
    -   Connect CI-build chain with self-service script

### Container Virtualization

Which container solution should be used for development purposes?

Name

Pro

Contra

Pricing

-   See LXC
-   Easy image usage with many [online repos](https://registry.hub.docker.com/)
-   Widely used with Github
-   [Orchestration support](http://blog.docker.com/2015/02/orchestrating-docker-with-machine-swarm-and-compose/)

-   See LXC
-   Unclear relation to LXC and systemd
-   Uses cgroups like LXC and systemd
-   Why having LXC and Docker on your laptop?
-   Heavy downloads when using online images

Free

CoreOS Rocket

-   [App Container Specification](https://github.com/appc/spec/blob/master/SPEC.md)
-   Theoretically Multi-OS Apps

-   Young, uncertain future
-   Not a major distro

-   Light-weight alternative to Vagrant+VirtualBox
-   No HW virtualization needed

-   No image usage
-   Bad template support debootstrap
-   Not really supported by distributions
-   No resource limitations
-   No security

Free

?

-   Less known
-   Custom kernel (before Linux 4.0)
-   Incomplete /proc

Free (Virtuozzo is enterprise)
