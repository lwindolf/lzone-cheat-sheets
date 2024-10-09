### Graphite, Diamond

-   Enabling Diamond collectors:

        echo "enabled = true" >> /etc/diamond/<name>Collector.conf

-   Checking Diamond collectors:

        diamond-setup -p -C <name>Collector

-   [grafana](https://grafana.org) - dashboards for all monitoring sources
-   [Graphite Clustering](https://bitprophet.org/blog/2013/03/07/graphite/)
-   Graphite Backends:
    -   Whisper (legacy): fixed-sized database
    -   Ceres: sparse data, arbitrary fixed-size resolutions



