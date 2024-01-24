## Misc

- Using hypervisor clock in VMs 

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

### Avoid leap second problems

- Variant 1: Disable NTP, skip over second

      # before leap second
      /etc/init.d/ntp stop

      # after leap second
      date -s "$(LC_ALL=C date)"    Note: check correct locale!
      /etc/init.d/ntp start

-   Variant 2: Ensure NTP is up-to-date and running with -x
-   Variant 3: [Converging solution](http://syslog.me/2015/06/04/a-humble-attempt-to-work-around-the-leap-second-2015-edition/)
