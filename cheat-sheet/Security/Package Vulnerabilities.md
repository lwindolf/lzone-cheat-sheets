### Scanners

-   [Debian - Package Vulnerability
    Scanner](http://www.enyo.de/fw/software/debsecan/):

        debsecan                # all known
        debsecan --suite=sid            # all affecting this release
        debsecan --suite=sid --only-fixed   # all with solutions

-   [FreeBSD - Package Vulnerability
    Scanner](http://www.freebsd.org/doc/en/books/handbook/security-portaudit.html):

        portaudit -Fda

-   [Linux/UNIX Package Auditing with
    Nessus](https://www.tenable.com/blog/linuxunix-patch-auditing-using-nessus)

### Linux Distribution Tools

Distribution

Scanner

Rating

Description

Debian

[debsecan](http://www.enyo.de/fw/software/debsecan/)

superb

Easy to use. Maintained by the Debian testing team. Lists packages, CVE
numbers and details.

\
\

Ubuntu

[debsecan](https://bugs.launchpad.net/ubuntu/+source/debsecan/+bug/95925)

useless

They just packaged the Debian scanner without providing a database for
it! And since 2008 there is a
[bug](https://bugs.launchpad.net/ubuntu/+source/debsecan/+bug/95925)
about it being 100% useless.

\
\

CentOS Fedora Redhat

["yum
list-security"](http://www.cyberciti.biz/faq/redhat-fedora-centos-linux-yum-installs-security-updates/)

good

Provides package name and CVE number. Note: On older systems there is
only "yum list updates".

\
\

OpenSuSE

["zypper
list-patches"](http://doc.opensuse.org/documentation/html/openSUSE/opensuse-startup/cha.sw_cl.html)

ok

Provides packages names with security relevant updates. You need to
filter the list yourself or use the "--cve" switch to limit to CVEs
only.

\
\

SLES

["rug lu"](http://yourlinuxguy.com/?p=411)

ok

Provides packages names with security relevant updates. Similar to
zypper you need to do the filtering yourself.

\
\

Gentoo

[glsa-check](http://www.gentoo.org/doc/en/gentoolkit.xml)

bad

There is a dedicated scanner, but no documentation.

\
\

FreeBSD

[Portaudit](http://www.freshports.org/security/portaudit/)

superb

No Linux? Still a nice solution... Lists vulnerable ports and
vulnerability details.

### Patch Orchestration

-   [Ubuntu Landscape](https://landscape.canonical.com/) (commercial)
    -   USN based updates
-   [Redhat
    Satellite](https://access.redhat.com/products/red-hat-satellite)
    (commercial)
    -   RPM based updates, supports Redhat, Fedora, Solaris
-   [Redhat Spacewalk](https://duckduckgo.com/?t=lm&q=redhat+landscape)
    (OSS community version of Satellite)
-   [apt-dater](http://www.ibh.de/apt-dater/): Simple ncurses Debian
    batch installer

