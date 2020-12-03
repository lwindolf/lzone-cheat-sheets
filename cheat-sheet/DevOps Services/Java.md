## Heapsize calculation

You can print the effective heap size and RAM settions by using `-XX:+PrintFlagsFinal`. 
Below is an example for a 8GB host of which Java per default 1/4 (MaxRAMFraction) uses 2GB:

    java -XX:+PrintFlagsFinal $MY_PARAMS -version | grep -Ei "maxheapsize|maxram"
      size_t MaxHeapSize                              = 2061500416                                {product} {ergonomic}
    uint64_t MaxRAM                                   = 137438953472                           {pd product} {default}
       uintx MaxRAMFraction                           = 4                                         {product} {default}
      double MaxRAMPercentage                         = 25.000000                                 {product} {default}

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
