## DLNA servers

- [minidnla](https://wiki.debianforum.de/DLNA_mit_minidlna)
- [Kodi](https://kodi.wiki/view/Settings/Services/UPnP_DLNA)

## Check if DLNA services are visible

     apt install gupnp-tools
     gssdp-discover -i enp4s0 --timeout=5

## Test DLNA server

A good tool for this is using the DLNA downloader client [DLNA Downloader](https://moritzmolch.com/apps/dlna-downloader.html).
