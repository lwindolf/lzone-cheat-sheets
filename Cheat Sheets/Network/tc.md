tc is to set network traffic control settings

A good guide can be found at https://linuxvox.com/blog/linux-tc-qdisc/

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
