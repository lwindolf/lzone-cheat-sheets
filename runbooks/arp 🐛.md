## ARP Debugging

### Review Kernel Settings

Check whether ARP resolving is enabled: the `arp_ignore` setting should be 0

    sysctl net.ipv4.conf.all.arp_ignore

Check ARP garbage collection settings:

    sysctl -a 2>/dev/null | grep net.ipv4.neigh.default.gc

A typical problem on routers or large k8s cluster node is that the nodes ARP cache runs full 
because `gc_thres3` is to small. Note also that when `gc_thres1` is larger than the set of 
entries you usually cache no eviction will ever happen. 

Check ARP cache timeout settings:

    sysctl -a 2>/dev/null | grep net.ipv4.neigh.default.base_reachable

While you can query settings per network interface via `sysctl` too it’s easier to use 
`ip ntable show` to get an overview of effective settings per network interface:

    ip ntable show 

### Check ARP Cache

Print with

    ip neigh

Note how valid entries are marked as `REACHABLE` outdated entries are marked as `STALE`

Or if ARP tools are installed print ARP cache with `arp -a` or `arp -n` for table format.

    arp -a

### Clear ARP Cache

To clear the complete cache run

    ip -s -s neigh flush all

You can also run `arp -d `. To delete individual items run:

    arp -d <ip>

### Further Reading

* [https://www.baeldung.com/linux/arp-settings](https://www.baeldung.com/linux/arp-settings)
* [https://manpages.debian.org/bullseye/manpages/arp.7.en.html](https://manpages.debian.org/bullseye/manpages/arp.7.en.html)
