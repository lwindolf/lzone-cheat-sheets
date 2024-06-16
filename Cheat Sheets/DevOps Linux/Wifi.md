## Checking things

    iwlist scan                           # List SSIDs per interface
    iw dev                                # Show devices
    iw wlan0 link                         # Check connection status
    ip link show wlan0 | grep DORMANT     # Check for active power mgmt
    ip route show                         # Check if there is a route for Wifi

## Manually connect

    ip link set wlan0 up  
    wpa_passphrase <SSID name> >> /etc/wpa_supplicant.conf 
    wpa_supplicant -B -D wext -i wlan0 -c /etc/wpa_supplicant.conf
    dhclient -v wlan0
