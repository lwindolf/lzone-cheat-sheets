### CLI Usage

-   DBUS - List Registered Services:

        # List system services
        dbus-send --system --dest=org.freedesktop.DBus --type=method_call --print-reply \
        /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep -v '":'

        # List session services
        dbus-send --session --dest=org.freedesktop.DBus --type=method_call --print-reply \
        /org/freedesktop/DBus org.freedesktop.DBus.ListNames | grep -v '":'

-   DBUS - Registry Locations:

        /usr/share/dbus-1/services/*.service
        /usr/share/dbus-1/system-services/*.service
        /usr/share/dbus-1/interfaces/*.xml

-   DBUS - Call RPC:

        dbus-send --session --dest=<class> <namespace> <method> [<parameters>]

    Example

        dbus-send --session --dest=org.gnome.feed.Reader \
          /org/gnome/feed/Reader \
          org.gnome.feed.Reader.Subscribe \
          string:http://osnews.com/files/recent.rdf


