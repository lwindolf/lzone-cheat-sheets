### Tuning

[Disable transparent huge
pages](http://docs.mongodb.org/manual/reference/transparent-huge-pages/#transparent-huge-pages-thp-settings):
add in /etc/rc.local

    if test -f /sys/kernel/mm/transparent_hugepage/khugepaged/defrag; then
      echo 0 > /sys/kernel/mm/transparent_hugepage/khugepaged/defrag
    fi
    if test -f /sys/kernel/mm/transparent_hugepage/defrag; then
      echo never > /sys/kernel/mm/transparent_hugepage/defrag
    fi
    if test -f /sys/kernel/mm/transparent_hugepage/enabled; then
      echo never > /sys/kernel/mm/transparent_hugepage/enabled
    fi
