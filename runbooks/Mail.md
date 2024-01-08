This runbook is about handling sudden mail on a server.

## Display mail

View mails by running `mail` interactively (cannot be done via this runbook).
At the `mail` prompt you can view mails by entering their number. To list the
remaining mails again type `h` (for headers). If you want to bulk delete type 
something like `d1-1000` (will delete mail number 1 to 1000).

## Silence mail producers

Nowadays the only system mail producer is cron. So we need to prevent cron
from delivering mails locally.

### Variant 1: mail relay

If you have a mail relay configured you should make cron use it to avoid mails 
staying on the server. To do so insert a `MAILTO="<email address>"` line
into the relevant crontab.

### Variant 2: just silence mails

Disable cron mails by inserting `MAILTO=""` in the crontab.

### Variant 3: write to logs

Append a log redirection like `>/var/log/somelog.log 2>&1` to all your crons.
