tc is to set network traffic control settings

A good guide can be found at https://linuxvox.com/blog/linux-tc-qdisc/

Additionally there is a [Redhat documentation](https://docs.redhat.com/en/documentation/red_hat_enterprise_linux/9/html/configuring_and_managing_networking/linux-traffic-control_configuring-and-managing-networking)

## qdisc

Add a PFIFO to drop after queue reaches 1000 packets

    tc qdisc add dev eth0 root pfifo limit 1000

Remove qdisc

    tc qdisc del dev eth0 root

Show current queue statistics

    tc -s qdisc ls dev eth0

Limit interface to max bandwith (from https://unix.stackexchange.com/questions/39218/throttle-the-download-speed-of-wget-or-curl-while-downloading#39219)

    tc qdisc add dev eth0 root handle 1:0 netem delay 100ms
    tc qdisc add dev eth0 parent 1:1 handle 10: tbf rate 256kbit buffer 1600 limit 3000

Check default qdisc

    sysctl -a | grep qdisc

Make a qdisc permanent with NetworkManager

    nmcli connection modify eth0 tc.qdiscs 'root pfifo_fast'

## filter

You need filters for example for classifying traffic to do traffic priorisation

    tc filter add dev enp1s0 parent ffff: protocol ip u32 match u32 0 0 action ctinfo cpmark 100 action mirred egress redirect dev ifb4eth0

Show configured filters

    tc filter show dev enp1s0
