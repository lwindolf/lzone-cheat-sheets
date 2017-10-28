This list is automatically compiled from Linux man pages. All examples
without any context are extracted. The idea is to be able to quickly
lookup syntax variants one already does know but needs a quick reminder
of. This is most useful combined with the search feature on the main
page.

### Examples for Mail

    Mailx  will  respond  by typing its version number and date and then listing the messages

### Examples for X

    XOrgFoundation(7),  XStandards(7),  Xsecurity(7), appres(1), bdftopcf(1), bitmap(1), editres(1),
    Xdmx(1), Xephyr(1), Xnest(1), Xquartz(1), Xvfb(1), Xvnc(1), XWin(1).  Xlib - C Language X Inter-
    X Window System is a trademark of The Open Group.
    X Version 11                                 xorg-docs 1.7                                         X(7)

### Examples for a2disconf

    a2disconf charset

### Examples for a2dismod

    a2dismod mime_magic

### Examples for a2dissite

    a2dissite 000-default

### Examples for a2enconf

    a2enconf security

### Examples for a2enmod

    a2enmod imagemap

### Examples for abcde

    abcde  Will work in most systems
    abcde -d /dev/cdrom2
    abcde -o vorbis,flac
    abcde -o vorbis:"-b 192"
    abcde -W 1
    abcde -d singletrack.flac
    abcde requires the following backend tools to work:
    abcde(1)

### Examples for alsaloop

    alsaloop -C hw:0,0 -P hw:1,0 -t 50000
    alsaloop  is  by  Jaroslav  Kysela  <perex@perex.cz>.   This  document  is  by  Jaroslav  Kysela

### Examples for amidi

    amidi -p hw:0 -s my_settings.syx
    amidi -S 'F0 43 10 4C 00 00 7E 00 F7'
    amidi -p hw:1,2 -S F0411042110C000000000074F7 -r dump.syx -t 1
    amidi -p virtual -d

### Examples for amixer

    amixer -c 1 sset Line,0 80%,40% unmute cap
    amixer -c 1 -- sset Master playback -20dB
    amixer -c 1 set PCM 2dB+
    amixer -c 2 cset iface=MIXER,name='Line Playback Volume",index=1 40%
    amixer -c 2 cset numid=34 40%
    amixer   is   by   Jaroslav   Kysela   <perex@perex.cz>.   This  document  is  by  Paul  Winkler

### Examples for aplay

    aplay -c 1 -t raw -r 22050 -f mu_law foobar

### Examples for apt-ftparchive

    apt-ftparchive packages directory | gzip > Packages.gz
    apt-ftparchive returns zero on normal operation, decimal 100 on error.

### Examples for apt-show-versions

    apt-show-versions
    apt-show-versions -u
    apt-show-versions -a -p libc6
    apt-show-versions dpkg apt
    apt-show-versions -r ^texlive

### Examples for apturl

    apturl apt:pidgin,pidgin-plugin-pack
    apturl apt:freevial?section=universe
    apturl apt:adobe-flashplugin?channel=lucid-partner
    apturl apt+http://launchpad.net/~mvo/ppa?package=2vcard
    apturl was written by Michael Vogt <michael.vogt@ubuntu.com> for Canonical, Ltd. and this manual

### Examples for arecord

    arecord -d 10 -f cd -t wav -D copy foobar.wav
    arecord -t wav --max-file-time 30 mon.wav
    arecord -f cd -t wav --max-file-time 3600 --use-strftime %Y/%m/%d/listen-%H-%M-%v.wav
    arecord and aplay are by Jaroslav Kysela <perex@perex.cz>  This  document  is  by  Paul  Winkler

### Examples for arpd

    arpd -b /var/tmp/arpd.db
    arpd -b /var/tmp/arpd.db -a 1 eth0 eth1
    arpd -b /var/tmp/arpd.db -a 3 -k eth0 eth1

### Examples for avconv

    avconv -f oss -i /dev/dsp -f video4linux2 -i /dev/video0 /tmp/out.mpg
    avconv -f x11grab -s cif -r 25 -i :0.0 /tmp/out.mpg
    avconv -f x11grab -s cif -r 25 -i :0.0+10,20 /tmp/out.mpg
    avconv -i /tmp/test%d.Y /tmp/out.mpg
    avconv -i /tmp/test.yuv /tmp/out.avi
    avconv -i mydivx.avi hugefile.yuv
    avconv -i /tmp/a.wav -s 640x480 -i /tmp/a.yuv /tmp/a.mpg
    avconv -i /tmp/a.wav -ar 22050 /tmp/a.mp2
    avconv -i /tmp/a.wav -map 0:a -b 64k /tmp/a.mp2 -map 0:a -b 128k /tmp/b.mp2
    avconv -i snatch_1.vob -f avi -c:v mpeg4 -b:v 800k -g 300 -bf 2 -c:a libmp3lame -b:a 128k snatch.avi

### Examples for awk

    awk '/myhome.html/ { system("nmap " $1 ">> logdir/myhome.html") }'

### Examples for bar

    bar-brace-foreground: red
    bar-brace-bold: no
    bar-foreground: yellow
    bar-bold: yes

### Examples for basename

    basename /usr/bin/sort
    basename include/stdio.h .h
    basename -s .h include/stdio.h
    basename -a any/str1 any/str2

### Examples for bpsync

    bpsync put
    bpsync get
    bpsync get mydev

### Examples for byobu-ugraph

    byobu-ugraph "(/usr/lib/byobu/mem_used | sed -e 's/% //g';echo)"
    byobu-ugraph -m 3.0 -f $file

### Examples for byobu-ulevel

    byobu-ulevel 27
    byobu-ulevel -c 27
    byobu-ulevel -c 1.100001 -m -5.00234 -x 2.71828 -t dice_6
    byobu-ulevel -m -22.613 -x 5.00212 -c 0.10203 -a -e 0
    byobu-ulevel -c 83 -t stars_2
    byobu-ulevel -c 60 -t diamonds_2 -ri
    byobu-ulevel -l -t solid_numbers_a_10
    byobu-ulevel -c 666.321 -m -273.15 -x 1370 -u ". " -w 10
    byobu-ulevel -c 50 -u "a b c d e f g h i j"

### Examples for cat

    cat f - g
    cat    Copy standard input to standard output.

### Examples for cdparanoia

    cdparanoia -vsQ
    cdparanoia -B
    cdparanoia "1[:30.12]-1[1:10]"
    cdparanoia -- -3
    cdparanoia  sprang  from  and  once  drew  heavily  from  the  interface  of  Heiko  Eissfeldt's
    cdparanoia's homepage may be found at: http://www.xiph.org/paranoia/

