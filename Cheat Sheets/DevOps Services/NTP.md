## Manage HW clock

    hwclock -a          # adjust
    hwclock -r          # show current HW time

    hwclock --get                 # display drift corrected time
    hwclock --set --date <time>   # set RTC to specified time

To quickly compare times

    hwclock && date +"%F %T"

## systemd timesync

    cat /etc/systemd/timesyncd.conf

    systemctl status systemd-timesyncd.service

    timedatectl                           # Short time overview with RTC and NTP state
    timedatectl show-timesync --all       # Show settings and latest NTP message
    timedatectl timesync-status           # Show current clock status (human readable)
    timedatectl set-ntp false             # disable time sync

## Fix time with ntpdate

Before using ntpdate always stop ntpd if running.

    ntpdate <time server>                 # Update time with slew
    ntpdate -b <time server>              # Update time without slew
    ntpdate -q                            # Show clock skew

## Fix time with ntpd

    ntpd -gq -u             # Fix time with ntpd (immediately quits)
    ntpq -p                 # Show clock skew

Note: with `ntpq -p` output the asterisk indicates which timeserver is currently used

## VMs: use hypervisor clock with chrony

    timedatectl set-ntp false
    modprobe ptp
    apt-get install chrony
    echo "refclock PHC /dev/ptp0 poll 3 dpoll -2 offset 0" >> /etc/chrony/chrony.conf
    sed -i '/ntp/s/^/#/g' /etc/chrony/chrony.conf
    sed -i "/makestep 0.1 3/c\makestep 0.1 -1" /etc/chrony/chrony.conf
    systemctl restart chronyd

## Leap Seconds
      
### Check for pending leap seconds

    ntpq -c"rv 0 leap"

    timedatectl show-timesync | grep NTPMessage | grep -v "Leap=0"

### Avoid leap second problems

- Variant 1: Disable NTP, skip over second

      # before leap second
      /etc/init.d/ntp stop

      # after leap second
      date -s "$(LC_ALL=C date)"    Note: check correct locale!
      /etc/init.d/ntp start

-   Variant 2: Ensure NTP is up-to-date and running with -x
-   Variant 3: [Converging solution](http://syslog.me/2015/06/04/a-humble-attempt-to-work-around-the-leap-second-2015-edition/)
