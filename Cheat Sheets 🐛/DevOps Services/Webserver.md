---
related:
  cheat-sheet: ['Apache', 'Monitoring', 'nginx', 'Node.js', 'memcached']
---

## PHP

-   PHP - How to build Debian package for modules from PECL

        apt-get install dh-make-php
        dh-make-pecl <module name>
        cd <source directory>
        debuild
        # .deb package will be in ...

-   PHP - Manual module compiling

        # Ensure we see correct PHP
        export PATH=/usr/local/php5.7:$PATH
        cd <module source dir>
        phpize
        make
        sudo make install

-   PHP - PECL package management

        pecl list
        pecl list-files <name>
        pecl info <name>

        pecl install <name>
        pecl install <name>-<version>
        pecl uninstall <name>

        pecl list-upgrades
        pecl upgrade <name>

## Rails

-   [Passenger Tuning](http://blog.scoutapp.com/articles/2009/12/08/production-rails-tuning-with-passenger-passengermaxprocesses)

## CDN

-   [Linux HTTP/TCP Tuning for initcwnd](http://www.cdnplanet.com/blog/tune-tcp-initcwnd-for-optimum-performance/)

        ip route change default via <gateway> dev eth0 initcwnd 10

    consider also to increase net.ipv4.tcp\_wmem[1]

-   [initcwnd settings used by different CDNs](http://www.cdnplanet.com/blog/initcwnd-settings-major-cdn-providers/)

## Misc

-   [DNS Prefetching HTML](https://developer.mozilla.org/en-US/docs/Controlling_DNS_prefetching):

        # Turning it on/off globally
        <meta http-equiv="x-dns-prefetch-control" content="off">

        # Turning it on per-domain
        <link rel="dns-prefetch" href="http://www.spreadfirefox.com/">

-   [Setting up HAProxy](http://www.debian-administration.org/article/709/Using_the_haproxy_load-balancer_for_increased_availability)
-   Prevent out of ports on high traffic webserver due to FIN\_WAIT and
    other issues:

        # Ensure to maximize available ports
        cat /proc/sys/net/ipv4/ip_local_port_range
        echo 1024 65535 >/proc/sys/net/ipv4/ip_local_port_range

    and set sockets to reuse

        # sysctl -p
        net.ipv4.tcp_tw_reuse = 1
        net.ipv4.tcp_tw_recycle = 1

-   [gatling](https://github.com/gilt/gatling) - HTTP stress testing
-   [Jetty Tuning](https://wiki.eclipse.org/Jetty/Howto/High_Load#TCP_Buffer_Sizes)
    - Network sysctl settings
-   [Squid - Quick Test Proxy Setup](blog/How to Quickly Set up Squid)

