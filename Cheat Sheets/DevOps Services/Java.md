## CLI

    jcmd                      # Print all Java processes
    jcmd <pid> help           # Show supported commands

    jcmd <pid> VM.system_properties 
   
    jcmd <pid> GC.class_histogram
   
    jcmd <pid> GC.heap_dump /tmp/heap_dump.hprof        # Heap dump with full GC
    jcmd <pid> GC.heap_dump -all /tmp/heap_dump.hprof   # Heap dump without full GC
   
    jcmd <pid> Thread.print    # Create thread dump
    kill -3 <pid>              # Create thread dump to JVM stdout

When using Oracle Java

    jcmd <pid> JFR.start       # Start flight recorder trace
    jcmd <pid> JFR.dump        # Dump flight recorder trace

## Legacy CLI

    jps                        # Java7 print all processes
    jstack -l <pid>            # Create thread dump (Before Java8)

## keytool Usage

Note `changeme` is the default password of unprotected/fresh Java keystores. Set a new password with `-storepassword`

    keytool -list                                         # Show content of default keystore
    keytool -list -keystore <file>                        # Show content of file
    keytool -list -rfc -keystore <file> -alias <alias>    # Print cert with details
    
    keytool -storepassword -keystore <file>               # Change password of keystore

## Heapsize calculation

You can print the effective heap size and RAM settions by using `-XX:+PrintFlagsFinal`. 
Below is an example for a 8GB host of which Java per default 1/4 (MaxRAMFraction) uses 2GB:

    java -XX:+PrintFlagsFinal $MY_PARAMS -version | grep -Ei "maxheapsize|maxram"
      size_t MaxHeapSize                              = 2061500416                                {product} {ergonomic}
    uint64_t MaxRAM                                   = 137438953472                           {pd product} {default}
       uintx MaxRAMFraction                           = 4                                         {product} {default}
      double MaxRAMPercentage                         = 25.000000                                 {product} {default}

Also interesting

- [Why JVM eats more memory than configured via xmx...](https://plumbr.eu/blog/memory-leaks/why-does-my-java-process-consume-more-memory-than-xmx)
- [Why JVM eats more memory than configured...](http://stackoverflow.com/questions/11768615/jvm-memory-usage-out-of-control)

## Java RAM and containers

When running Java in containers you need to ensure Java see the real amount of RAM it has available.
Before Java 11 it usually sees the total amount of RAM available to the host system. Basing usage 
on this amount often causes OOM kills.

| Java Version          | Solution                                                          |
| --------------------- | ----------------------------------------------------------------- |
| Java <8u131           | Calculate correct memory size and set using -Xms/-Xmx             |
| Java 8u131+, Java 9   | -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap |
| Java 10+              | -XX:+UseContainerSupport -XX:MaxRAMPercentage                     |


## JDBC Problems

Oracle JDBC hanging and timing out when run on VMs: this can indicate
missing entropy **Workaround**: Note that this reduces security! Use
urandom as RNG by adding the following JVM option

    -Djava.security.egd=file:///dev/urandom

## Check if you are using Oracle JDK (and need a valid license)

    pgrep -fl java | grep -q "+UnlockCommercialFeatures"

## Default Keystore Location

    readlink -e $(dirname $(readlink -e $(which keytool)))/../lib/security/cacerts

## JMX Remote JConsole via SSH tunnel

Enable JMX and JConsole:

      -Dcom.sun.management.jmxremote
          -Dcom.sun.management.jmxremote.access.file=/usr/local/tomcat/conf/jmxremote.access
          -Dcom.sun.management.jmxremote.authenticate=true
          -Dcom.sun.management.jmxremote.local.only=false
          -Dcom.sun.management.jmxremote.password.file=/usr/local/tomcat/conf/jmxremote.password
          -Dcom.sun.management.jmxremote.port=3333
          -Dcom.sun.management.jmxremote.rmi.port=3334
          -Dcom.sun.management.jmxremote.ssl=false

And connect jconsole to remote localhost:3333 e.g. via SSH port
forwarding

    ssh targethost -L 3334:localhost:3334 -f -N
    ssh targethost -L 3333:localhost:3333 -f -N

## Setting defaults from environment

When you want to merge user passed settings with some defaults use `JAVA_TOOL_OPTIONS`. Options from the JVM CLI overrule any options also specified in `JAVA_TOOL_OPTIONS`.

## Check for Memory Leaks

-   [JVM - Verbose GC](http://javaeesupportpatterns.blogspot.de/2011/10/verbosegc-output-tutorial-java-7.html):

        -verbose:gc -XX:+PrintGCDetails -XX:+PrintGCTimeStamps -Xloggc:/gc.log

-   [JVM - jstat](http://docs.oracle.com/javase/6/docs/technotes/tools/share/jstat.html): Oracle helper tool

## Using Oracle Flightrecorder

First create a recording file with `jcmd` (see CLI section above) and then analyse it with

    jfr print recording.jfr
    jfr print --events CPULoad,GarbageCollection recording.jfr
    jfr print --json --events CPULoad recording.jfr
    jfr print --categories 'GC,JVM,Java*' recording.jfr
    jfr print --events 'jdk.*' --stack-depth 64 recording.jfr
    jfr summary recording.jfr
    jfr metadata recording.jfr
    jfr metadata --categories GC,Detailed

[https://github.com/sureshg/sureshg.github.io/blob/e3551a6975e2b76ffbe05e234c8cf2ad3ea63f03/Writerside/topics/notes/JVM-Profiling.md?plain=1#L46](https://github.com/sureshg/sureshg.github.io/blob/e3551a6975e2b76ffbe05e234c8cf2ad3ea63f03/Writerside/topics/notes/JVM-Profiling.md?plain=1#L46)
