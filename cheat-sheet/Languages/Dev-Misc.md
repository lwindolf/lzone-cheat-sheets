### Misc

-   [iotrack](http://www.pdc.kth.se/~pek/iotrack/): LD\_PRELOAD based
    I/O tracking
-   [Linux Debugging Techniques](http://www.ibm.com/developerworks/linux/library/l-debug/):
    DeveloperWorks article on many debugging tools: MEMWATCH, YAMD, electric fence, gdb, kgdb, kdb
-   [Google Address Sanitizer](http://code.google.com/p/address-sanitizer/wiki/AddressSanitizer)
    (Asan) for GCC 4.8+ and LLVM
-   [cppcheck](http://cppcheck.sourceforge.net/) - static code analysis
-   ELF Inspection

        readelf -l <binary

-   [kcachegrind](http://kcachegrind.sourceforge.net/html/Home.html):
    callgrind visualization
-   Object Dumping

        objdump -t <object file>   # print symbols table
        objdump -dS <object file>  # print assembly along source lines

-   Fedora - Crash Tracker [retrace.fedoraproject.org/faf](https://retrace.fedoraproject.org/faf/)
-   Ubuntu - Crash Tracker [errors.ubuntu.com](https://errors.ubuntu.com/)
-   Java - Debugging Flags

        J-Xdebug -J-Xnoagent -J-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9876

-   [Gearman](http://gearman.org/) - Jobserver

### Java

-   [Why JVM eats more memory than configured via
    xmx...](https://plumbr.eu/blog/memory-leaks/why-does-my-java-process-consume-more-memory-than-xmx)
-   [Why JVM eats more memory than
    configured...](http://stackoverflow.com/questions/11768615/jvm-memory-usage-out-of-control)

### Web

-   Color Theory
    -   [http://paletton.com](http://paletton.com) (Palette Generator)
    -   [https://www.smashingmagazine.com/2016/04/web-developer-guide-color/](https://www.smashingmagazine.com/2016/04/web-developer-guide-color/)

### XML

-   Pretty-print XML:

        xmllint --format my.xml

-   XPath on the command line

        # Print subtree of tag 'sometag'
        xmllint --xpath "//sometag" data.xml

        # Match an attribute 'someattr' of 'sometag' to have literal 'string'
        xmllint --xpath "//sometag[contains(@someattr, 'string')" data.xml


