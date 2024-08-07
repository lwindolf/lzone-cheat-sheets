## CLI Tools

    # Open with registered program
    xdg-open <url|file>

    # Send mail
    xdg-email --cc  <address(es)> \
              --bcc <address(es)> \
              --subject <text> \
              --body <text> \
              --attach <file> \
              <address(es)>

    # Query mime type registration
    xdg-mime query default x-scheme-handler/https

    xdg-user-dir    # Get home dir

    # Get special dir
    xdg-user-dir <DESKTOP|DOWNLOAD|TEMPLATES|PUBLICSHARE|DOCUMENTS|MUSIC|PICTURES|VIDEOS>

    xdg-screensaver suspend <window>
    xdg-screensaver resume <window>
    xdg-screensaver activate
    xdg-screensaver lock
    xdg-screensaver reset
    xdg-screensaver status

## Environment variables

Typical XDG env vars

    XDG_CONFIG_DIRS=/etc/xdg/xdg-ubuntu:/etc/xdg
    XDG_CURRENT_DESKTOP=ubuntu:GNOME
    XDG_DATA_DIRS=/usr/share/ubuntu:/usr/share/gnome:/home/lars/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share/:/usr/share/:/var/lib/snapd/desktop
    XDG_MENU_PREFIX=gnome-
    XDG_RUNTIME_DIR=/run/user/1000
    XDG_SESSION_CLASS=user
    XDG_SESSION_DESKTOP=ubuntu
    XDG_SESSION_TYPE=wayland
