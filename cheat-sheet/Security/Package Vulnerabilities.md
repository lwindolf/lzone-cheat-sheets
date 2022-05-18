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

<table border="1">
<tbody><tr>
<th>Distribution</th>
<th>Scanner</th>
<th>Rating</th>
<th>Description</th>
</tr>
<tr>
<td>Debian</td>
<td><a href="http://www.enyo.de/fw/software/debsecan/">debsecan</a></td>
<td style="background:#aaffaa">superb</td>
<td>Easy to use. Maintained by the Debian testing team. Lists packages, CVE numbers and details.</td>
</tr>

<tr>
<td>Ubuntu</td>
<td><a href="https://bugs.launchpad.net/ubuntu/+source/debsecan/+bug/95925">debsecan</a></td>
<td style="background:#ffaaaa">useless</td>
<td>They just packaged the Debian scanner without providing a database for it!
And since 2008 there is a <a href="https://bugs.launchpad.net/ubuntu/+source/debsecan/+bug/95925">bug</a> about it being 100% useless.</td>
</tr>

<tr>
<td>CentOS
Fedora
Redhat</td>
<td><a href="http://www.cyberciti.biz/faq/redhat-fedora-centos-linux-yum-installs-security-updates/">"yum list-security"</a></td>
<td style="background:#cfc">good</td>
<td>Provides package name and CVE number. Note: On older systems there is only "yum list updates".</td>
</tr>

<tr>
<td>OpenSuSE</td>
<td><a href="https://doc.opensuse.org/documentation/html/openSUSE/opensuse-startup/cha.sw_cl.html">"zypper list-patches"</a></td>
<td style="background:#ffc">ok</td>
<td>Provides packages names with security relevant updates. You need to filter the list yourself or use the "--cve" switch to limit to CVEs only.</td>

</tr>

<tr>
<td>SLES</td>
<td><a href="http://yourlinuxguy.com/?p=411">"rug lu"</a></td>
<td style="background:#ffc">ok</td>
<td>Provides packages names with security relevant updates. Similar to zypper you need to do the filtering yourself.</td>

</tr>

<tr>
<td>Gentoo</td>
<td><a href="https://www.gentoo.org/doc/en/gentoolkit.xml">glsa-check</a></td>
<td style="background:#fec">bad</td>
<td>There is a dedicated scanner, but no documentation.</td>
</tr>

<tr>
<td>FreeBSD</td>
<td><a href="https://www.freshports.org/security/portaudit/">Portaudit</a></td>
<td style="background:#aaffaa">superb</td>
<td>No Linux? Still a nice solution... Lists vulnerable ports and vulnerability details.</td>
</tr>
</tbody></table>

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

