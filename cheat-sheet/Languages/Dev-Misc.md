### Misc

-   JSON Linting

        python -mjson.tool input.json

-   [iotrack](http://www.pdc.kth.se/~pek/iotrack/): LD\_PRELOAD based
    I/O tracking
-   [Linux Debugging
    Techniques](http://www.ibm.com/developerworks/linux/library/l-debug/):
    DeveloperWorks article on many debugging tools: MEMWATCH, YAMD,
    electric fence, gdb, kgdb, kdb
-   [Google Address
    Sanitizer](http://code.google.com/p/address-sanitizer/wiki/AddressSanitizer)
    (Asan) for GCC 4.8+ and LLVM
-   [cppcheck](http://cppcheck.sourceforge.net/) - static code analysis
-   ELF Inspection

        readelf -l <binary

-   [kcachegrind](http://kcachegrind.sourceforge.net/html/Home.html):
    callgrind visualization
-   Object Dumping

        objdump -t <object file>   # print symbols table
        objdump -dS <object file>  # print assembly along source lines

-   Fedora - Crash Tracker
    [retrace.fedoraproject.org/faf](https://retrace.fedoraproject.org/faf/)
-   Ubuntu - Crash Tracker
    [errors.ubuntu.com](https://errors.ubuntu.com/)
-   Java - Debugging Flags

        J-Xdebug -J-Xnoagent -J-Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=9876

-   [Gearman](http://gearman.org/) - Jobserver

### Security

-   [Kernel Sandboxing with
    Seccomp](https://wiki.mozilla.org/Security/Sandbox/Seccomp)
-   [Secure Programming for Linux and Unix
    HOWTO](http://www.dwheeler.com/secure-programs/Secure-Programs-HOWTO/index.html)
-   [OWASP Cheat
    Sheets](https://www.owasp.org/index.php/OWASP_Cheat_Sheet_Series#tab=Main)

### Test Frameworks

Low-level C test frameworks:

-   [Glib Testing](http://lzone.de/examples/Glib%20Testing)
-   [lcov](http://ltp.sourceforge.net/coverage/lcov.php) - GCC based
    test coverage metrics:

        apt-get install lcov
        CLAGS=--coverage ./configure
        # Run tests
        lcov --capture --directory <project-dir> --output-file coverage.info
        genhtml coverage.info --output-directory out

-   Ruby rspec - Launch tests

        # There are a lot of rspec launch variants:
        autotest
        rspec <path to .rb spec file>
        rspec <path to directory>
        bundle exec rspec <path to .rb spec file>

### Java

-   [Why JVM eats more memory than configured via
    xmx...](https://plumbr.eu/blog/memory-leaks/why-does-my-java-process-consume-more-memory-than-xmx)
-   [Why JVM eats more memory than
    configured...](http://stackoverflow.com/questions/11768615/jvm-memory-usage-out-of-control)

### Web

-   Color Theory
    -   [http://paletton.com](http://paletton.com) (Palette Generator)
    -   [https://www.smashingmagazine.com/2016/04/web-developer-guide-color/](https://www.smashingmagazine.com/2016/04/web-developer-guide-color/)
-   [Javascript Design
    Patterns](http://addyosmani.com/resources/essentialjsdesignpatterns/book/#factorypatternjavascript)
-   [jsfiddle.net](http://jsfiddle.net/) - JS sharing and testing
-   [Javascript - Key Event
    Codes](https://www.w3.org/2002/09/tests/keys.html)
-   Javascript - JSON dumping

        console.log(JSON.stringify(obj));
        console.log(JSON.stringify(obj), null, 3);  // indented by 3 spaces

-   [Javascript - ESLint](http://eslint.org): ECMAScript linter
-   PHP - simple webserver

        php -S localhost:8000

-   Python - simple webserver

        python -m SimpleHTTPServer

### XML

-   Pretty-print XML:

        xmllint --format my.xml

-   XPath on the command line

        # Print subtree of tag 'sometag'
        xmllint --xpath "//sometag" data.xml

        # Match an attribute 'someattr' of 'sometag' to have literal 'string'
        xmllint --xpath "//sometag[contains(@someattr, 'string')" data.xml


