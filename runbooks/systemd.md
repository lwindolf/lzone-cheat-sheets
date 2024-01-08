This runbook is about fixing unexpected systemd unit states.

## Failed units

Find out why the unit failed with

    journalctl -u <unit name>

and restart with

    systemctl restart <unit name>

In case the unit has failed to often you might need to reset the failed state with

    systemctl reset-failed <unit name>

## Masked units

If a service is 'masked' it means someone manually disabled them. You can undo this with

    systemctl unmask <unit name>

## Advanced Debugging

Analyze unit definition with

    systemctl edit <unit>
     
If you change things in the unit definition ensure to reload systemd:

    systemctl daemon-reload