### Examples for chacl

    chacl u::rwx,g::r-x,o::r-- file
    chacl u::rwx,g::r-x,o::r--,u:bob:r--,m::r-x file1 file2
    chacl -b `chacl -l olddir | \
    chacl can replace the existing ACL.  To add or delete entries, you must first do chacl -l to get

### Examples for chgrp

    chgrp staff /u
    chgrp -hR staff /u

### Examples for chown

    chown root /u
    chown root:staff /u
    chown -hR root /u
    chown(2)

### Examples for comm

    comm -12 file1 file2
    comm -3 file1 file2

### Examples for cryptsetup-reencrypt

    cryptsetup-reencrypt /dev/sdb1
    cryptsetup-reencrypt /dev/sdb1 -c aes-xts-plain64
    cryptsetup-reencrypt /dev/sdb1 --new --reduce-device-size 4096
    cryptsetup-reencrypt                           June 2012                        CRYPTSETUP-REENCRYPT(8)

### Examples for cupsctl

    cupsctl
    cupsctl --debug-logging
    cupsctl | grep '^_debug_logging' | awk -F= '{print $2}'
    cupsctl --no-share-printers

### Examples for date

    date,  and numbers.  An empty string indicates the beginning of the day.  The date string format

### Examples for dbus-launch

    dbus-launch --exit-with-session gnome-session
    dbus-launch --exit-with-session openbox
    dbus-launch --exit-with-session ~/.xsession

### Examples for dbwrap\_tool

    dbwrap_tool --persistent winbindd_idmap.tdb listkeys
    dbwrap_tool --persistent winbindd_idmap.tdb fetch "USER HWM" uint32
    dbwrap_tool --persistent winbindd_idmap.tdb remove "USER HWM"
    dbwrap_tool --persistent winbindd_idmap.tdb store "USER HWM" hex D6000000

### Examples for dcut

    dcut makes use of the dput configuration files:

### Examples for ddate

    ddate(1)  will produce undefined behavior if asked to produce the date for St. Tib's day and its

### Examples for debconf

    debconf --frontend=readline sh -x my-shell-prog
    debconf-devel(7), debconf(7)

### Examples for debconf-apt-progress

    debconf-apt-progress -- aptitude -y install gnome x-window-system-dev
    debconf-apt-progress --start
    debconf-apt-progress --from 0 --to 45 -- apt-get -y install gnome
    debconf-apt-progress --from 45 --to 90 -- apt-get -y install kde
    debconf-apt-progress --from 90 --to 100 -- apt-get -y install xfce4
    debconf-apt-progress --stop

### Examples for debconf-copydb

    debconf-copydb configdb backup
    debconf-copydb configdb newdb --pattern='^slrn/' \
    debconf-copydb configdb stdout -c Name:stdout -c Driver:Pipe \
    debconf-copydb configdb pipe --config=Name:pipe \

### Examples for debsecan

    debsecan --suite suite --format packages --only-fixed
    debsecan --suite suite --format report \
    debsecan was written by Florian Weimer.

### Examples for debsnap

    debsnap -a amd64 xterm 256-1
    debsnap -a armel xterm
    debsnap --binary xterm 256-1
    debsnap --binary xterm

### Examples for debuild

    debuild -i -us -uc -b
    debuild --lintian-opts -i
    debuild -k0x12345678

### Examples for devhelp

    devhelp
    devhelp -s search-string

### Examples for dget

    dget --all mypackage=1.2-1
    dget package should be implemented in apt-get install -d.

### Examples for dh

    dh binary-arch --no-act
    dh $@
    dh $@
    dh_strip -Xfoo
    dh_auto_configure -- --with-foo --disable-bar
    dh $@
    dh $@
    dh_fixperms
    dh $@ --with autotools_dev
    dh $@ --with python2
    dh $@ --buildsystem=perl_build
    dh $@ --sourcedirectory=src
    dh $@ --builddirectory=build
    dh $@ --parallel
    dh $@

### Examples for dh\_autotools-dev\_restoreconfig

    dh_autotools-dev_restoreconfig is usually called indirectly in a rules file via the dh command.
    dh_autotools-dev_restoreconfig

### Examples for dh\_autotools-dev\_updateconfig

    dh_autotools-dev_updateconfig is usually called indirectly in a rules file via the dh command.
    dh_autotools-dev_updateconfig

### Examples for dh\_link

    dh_link usr/share/man/man1/foo.1 usr/share/man/man1/bar.1
    dh_link var/lib/foo usr/lib/foo \

### Examples for dh\_makeshlibs

    dh_makeshlibs
    dh_makeshlibs -V
    dh_makeshlibs -V 'libfoobar1 (>= 1.0)'

### Examples for dh\_shlibdeps

    dh_shlibdeps
    dh_shlibdeps -Llibbar1 -l/usr/lib/bar

### Examples for dirname

    dirname /usr/bin/
    dirname dir1/str dir2/str
    dirname stdio.h

### Examples for dirsplit

    dirsplit is created by Eduard Bloch (blade@debian.org) and is licensed under the GPLv2.
    dirsplit 0.3                                   March 2004                                   DIRSPLIT(1)

### Examples for dot

    dotty(1),tcldot(n),xcolors(1),libgraph(3).

### Examples for dpkg

    dpkg -l '*vi*'
    dpkg --print-avail elvis vim | less
    dpkg -r elvis
    dpkg -i vim_4.5-3.deb
    dpkg --get-selections >myselections
    dpkg --merge-avail "$avail"
    dpkg --clear-selections
    dpkg --set-selections <myselections
    dpkg.cfg(5), and dpkg-reconfigure(8).

### Examples for dpkg-architecture

    dpkg-architecture -elinux-alpha
    dpkg-architecture -amips -elinux-mips
    dpkg-architecture -ilinux-any
    dpkg-architecture -ai386 -ilinux-any

### Examples for dpkg-buildflags

    dpkg-buildflags and storing the build flags in make variables.

### Examples for dpkg-divert

    dpkg-divert --divert /usr/bin/example.foo --rename /usr/bin/example
    dpkg-divert --rename --remove /usr/bin/example
    dpkg-divert --package wibble --divert /usr/bin/example.foo --rename /usr/bin/example
    dpkg-divert --package wibble --rename --remove /usr/bin/example

### Examples for dpkg-name

    dpkg-name bar-foo.deb

### Examples for duplicity

    duplicity /home/me sftp://uid@other.host/some_dir
    duplicity full /home/me sftp://uid@other.host/some_dir
    duplicity --full-if-older-than 1M /home/me sftp://uid@other.host/some_dir
    duplicity sftp://uid@other.host/some_dir /home/me
    duplicity -t 3D --file-to-restore Mail/article sftp://uid@other.host/some_dir
    duplicity verify sftp://uid@other.host/some_dir /home/me
    duplicity --exclude /mnt --exclude /tmp --exclude /proc / file:///usr/local/backup
    duplicity --include /home --include /etc --exclude '**' / file:///usr/local/backup
    duplicity detects in what mode it should switch to by the order of target URL and local folder.

### Examples for eject

    eject
    eject cdrom
    eject /dev/cdrom
    eject /mnt/cdrom/
    eject hdd
    eject sda
    eject sda4
    eject -v -c4 /dev/cdrom
    eject -a on /dev/sbpcd

### Examples for fakeroot

    fakeroot  was  specifically  written to enable users to create Debian GNU/Linux packages (in the
    fakeroot is a regular, non-setuid program. It does not enhance a user's privileges, or  decrease
    fakeroot  environment,  it  should  be  set  relative  to  the   given   paths,   as   in
    fakeroot doesn't wrap open(), create(), etc. So, if user joost does either
    fakeroot
    fakeroot
    fakeroot has no way of knowing that in the first case, the owner of foo really should  be
    fakeroot  .   It turned out that a minor upgrade of libc (from one where the stat() func-
    fakeroot, in effect, is changing the way the system behaves. Programs that probe the sys-

### Examples for fc-list

    fc-list
    fc-list :lang=hi
    fc-list : family style file spacing

### Examples for fiascotopnm

    fiascotopnm foo.wfa >foo.ppm
    fiascotopnm -o foo1.wfa foo2.wfa
    fiascotopnm -oimage foo1.wfa
    fiascotopnm --fast --magnify=-1 --double video.wfa >stream.ppm

### Examples for file

    file.c:   C program text
    file:     ELF 32-bit LSB executable, Intel 80386, version 1 (SYSV),
    file.c:      text/x-c
    file:        application/x-executable
    file returns 0 on success, and non-zero on error.

### Examples for filterdiff

    filterdiff -i '*.c' --lines=-5 < patch
    filterdiff -#1 patchfile
    filterdiff -p1 Changelog
    filterdiff --lines=1 patchfile | lsdiff | \
    filterdiff -p1 -i file.c -#2- foo-patch
    filterdiff -#1,2,5-8,10,12,27-
    filterdiff --as-numbered-lines=after patch.file
    filterdiff --as-numbered-lines=before
    filterdiff -v --format=unified context.diff

### Examples for find

    find /tmp -name core -type f -print | xargs /bin/rm -f
    find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f
    find . -type f -exec file '{}' \;
    find / \
    find $HOME -mtime 0
    find /sbin /usr/sbin -executable \! -readable -print
    find . -perm 664
    find . -perm -664
    find . -perm /222
    find . -perm /220
    find . -perm /u+w,g+w
    find . -perm /u=w,g=w
    find . -perm -220
    find . -perm -g+w,u+w
    find . -perm -444 -perm /222 ! -perm /111
    find . -perm -a+r -perm /a+w ! -perm /a+x
    find . -name .snapshot -prune -o \( \! -name *~ -print0 \)|

### Examples for findmnt

    findmnt --fstab -t nfs
    findmnt --fstab /mnt/foo
    findmnt --fstab --target /mnt/foo
    findmnt --fstab --evaluate
    findmnt -n --raw --evaluate --output=target LABEL=/boot
    findmnt --poll --target /mnt/foo
    findmnt --poll=umount --first-only --target /mnt/foo
    findmnt --poll=remount -t ext3 -O ro

### Examples for foo2hbpl2

    foo2hbpl2-wrapper(1), hbpldecode(1)

### Examples for foo2hbpl2-wrapper

    foo2hbpl2-wrapper testpage.ps > testpage.prn
    foo2hbpl2-wrapper -c testpage.ps > testpage.prn

### Examples for foo2hiperc

    foo2hiperc-wrapper(1), hipercdecode(1)

### Examples for foo2hiperc-wrapper

    foo2hiperc-wrapper testpage.ps > testpage.hc
    foo2hiperc-wrapper -c testpage.ps > testpage.hc

### Examples for foo2hp

    foo2hp2600-wrapper(1), zjsdecode(1)

### Examples for foo2hp2600-wrapper

    foo2hp2600-wrapper testpage.ps > testpage.zm
    foo2hp2600-wrapper -c testpage.ps > testpage.zc

### Examples for foo2lava

    foo2lava-wrapper(1), lavadecode(1)

### Examples for foo2lava-wrapper

    foo2lava-wrapper testpage.ps > testpage.zm
    foo2lava-wrapper -c testpage.ps > testpage.zc

### Examples for foo2oak

    foo2oak-wrapper(1), oakdecode(1)

### Examples for foo2oak-wrapper

    foo2oak-wrapper testpage.ps > testpage.oak
    foo2oak-wrapper -c testpage.ps > testpage.oak

### Examples for foo2qpdl

    foo2qpdl-wrapper(1), qpdldecode(1)

### Examples for foo2qpdl-wrapper

    foo2qpdl-wrapper testpage.ps > testpage.zm
    foo2qpdl-wrapper -c testpage.ps > testpage.zc

### Examples for foo2slx

    foo2slx-wrapper(1), slxdecode(1)

### Examples for foo2slx-wrapper

    foo2slx-wrapper testpage.ps > testpage.zm
    foo2slx-wrapper -c testpage.ps > testpage.zc

### Examples for foo2xqx

    foo2xqx-wrapper(1), xqxdecode(1)

### Examples for foo2xqx-wrapper

    foo2xqx-wrapper testpage.ps > testpage.xqx

### Examples for foo2zjs

    foo2zjs-wrapper(1), zjsdecode(1)

### Examples for foo2zjs-wrapper

    foo2zjs-wrapper testpage.ps > testpage.zm
    foo2zjs-wrapper -c testpage.ps > testpage.zc

### Examples for fstab-decode

    fstab-decode umount $(awk '$3 == vfat { print $2 }' /etc/fstab)

### Examples for funzip

    funzip test.zip | more
    funzip test.zip > /dev/null

### Examples for fuser

    fuser -km /home
    fuser telnet/tcp
    fuser  may  only  be able to gather partial information unless run with privileges.  As a conse-
    fuser -m /dev/sgX will show (or kill with the -k flag) all processes, even  if  you  don't  have
    fuser  cannot  report  on  any  processes  that  it  doesn't have permission to look at the file

### Examples for gconftool

    gconftool-2 --get /desktop/gnome/background/picture_filename
    gconftool-2 --type string --set /desktop/gnome/interface/font_name "Serif 12"
    gconftool-2 2.2.1                            February 2006                               GCONFTOOL-2(1)

### Examples for gconftool-2

    gconftool-2 --get /desktop/gnome/background/picture_filename
    gconftool-2 --type string --set /desktop/gnome/interface/font_name "Serif 12"
    gconftool-2 2.2.1                            February 2006                               GCONFTOOL-2(1)

### Examples for gem

    gem1.9.1 install rake
    gem1.9.1 list --local
    gem1.9.1 build package.gemspec
    gem1.9.1 help install
    gem1.9.1 1.0.0                                  Dec 2007                                    GEM1.9.1(1)

### Examples for gem1.9.1

    gem1.9.1 install rake
    gem1.9.1 list --local
    gem1.9.1 build package.gemspec
    gem1.9.1 help install
    gem1.9.1 1.0.0                                  Dec 2007                                    GEM1.9.1(1)

### Examples for genisoimage

    genisoimage may safely be installed suid root. This may be needed to allow genisoimage  to  read

### Examples for getbuildlog

    getbuildlog hello 2\.2-1 amd64
    getbuildlog glibc "" mips.*
    getbuildlog wesnoth .*bpo.*

### Examples for getopt

    getopt(3) can parse long options with optional arguments that are given an empty optional  argu-
    getopt(3), bash(1), tcsh(1).

### Examples for gitk

    gitk v2.6.12.. include/scsi drivers/scsi
    gitk --since="2 weeks ago" -- gitk
    gitk --max-count=100 --all -- Makefile

### Examples for gnome-open

    gnome-open www.gnome.org
    gnome-open Spinach.odf
    gnome-open ~
    gnome-open mailto:gnome-list@mail.gnome.org
    gnome-open /usr/share/applications/gedit.desktop

### Examples for gpg

    gpg -se -r Bob file
    gpg --clearsign file
    gpg -sb file
    gpg -u 0x12345678 -sb file
    gpg --list-keys user_ID
    gpg --fingerprint user_ID
    gpg --verify pgpfile
    gpg --verify sigfile
    gpgsm  also  accepts colons between each pair of hexadecimal digits because this is the de-facto

### Examples for gpg-agent

    gpg-agent.conf

### Examples for gpg-zip

    gpg-zip --encrypt --output test1 --gpg-args  -r Bob"" mydocs
    gpg-zip --list-archive test1

### Examples for gpgv

    gpgv pgpfile
    gpgv sigfile [datafile]

### Examples for gpo

    gpo
    gpo update && gpo download
    gpo search linux outlaws
    gpo youtube http://youtube.com/watch?v=oHg5SJYRHA0
    gpo webui
    gpo pipe
    gpodder(1)
    gpodder 3.5.2                                September 2013                                      GPO(1)

### Examples for groff

    groff -p -t -me -T latin1 foo.me
    groffer foo.me
    groff source package.
    groff.
    groff is a GNU free software project.  All parts of the groff package are protected by GNU copy-
    groffer(1), gxditview(1), xditview(1x).
    groff(1), grog(1).
    groff(7), groff_char(7), groff_diff(7), groff_font(5).
    groff_out(7).
    groff_tmac(5),  groff_man(7),  groff_mdoc(7),  groff_me(7),  groff_mm(7),  groff_mmse(7),
    groff_mom(7), groff_ms(7), groff_www(7), groff_trace(7), mmroff(7).

### Examples for grog

    grog meintro.me
    grog pic.ms
    grog meintro.me pic.ms
    grog: error: there are several macro packages: -me -ms
    grog -ksS -Tdvi grnexmpl.g

### Examples for growisofs

    growisofs -Z /dev/dvd -R -J /some/files
    growisofs -M /dev/dvd -R -J /more/files
    growisofs -M /dev/dvd=/dev/zero
    growisofs -dvd-compat -Z /dev/dvd=image.iso
    growisofs is distributed under GNU GPL.

### Examples for gvmap

    gvmap.sh -Ae -Ecolor=#55555522 -Tpng foo.gv > foo.png
    gvmap.sh(1), sfdp(1), neato(1), gvpr(1)

### Examples for gvmap.sh

    gvmap.sh -Ae -Ecolor=#55555522 -Tpng foo.gv > foo.png

### Examples for gvpack

    gvpack unsets the bounding box attribute of all non-cluster subgraphs.

### Examples for gvpr

    gvpr -i 'N[color=="blue"]' file.gv
    gvpr -c 'N[color=="blue"]{color = "red"}' file.gv
    gvpr -c ""

### Examples for h2xs

    h2xs rpcsvc/rusers
    h2xs -n RUSERS rpcsvc/rusers
    h2xs rpcsvc::rusers
    h2xs -n ONC::RPC rpcsvc/rusers
    h2xs -c rpcsvc/rusers
    h2xs -cfn RPC
    h2xs -cfn ONC::RPC
    h2xs -X My::Module
    h2xs -b 5.5.3 -n Lib::Foo foo.h
    h2xs -b 5.5.3 -e '^bar_' -n Lib::Foo foo.h
    h2xs rpcsvc/rusers -L/opt/net/lib -lrpc
    h2xs -n DCE::rgynbase -p sec_rgy_ dce/rgynbase
    h2xs -n DCE::rgynbase -p sec_rgy_ \
    h2xs -xAn perl1 -F "-DEXT=extern -DdEXT= -DINIT\(x\)=" perl.h
    h2xs -xAn perl2 perl.h,proto.h
    h2xs -M '^av_' -xAn perl2 perl.h,proto.h
    h2xs -o '^[S]V \*$' -M '^av_' -xAn perl2 perl.h,proto.h
    h2xs -Afn Ext::Ension
    h2xs -Oxan Ext::Ension interface_simple.h interface_hairy.h
    h2xs looks for header files after changing to the extension directory, so it will find your

### Examples for hp-probe

    hp-probe -bnet
    hp-probe -busb -escan
    hp-probe -bnet -slnx -escan,pcard
    hp-probe -bcups
    hp-probe

### Examples for htdbm

    htdbm /usr/local/etc/apache/.htdbm-users jsmith
    htdbm -c /home/doe/public_html/.htdbm jane
    htdbm -mb /usr/web/.htdbm-all jones Pwd4Steve

### Examples for htpasswd

    htpasswd /usr/local/etc/apache/.htpasswd-users jsmith
    htpasswd will do nothing except return an error.
    htpasswd -c /home/doe/public_html/.htpasswd jane
    htpasswd will display a message and return an error status.
    htpasswd -db /usr/web/.htpasswd-all jones Pwd4Steve

### Examples for httxt2dbm

    httxt2dbm -i rewritemap.txt -o rewritemap.dbm
    httxt2dbm -f SDBM -i rewritemap.txt -o rewritemap.dbm

### Examples for ibus-table-createdb

    ibus-table-createdb -n ipa-x-sampa.db -s ipa-x-sampa.txt
    ibus-table-createdb -i -n ipa-x-sampa.db

### Examples for iecset

    iecset -Dhw:1
    iecset -x
    iecset pro off audio off

### Examples for ifdown

    ifdown -a

### Examples for ifquery

    ifquery -l
    ifquery -l --allow=hotplug
    ifquery eth0

### Examples for ifup

    ifup -a
    ifup eth0
    ifup eth0=home
    ifup, ifdown, and ifquery are actually the same program called by different names.

### Examples for igawk

    igawk -f test.awk

### Examples for info

    info   show top-level dir menu
    info info
    info info-stnd
    info emacs
    info emacs buffers
    info --show-options emacs
    info --subnodes -o out.txt emacs
    info -f ./foo.info
    info@gnu.org.
    info info
    info 5.2                                     September 2013                                     INFO(1)

### Examples for inkscape

    inkscape filename.svg
    inkscape filename.svg -p '| lpr'
    inkscape filename.svg --export-png=filename.png
    inkscape filename.svg --export-png=filename.png -w600 -h400
    inkscape filename.svg --export-png=filename.png --export-area-drawing
    inkscape filename.svg --export-id=text1555 --export-use-hints
    inkscape filename.svg --export-id=text1555 --export-png=text.png --export-area-snap
    inkscape filename1.svg --export-plain-svg=filename2.svg
    inkscape filename.svg --export-eps=filename.eps --export-text-to-path
    inkscape filename.svg --query-width --query-id text1555
    inkscape filename.svg --select=path1555 --verb=EditDuplicate --verb=ObjectRotate90 --verb=FileSave --verb=FileClose

### Examples for intel\_gpu\_top

    intel_gpu_top -o "cairo-trace-gvim.log" -s 100 -e "cairo-perf-trace /tmp/gvim"

### Examples for intel\_reg\_read

    intel_reg_read 0x61230

### Examples for intel\_reg\_write

    intel_reg_write 0x61230 0x0

### Examples for interdiff

    interdiff -z 3.2pre1.patch.gz 3.2pre2.patch.gz
    interdiff patch /dev/null
    interdiff /dev/stdin /dev/null
    interdiff. In this case, the strategy employed is to revert the original patch and apply the new

### Examples for intltool-update

    intltool-update --pot --gettext-package=foo
    intltool-update --dist --gettext-package=bar --output-file=xy1.po xy
    intltool-update xy

### Examples for ipptool

    ipptool ipp://localhost/printers/myprinter get-completed-jobs.test
    ipptool -d recipient=mailto:user@example.com         ipp://localhost/printers/myprinter create-printer-subscription.test
    ipptoolfile(5), RFC 2911,

### Examples for itweb-settings

    itweb-settings
    itweb-settings reset deployment.proxy.type

### Examples for join-dctrl

    join-dctrl(1)

### Examples for jpegtopnm

    jpegtopnm foo.jpg >foo.ppm
    jpegtopnm foo.jpg | ppmtopgm | pnmscale .25
    jpegtopnm and this man page were derived in large part  from  djpeg,  by  the  Independent  JPEG

### Examples for json\_pp

    json_pp -f json -t dumper -json_opt pretty,utf8,allow_bignum
    json_pp -f json -t dumper -json_opt pretty

### Examples for json\_xs

    json_xs -t none <isitreally.json
    json_xs -f storable-file <file
    json_xs -f storable-file -t yaml <file
    json_xs -f none -e '$_ = [1, 2, 3]'

### Examples for keytool

    keytool -genkeypair -dname "cn=Mark Jones, ou=Java, o=Oracle, c=US"
    keytool -genkeypair
    keytool -certreq -file MarkJ.csr

### Examples for kill

    kill -9 -1
    kill -l 11
    kill -L
    kill 123 543 2341 3453
    kill(2), killall(1), nice(1), pkill(1), renice(1), signal(7), skill(1)

### Examples for knock

    knock myserver.example.com 123:tcp 456:udp 789:tcp
    knock -u myserver.example.com 8284 4721 18592 42912
    knockd is the accompanying port-knock server.
    knockd 0.5                                   June 26, 2005                                     knock(1)

### Examples for lame

    lame sample.wav sample.mp3
    lame -h sample.wav sample.mp3
    lame -b 112 sample.wav sample.mp3
    lame -m s sample.wav sample.mp3
    lame -f sample.wav sample.mp3
    lame -h -V 6 sample.wav sample.mp3
    lame --preset standard sample.wav sample.mp3

### Examples for lexgrog

    lexgrog  attempts  to  parse  files containing .so requests, but will only be able to do so cor-

### Examples for lft

    lft, the sysadmin needs to read the file /usr/share/doc/lft/HOWTO-UsersLFT.txt and follow the

### Examples for liblinear-predict

    liblinear-predict -b 1 test_file data_file.model output_file
    liblinear-predict was written by the LIBLINEAR authors at National  Taiwan  university  for  the

### Examples for liblinear-train

    liblinear-train data_file
    liblinear-train -s 0 data_file
    liblinear-train -v 5 -e 0.001 data_file
    liblinear-train -c 10 -w1 2 -w2 5 -w3 2 four_class_data_file
    liblinear-train -c 10 -w3 1 -w2 5 two_class_data_file
    liblinear-train  was written by the LIBLINEAR authors at National Taiwan university for the LIB-

### Examples for libvirt-migrate-qemu-disks

    libvirt-migrate-qemu-disks is Copyright 2010, Canonical Ltd.
    libvirt-migrate-qemu-disks and this manual page  was  originally  written  by  Jamie  Strandboge

### Examples for libvirt-migrate-qemu-machinetype

    libvirt-migrate-qemu-machinetype is Copyright 2012, Canonical Ltd.
    libvirt-migrate-qemu-machinetype by Serge Hallyn <serge.hallyn@canonical.com>.

### Examples for libvirtd

    libvirtd (libvirt) 0.8.2
    libvirtd is distributed under the terms of the GNU LGPL v2.1+.  This is free software; see the

### Examples for lintian

    lintian-info(1), Lintian User Manual (file:/usr/share/doc/lintian/lintian.html/index.html)

### Examples for localedef

    localedef -f UTF-8 -i fi_FI fi_FI.UTF-8
    localedef -f UTF-8 -i fi_FI ./

### Examples for locate

    locate -b '\NAME'
    locate attempts to be compatible to slocate (without the options used  for  creating  databases)

### Examples for lockfile-create

    lockfile-create /some/file

### Examples for lockfile-remove

    lockfile-remove /some/file

### Examples for lockfile-touch

    lockfile-touch /some/file &

### Examples for logger

    logger System rebooted
    logger -p local0.notice -t HOSTIDM -f /dev/idmc
    logger -n loghost.example.com System rebooted

### Examples for lp

    lp -d foo -o media=legal -o sides=two-sided-long-edge filename
    lp -d bar -o scaling=200 filename
    lp -d bar -o cpi=12 -o lpi=8 -o page-left=72 filename

### Examples for lsdiff

    lsdiff patch | sort -u | \
    lsdiff -s patch | grep '^+' | \
    lsdiff -n patch | (while read n file

### Examples for lshw

    lshw -short
    lshw -class disk -class storage
    lshw -html -class network
    lshw -disable dmi
    lshw is distributed under the GNU GENERAL PUBLIC LICENSE (GPL) version 2.
    lshw is maintained by Lyonel Vincent <lyonel@ezix.org>.

### Examples for lsof

    lsof distribution.
    lsof
    lsof -i -U
    lsof -i 4 -a -p 1234
    lsof -i 6
    lsof -i @wonderland.cc.purdue.edu:513-515
    lsof -i @mace
    lsof -p 456,123,789 -u 1234,abe
    lsof /dev/hd4
    lsof /u/abe/foo
    lsof /dev/log
    lsof -b /nfs/mount/point
    lsof -bw /nfs/mount/point
    lsof -Di
    lsof -FpcfDi
    lsof -c lsof -a -d 1 -d 3 -u abe -r10
    lsof -c /^..o.$/i -a -d cwd
    lsof -i@128.210.15.17
    lsof -i@[0:1:2:3:4:5:6:7]
    lsof -i@[::1]
    lsof -rm====%T====

### Examples for man

    man ls
    man -a intro
    man -t alias | lpr -Pps
    man -l -Tdvi ./foo.1x.gz > ./foo.1x.dvi
    man -k printf
    man -f smail
    man will search for the desired manual pages within the index database caches. If the -u  option
    man will compress and store the cat file in the background.

### Examples for mawk

    mawk, on the other hand, allows RS to be a regular expression.  When "\n" appears in records, it

### Examples for meld

    meld
    meld FILE1
    meld DIR1
    meld FILE1 FILE2
    meld FILE1 FILE2 FILE3
    meld DIR1 DIR2
    meld DIR1 DIR2 DIR3
    meld --diff FILE1 FILE2 --diff FILE3 FILE4

### Examples for mkinitramfs

    mkinitramfs -o ~/tmp/initramfs-$(uname -r)
    mkinitramfs -k -o ~/tmp/initramfs-2.6.21-686 2.6.21-686

### Examples for mlocate

    mlocate                                         Sep 2012                                      locate(1)

### Examples for ncat

    ncat example.org 8080
    ncat -l 8080
    ncat --sh-exec "ncat example.org 80" -l 8080 --keep-open
    ncat --exec "/bin/bash" -l 8081 --keep-open
    ncat --exec "/bin/bash" --max-conns 3 --allow 192.168.0.0/24 -l 8081 --keep-open
    ncat --proxy socks4host --proxy-type socks4 --proxy-auth user smtphost 25
    ncat -l --proxy-type http localhost 8888

### Examples for nmblookup

    nmblookup can be used to query a WINS server (in the same way nslookup is used to query DNS
    nmblookup -U server -R 'name'
    nmblookup -U samba.org -R 'IRIX#1B'

### Examples for nmcli

    nmcli -t -f RUNNING nm
    nmcli -t -f STATE nm
    nmcli nm wifi off
    nmcli -p con list
    nmcli -f name,autoconnect con list
    nmcli con list id "My wired connection"
    nmcli -p con up id "My wired connection" iface eth0
    nmcli con up uuid 6b028a27-6dc9-4411-9886-e9ad1dd43761 ap 00:3A:98:7C:42:D3
    nmcli dev status
    nmcli dev disconnect iface em2
    nmcli -f GENERAL,WIFI-PROPERTIES dev list iface wlan0
    nmcli dev wifi
    nmcli dev wifi con "Cafe Hotspot 1" password caffeine name "My cafe"

### Examples for ntfs-3g

    ntfs-3g /dev/sda1 /mnt/windows
    ntfs-3g -o permissions /dev/sda3 /mnt/data
    ntfs-3g /dev/sda5 /home/user/mnt -o ro,uid=1000
    ntfs-3g was based on and a major improvement to ntfsmount and libntfs which were written by Yura
    ntfs-3g.probe(8), ntfsprogs(8), attr(5), getfattr(1)
    ntfs-3g 2013.1.13AR.1                           May 2012                                     NTFS-3G(8)

### Examples for ntfs-3g.secaudit

    ntfs-3g.secaudit -ar /dev/sda1
    ntfs-3g.secaudit /dev/sda5 /audio/music
    ntfs-3g.secaudit -r /dev/sda5 644 /audio/music
    ntfs-3g.secaudit exits with a value of 0 when no error was detected, and with a value of 1  when
    ntfs-3g.secaudit has been developed by Jean-Pierre Andre.
    ntfs-3g.secaudit 1.4.1                       February 2010                          NTFS-3G.SECAUDIT(8)

### Examples for ntfs-3g.usermap

    ntfs-3g.usermap /dev/sda1
    ntfs-3g.usermap  exits  with a value of 0 when no error was detected, and with a value of 1 when
    ntfs-3g.usermap 1.1.2                        February 2010                           NTFS-3G.USERMAP(8)

### Examples for ntfscat

    ntfscat /dev/hda1 boot.ini
    ntfscat /dev/hda1 /winnt/system32/drivers/etc/hosts
    ntfscat /dev/hda1 -a INDEX_ROOT -i 5 | hexdump -C
    ntfscat was written by Richard Russon, Anton Altaparmakov and Szabolcs Szakacsits.  It was port-
    ntfscat is part of the ntfs-3g package and is available from:

### Examples for ntfsclone

    ntfsclone --overwrite /dev/hdc1 /dev/hda1
    ntfsclone --save-image --output backup.img /dev/hda1
    ntfsclone --restore-image --overwrite /dev/hda1 backup.img
    ntfsclone --save-image -o - /dev/hda1 | gzip -c > backup.img.gz
    ntfsclone --restore-image --overwrite /dev/hda1 -
    ntfsclone --save-image --output - /dev/hda1 | \
    ntfsclone --restore-image --overwrite /dev/hda1 -
    ntfsclone --restore-image --overwrite /dev/hda1 -
    ntfsclone --output ntfs-clone.img /dev/hda1
    ntfsclone --metadata --output ntfsmeta.img /dev/hda1
    ntfsclone -mst --output - /dev/hda1 | bzip2 > ntfsmeta.bz2
    ntfsclone was written by Szabolcs Szakacsits with contributions from Per Olofsson (special image
    ntfsclone is part of the ntfs-3g package and is available at:

### Examples for ntfscluster

    ntfscluster /dev/hda1
    ntfscluster -c 0-500 /dev/hda1
    ntfscluster was written by Richard Russon, with contributions from Anton Altaparmakov.   It  was
    ntfscluster is part of the ntfs-3g package and is available from:

### Examples for ntfscp

    ntfscp /dev/hda1 /home/user/new_boot.ini boot.ini
    ntfscp -N stream /dev/hda1 myfile /some/path
    ntfscp  was  written by Yura Pakhuchiy, with contributions from Anton Altaparmakov and Hil Liao.
    ntfscp is part of the ntfs-3g package and is available from:

### Examples for ntfsundelete

    ntfsundelete /dev/hda1
    ntfsundelete /dev/hda1 -s -m '*.doc'
    ntfsundelete /dev/hda1 -S 5k-6m -p 90
    ntfsundelete /dev/hda1 -t 2d
    ntfsundelete /dev/sda1 -u -i 2,5,100-131
    ntfsundelete /dev/hda1 -u -i 3689 -o work.doc -d ~
    ntfsundelete /dev/hda1 -c 3689-3690 -o debug
    ntfsundelete was written by Richard Russon and Holger Ohmacht, with contributions from Anton Al-
    ntfsundelete is part of the ntfs-3g package and is available from:

### Examples for od

    od -A x -t x1z -v
    od -A o -t oS -w16

### Examples for ogg123

    ogg123 test.ogg
    ogg123 ~/music
    ogg123 -d oss test.ogg
    ogg123 -d oss -o dsp:/dev/mydsp
    ogg123 -d esd test.ogg
    ogg123 -d wav -f test.wav test.ogg
    ogg123 -d oss -d wav -f test.wav test.ogg
    ogg123 -d oss -o dsp:/dev/mydsp -d raw -f test2.raw -o byteorder:big test.ogg
    ogg123  -d  oss -d wav -f 1.wav -d wav -f 2.wav -d wav -f 3.wav -d wav -f 4.wav -d wav -f
    ogg123 -d esd -d esd test.ogg

### Examples for oggdec

    oggdec enabler.ogg
    oggdec --raw=1 enabler.ogg
    oggdec -b 8 -s 0 -o enabler.crazymonkey enabler.ogg
    oggdec -R -e 1 -b 16 enabler.ogg
    oggdec -R -e 1 -b 16 -o enabler.raw - < enabler.ogg
    oggdec -R -e 1 -b 16 - < enabler.ogg > enabler.raw
    oggdec *.ogg

### Examples for oggenc

    oggenc somefile.wav
    oggenc somefile.wav -o out.ogg
    oggenc infile.wav -b 256 -o out.ogg
    oggenc infile.wav --managed -b 128 -M 160 -o out.ogg
    oggenc infile.wav -q 6 -o out.ogg
    oggenc --resample 11025 --downmix infile.wav -q 1 -o out.ogg
    oggenc somefile.wav -t "The track title" -a "artist  who  performed  this"  -l  "name  of
    oggenc somefile.wav --lyrics lyrics.lrc --lyrics-language en -o out.oga
    oggenc  -b  192  -a "The Tea Party" -l "Triptych" -t "Touch" track01.wav -t "Underground"
    oggenc -

### Examples for open

    openvt can be used to start a shell on the next free VT, by using the command:
    openvt bash
    openvt -l bash
    openvt -- ls -l

### Examples for openvt

    openvt can be used to start a shell on the next free VT, by using the command:
    openvt bash
    openvt -l bash
    openvt -- ls -l

### Examples for pam\_tally

    pam_tally was written by Tim Baverstock and Tomas Mraz.

### Examples for pam\_tally2

    pam_tally2 was written by Tim Baverstock and Tomas Mraz.

### Examples for pam\_timestamp\_check

    pam_timestamp_check(8), pam.conf(5), pam.d(5), pam(8)

### Examples for partx

    partx --show /dev/sdb3
    partx --show --nr 3 /dev/sdb
    partx --show /dev/sdb3 /dev/sdb
    partx --show - /dev/sdb3
    partx -o START -g --nr 3 /dev/sdb
    partx -o SECTORS,SIZE /dev/sda5 /dev/sda
    partx --add --nr 3:5 /dev/sdd
    partx -d --nr :-1 /dev/sdd

### Examples for pbmtoppa

    pbmtoppa was derived, see <http://www.httptech.com/ppa>.

### Examples for pcimodules

    pcimodules
    pcimodules --class 0x20000 --classmask 0xffff00
    pcimodules was written by Adam J. Richter <adam@yggdrasil.com>, based on public  domain  example
    pcimodules  is  copyright  2000,  Yggdrasil Computing, Incorporated, and may be copied under the

### Examples for pivot\_root

    pivot_root . old-root
    pivot_root . old_root

### Examples for pkill

    pkill and pgrep were introduced in Sun's Solaris 7.  This implementation is fully compatible.

### Examples for pnmtofiasco

    pnmtofiasco < foo.ppm >foo.wfa
    pnmtofiasco -2 -p "IBBPBBPBB" -fps 15 -o video.wfa foo0*.ppm

### Examples for pnmtojpeg

    pnmtojpeg --quality=60 foo.ppm > foo.jpg
    pnmtojpeg, checks thoroughly for any lack of compliance with these restrictions, but does little

### Examples for pnmtorle

    pnmtorle -v file.ppm -o file.rle
    pnmtorle -h file.pgm

### Examples for pod2man

    pod2man program > program.1
    pod2man SomeModule.pm /usr/perl/man/man3/SomeModule.3
    pod2man --section=7 note.pod > note.7

### Examples for podebconf-report-po

    podebconf-report-po --call
    podebconf-report-po will ask confirmation to send the mail to the mailing list.

### Examples for policyeditor

    policyeditor
    policyeditor -file $HOME/.config/icedtea-web/security/java.policy

### Examples for ppmqvga

    ppmqvga -d my_image.ppm | ppmtogif >my_image.gif

### Examples for ppmtoicr

    ppmtoicr ppmfile
    ppmtoicr ppmfile > filename

### Examples for pppd

    pppd call isp
    pppd proxyarp

### Examples for prezip-bin

    prezip-bin -d <wordlist.cwl >wordlist.txt
    prezip-bin -z <wordlist.txt >wordlist.pz 2>errors.txt
    prezip-bin -d <words.pz | aspell create master ./words.rws
    prezip-bin-0.1.2                               2005-09-30                                 PREZIP-BIN(1)

### Examples for prune

    prune -n B test.gv
    prune -n B -N color=red test.gv
    prune returns 0 on successful completion.  It returns 1 if an error occurs.
    prune(1)

### Examples for ps

    ps -e
    ps -ef
    ps -eF
    ps -ely
    ps ax
    ps axu
    ps -ejH
    ps axjf
    ps -eLf
    ps axms
    ps -eo euser,ruser,suser,fuser,f,comm,label
    ps axZ
    ps -eM
    ps -U root -u root u
    ps -eo pid,tid,class,rtprio,ni,pri,psr,pcpu,stat,wchan:14,comm
    ps axo stat,euid,ruid,tty,tpgid,sess,pgrp,ppid,pid,pcpu,comm
    ps -Ao pid,tt,user,fname,tmout,f,wchan
    ps -C syslogd -o pid=
    ps -p 42 -o comm=

### Examples for ps2eps

    ps2eps was written by Roland Bless.

### Examples for ps2pdf

    ps2pdf figure.ps
    ps2pdf -dPDFSETTINGS=/prepress figure.ps proof.pdf

### Examples for rc-alert

    rc-alert  was  written  by Anthony DeRobertis and modified by Julian Gilbey <jdg@debian.org> and

### Examples for readom

    readom dev=2,0 f=cdimage.raw
    readom dev=2,0 sectors=150-10000 f=cdimage.raw
    readom dev=2,0 -w f=cdimage.raw
    readom.
    readom: I/O error. test unit ready: scsi sendcmd: no error

### Examples for readprofile

    readprofile | sort -nr | less
    readprofile | sort -nr +2 | head -20
    readprofile | grep _ext2
    readprofile -av | less
    readprofile -p ~/profile.freeze -m /zImage.map.gz
    readprofile only works with an 1.3.x or newer kernel, because /proc/profile changed in the  step

### Examples for resize

    resize program may be installed as sunsize, which causes makes it assume the -s option.

### Examples for rletopnm

    rletopnm --verbose lenna.rle >lenna.ppm
    rletopnm --headerdump file.rle
    rletopnm --alphaout=dartalpha.pgm dart.rle >dart.ppm

### Examples for route

    route add -net 127.0.0.0 netmask 255.0.0.0 dev lo
    route add -net 192.56.76.0 netmask 255.255.255.0 dev eth0
    route del default
    route add default gw mango-gw
    route add ipx4 sl0
    route add -net 192.57.66.0 netmask 255.255.255.0 gw ipx4
    route add -net 224.0.0.0 netmask 240.0.0.0 dev eth0
    route add -net 10.0.0.0 netmask 255.0.0.0 reject
    route cache misses (-F) or hits (-C).

### Examples for rsync

    rsync -Cavz . arvidsjaur:backup
    rsync -avuzb --exclude '*~' samba:samba/ .
    rsync -Cavuzb . samba:samba/
    rsync -az -e ssh --delete ~ftp/pub/samba nimbus:"~ftp/pub/tridge"

### Examples for run-parts

    run-parts --list --regex '^p.*d$' /etc
    run-parts is free software; see the GNU General Public License version 2 or  later  for  copying

### Examples for scanimage

    scanimage -L
    scanimage >image.pnm
    scanimage -x 100 -y 100 --format=tiff >image.tiff
    scanimage -h
    scanimage will attempt to open the first available device.
    scanimage -f " scanner number %i device %d is a %t, model %m, produced by %v "

### Examples for sdptool

    sdptool browse 00:80:98:24:15:6D
    sdptool browse local
    sdptool add DUN
    sdptool del 0x10000
    sdptool(1)

### Examples for setarch

    setarch ppc32 rpmbuild --target=ppc --rebuild foo.src.rpm
    setarch ppc32 -v -vL3 rpmbuild --target=ppc --rebuild bar.src.rpm
    setarch ppc32 --32bit rpmbuild --target=ppc --rebuild foo.src.rpm

### Examples for setfacl

    setfacl -m u:lisa:r file
    setfacl -m m::rx file
    setfacl -x g:staff file

### Examples for shar

    shar *.c > cprog.shar
    shar -Q *.[ch] > cprog.shar
    shar -B -l28 -oarc.sh *.arc
    shar -f /lcl/src/u*.c > u.sh

### Examples for skill

    skill -KILL -t /dev/pts/*
    skill -STOP -u viro -u lm -u davem

### Examples for smbget

    smbget -R smb://rhonwyn/jelmer/src
    smbget -r smb://rhonwyn/isos/FreeBSD5.1.iso
    smbget -Rr smb://rhonwyn/isos
    smbget -Rr smb://rhonwyn/

### Examples for snice

    snice -c seti -c crack +7

### Examples for software-center

    software-center
    software-center gedit
    software-center banshee?section=universe
    software-center adobe-flashplugin?channel=maverick-partner
    software-center cheese,gtg
    software-center /home/pgg/skype.deb
    software-center  was written by Michael Vogt <mvo@canonical.com>, and this manual page by Andrew

### Examples for sort-dctrl

    sort-dctrl /var/lib/dpkg/available
    sort-dctrl -k Version:v /var/lib/dpkg/available
    sort-dctrl -k Version:vr /var/lib/dpkg/available
    sort-dctrl -k Package,Version:v /var/lib/dpkg/available
    sort-dctrl -k Installed-Size:n,Size:nr /var/lib/dpkg/available

### Examples for splain

    splain, you should expect a bit of whimsy.

### Examples for split-logfile

    split-logfile < /var/log/apache2/other_vhosts_access.log

### Examples for sudo

    sudo is provided ``AS IS'' and any express or implied warranties, including, but not limited to,

### Examples for sudoreplay

    sudoreplay is provided ``AS IS'' and any express or implied warranties, including, but not limited

### Examples for synclient

    synclient EdgeMotionMinSpeed=0

### Examples for sysctl

    sysctl.conf(5) regex(7)

### Examples for tar

    tar -cf archive.tar foo bar
    tar -tvf archive.tar
    tar -xf archive.tar
    tar(5), symlink(7), rmt(8)

### Examples for tcpdmatch

    tcpdmatch in.telnetd localhost
    tcpdmatch in.telnetd 127.0.0.1
    tcpdmatch in.telnetd paranoid

### Examples for tcpdump

    tcpdump host sundown
    tcpdump host helios and \( hot or ace \)
    tcpdump ip host ace and not helios
    tcpdump net ucb-ether
    tcpdump 'gateway snup and (port ftp or ftp-data)'
    tcpdump ip and not net localnet
    tcpdump 'tcp[tcpflags] & (tcp-syn|tcp-fin) != 0 and not src and dst net localnet'
    tcpdump 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)'
    tcpdump 'gateway snup and ip[2:2] > 576'
    tcpdump 'ether[0] & 1 = 0 and ip[16] >= 224'
    tcpdump 'icmp[icmptype] != icmp-echo and icmp[icmptype] != icmp-echoreply'

### Examples for time

    time wc /etc/hosts
    time -f "\t%E real,\t%U user,\t%S sys" ls -Fs
    time -a -o log emacs bork
    time was written by David MacKenzie.  This man page was added by Dirk Eddelbuettel

### Examples for tput

    tput init
    tput -T5620 reset
    tput cup 0 0
    tput clear
    tput cols
    tput -T450 cols
    tput hc
    tput cup 23 4
    tput cup
    tput longname
    tput -S <<!
    tput prints the following error messages and sets the corresponding exit codes.
    tput -T450 lines and tput -T2621 xmc)

### Examples for ucf

    ucf /usr/share/foo/configuration /etc/foo.conf
    ucf --purge /etc/foo.conf
    ucf.conf(5),  ucfr(1), ucfq(1), and diff3(1).  The Debian Emacs policy, shipped with the package

### Examples for ucfr

    ucfr foo /etc/foo.conf
    ucfr --purge foo /etc/foo.conf

### Examples for ufw

    ufw deny 53
    ufw allow 80/tcp
    ufw allow from 10.0.0.0/8
    ufw allow from 172.16.0.0/12
    ufw allow from 192.168.0.0/16
    ufw deny proto udp from 1.2.3.4 to any port 514
    ufw allow proto udp from 1.2.3.5 port 5469 to 1.2.3.4 port 5469
    ufw does support adding rules before enabling the firewall, so administrators can do:
    ufw allow proto tcp from any to any port 22
    ufw  supports application integration by reading profiles located in /etc/ufw/applications.d. To
    ufw app list
    ufw allow <name>
    ufw allow from 192.168.0.0/16 to any app <name>
    ufw app info <name>
    ufw app update <name>
    ufw app update --add-new <name>
    ufw app default <policy>
    ufw supports multiple logging levels. ufw defaults to a loglevel of 'low' when a loglevel is not
    ufw logging LEVEL

### Examples for uniconvertor

    uniconvertor drawing.cdr drawing.svg

### Examples for unzip

    unzip letters
    unzip -j letters
    unzip -tq letters
    unzip -tq \*.zip
    unzip -ca letters \*.tex | more
    unzip -p articles paper1.dvi | dvips
    unzip source.zip "*.[fch]" Makefile -d /tmp
    unzip -C source.zip "*.[fch]" makefile -d /tmp
    unzip -aaCL source.zip "*.[fch]" makefile -d /tmp
    unzip -fo sources
    unzip -uo sources
    unzip -v
    unzip -l file.zip
    unzip -ql file.zip
    unzip --ql file.zip
    unzip -l-q file.zip
    unzip -l--q file.zip

### Examples for unzipsfx

    unzipsfx  has  no  knowledge  of the user's PATH, so in general an archive must either be in the
    unzipsfx will print a warning to the effect, ``can't find myself.''  This is always  true  under
    unzipsfx smaller:  usage and diagnostic info, listing functions and extraction to other directo-
    unzipsfx on the Amiga requires the use of a special program, MakeSFX, in order to create working
    unzipsfx's exit status (error level) is identical to that of unzip(1); see the corresponding man

### Examples for update-alternatives

    update-alternatives --display vi
    update-alternatives --config vi
    update-alternatives --auto vi

### Examples for update-binfmts

    update-binfmts --package javawrapper \
    update-binfmts is copyright (C) 2000, 2001, 2002, 2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010,

### Examples for update-exim4.conf

    update-exim4.conf changes the file permissions of the output file to the value of  the  environ-
    update-exim4.conf evaluates these patterns in /etc/exim4/update-exim4.conf.conf:

### Examples for update-inetd

    update-inetd --comment-chars '#' --disable login,shell,exec,telnet
    update-inetd --comment-chars '#' --disable time,daytime
    update-inetd --enable time,daytime
    update-inetd --comment-chars '#' --pattern tcp --disable time,daytime
    update-inetd               --group               MAIL              --add              \

### Examples for update-initramfs

    update-initramfs -u
    update-initramfs -c -k 2.6.18-1-686

### Examples for update-rc.d

    update-rc.d foobar defaults
    update-rc.d foobar start 20 2 3 4 5 . stop 20 0 1 6 .
    update-rc.d foobar start 30 2 3 4 5 . stop 70 0 1 6 .
    update-rc.d script_for_A defaults 80 20
    update-rc.d script_for_B defaults 90 10
    update-rc.d top_level_app defaults 98 02
    update-rc.d script_depends_on_svc20 defaults 21 19
    update-rc.d foobar remove
    update-rc.d -f foobar remove
    update-rc.d foobar stop 20 2 3 4 5 .
    update-rc.d foobar start 45 S . stop 31 0 6 .
    update-rc.d -f foobar remove
    update-rc.d foobar stop 45 S .

### Examples for updatedb

    updatedb -l 0 -o db_file -U source_directory

### Examples for upstart-local-bridge

    upstart-local-bridge --event=foo --path=/var/foo/bar
    upstart-local-bridge --event=bar --path=@/var/foo/bar

### Examples for virt-image

    virt-image(5), virt-install(1), the project website "http://virt-manager.org"

### Examples for virtlockd

    virtlockd (libvirt) 1.1.1
    virtlockd is distributed under the terms of the GNU LGPL v2.1+.  This is free software; see the

### Examples for vnstat

    vnstat Display traffic summary for the default interface.
    vnstat -i eth0+eth1+eth3
    vnstat -i eth2 --xml
    vnstat -u -i eth0
    vnstat -u -i eth0 --nick local
    vnstat -i eth2 --delete
    vnstatd(1), vnstati(1), vnstat.conf(5), proc(5), ifconfig(8), units(7)

### Examples for vorbiscomment

    vorbiscomment -l file.ogg
    vorbiscomment -l file.ogg > file.txt
    vorbiscomment -w -c file.txt file.ogg newfile.ogg
    vorbiscomment -a -t 'ARTIST=No One You Know' file.ogg newfile.ogg
    vorbiscomment -a file.ogg

### Examples for watch

    watch -n 60 from
    watch -d ls -l
    watch -d 'ls -l | fgrep joe'
    watch echo $$
    watch echo '$$'
    watch echo "'"'$$'"'"
    watch -n 10 sleep 1
    watch uname -r

### Examples for who-permits-upload

    who-permits-upload --search=sponsor arno@debian.org
    who-permits-upload -s=sponsor "Arno Toll"
    who-permits-upload apache2
    who-permits-upload --search=uid "Paul Tagliamonte"
    who-permits-upload was written by Arno Toll <arno@debian.org> and is licensed under the terms of

### Examples for wodim

    wodim -v speed=2 dev=2,0 cdimage.raw
    wodim runs at priority 59 on Solaris, you should run genisoimage at no more than priority 58. On
    wodim -v speed=1 dev=/dev/cdrw -audio track*.cdaudio
    wodim -v -dummy speed=2 dev=/dev/cdrw -audio track*.cdaudio
    wodim -v dev=2,0 cdimage.raw -audio track*.cdaudio
    wodim dev=/dev/cdrw -v -dao -useinfo -text  *.wav
    wodim dev=2,0 -v -dao -audio -useinfo -text *.inf

### Examples for word-list-compress

    word-list-compress d <wordlist.cwl >wordlist.txt
    word-list-compress c <wordlist.wl >wordlist.cwl 2>errors.txt
    word-list-compress d <words.cwl | aspell create master ./words.rws

### Examples for wpa\_supplicant

    wpa_supplicant -B -c/etc/wpa_supplicant.conf -iwlan0
    wpa_supplicant -c/etc/wpa_supplicant.conf -iwlan0 -d
    wpa_supplicant -Dnl80211,wext -c/etc/wpa_supplicant.conf -iwlan0
    wpa_supplicant can control multiple interfaces (radios) either by running one process  for  each
    wpa_supplicant \
    wpa_supplicant  was  designed  to be portable for different drivers and operating systems. Hope-
    wpa_supplicant.conf
    wpa_supplicant
    wpa_supplicant with following command to start it on foreground with debugging enabled:
    wpa_supplicant -iwlan0 -c/etc/wpa_supplicant.conf -d
    wpa_supplicant -iwlan0 -c/etc/wpa_supplicant.conf -B

### Examples for xargs

    xargs sh -c 'emacs "$@" < /dev/tty' emacs
    xargs exits with the following status:

### Examples for xdg-desktop-icon

    xdg-desktop-icon install ./shinythings-webmirror.desktop
    xdg-desktop-icon install ./shinythings-README

### Examples for xdg-desktop-menu

    xdg-desktop-menu install ./shinythings-webmirror.desktop
    xdg-desktop-menu install ./shinythings-webmirror.directory \
    xdg-desktop-menu install --noupdate ./shinythings-webmirror.directory \
    xdg-desktop-menu install --noupdate ./shinythings-webmirror.directory \
    xdg-desktop-menu forceupdate

### Examples for xdg-email

    xdg-email 'Jeremy White <jwhite@example.com>'
    xdg-email --attach /tmp/logo.png \
    xdg-email --subject 'Your password is about to expire' \

### Examples for xdg-icon-resource

    xdg-icon-resource install --size 64 shinythings-myfoobar.png
    xdg-icon-resource install --context mimetypes --size 48 ./mime-foobar-48.png application-x-foobar
    xdg-icon-resource install --context mimetypes --size 64 ./mime-foobar-64.png application-x-foobar

### Examples for xdg-mime

    xdg-mime query filetype /tmp/foobar.png
    xdg-mime query default image/png
    xdg-mime install shinythings-shiny.xml

### Examples for xdg-open

    xdg-open 'http://www.freedesktop.org/'
    xdg-open /tmp/foobar.png

### Examples for xdg-screensaver

    xdg-screensaver suspend 0x1c00007

### Examples for xdg-settings

    xdg-settings get default-web-browser
    xdg-settings check default-web-browser firefox.desktop
    xdg-settings set default-web-browser google-chrome.desktop

### Examples for xinit

    xinit   This will start up a server named X and run the user's .xinitrc, if it exists,  or  else
    xinit -- /usr/local/bin/Xvnc  :1
    xinit -geometry =80x65+10+10 -fn 8x13 -j -fg white -bg navy
    xinit -e widgets -- ./Xorg -l -c
    xinit /usr/ucb/rsh fasthost cpupig -display ws:1 --  :1 -a 2 -t 5
    xinit /usr/local/lib/site.xinitrc -- /usr/bin/X -br

### Examples for xrandr

    xrandr  --output  LVDS --auto --rotate normal --pos 0x0 --output VGA --auto --rotate left
    xrandr --newmode "1024x768" 63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync
    xrandr --addmode VGA 1024x768
    xrandr --output VGA --mode 1024x768
    xrandr --fb 1600x768 --output VGA --mode 1024x768 --panning 1600x0
    xrandr  --fb  3200x2000  --output  LVDS  --scale 2.5x2.5 --output VGA --pos 0x0 --panning
    xrandr --fb 1024x768 --output VGA --transform 1.24,0.16,-124,0,1.24,0,0,0.000316,1

### Examples for xz

    xz foo
    xz -dk bar.xz
    xz -dcf a.txt b.txt.xz c.txt d.txt.lzma > abcd.txt
    xz --robot --list *.xz | awk '/^totals/{print $5-$4}'
    xz --lzma2=preset=1,dict=32MiB foo.tar
    xz -vv --lzma2=dict=192MiB big_foo.tar

### Examples for zenity

    zenity  --title="Select a file to remove" --file-selection
    zenity   --title  "Select  Host" --entry --text "Select the host you would like to flood-
    zenity   --question  --title "Alert"  --text "Microsoft Windows has been found! Would you
    zenity --notification --window-icon=update.png --text "System update necessary!"
    zenity --list --checklist --column "Buy" --column "Item" TRUE Apples TRUE  Oranges  FALSE

### Examples for zip

    zip stuff *
    zip stuff .* *
    zip -r foo foo
    zip -j foo foo/*
    zip -rm foo foo/tom
    zip -rm foo foo/dick
    zip -rm foo foo/harry
    zip command, the last created archive is deleted, making room for the next zip command to  func-
    zip -s 2g -r split.zip foo
    zip inarchive.zip foo.c bar.c --out outarchive.zip
    zip archive "*.[hc]"
    zip archive "[a-f]*"
    zip archive "*.[!o]"

### Examples for zipinfo

    zipinfo storage
    zipinfo -l storage
    zipinfo --h-t storage
    zipinfo storage \*
    zipinfo storage
    zipinfo -t storage            [only totals line]
    zipinfo -st storage           [full listing]
    zipinfo -m storage unshrink.c
    zipinfo -mt storage "*.[ch]" Mak\*
    zipinfo -v storage | more
    zipinfo -T storage | sort -nr -k 7 | sed 15q
    zipinfo's listing-format behavior is unnecessarily complex and should be simplified.   (This  is

### Examples for zipnote

    zipnote foo.zip > foo.tmp
    zipnote -w foo.zip < foo.tmp
