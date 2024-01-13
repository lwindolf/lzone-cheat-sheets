### RBLs

-   [mxtoolbox.com](http://mxtoolbox.com) - RBL online check
-   [abuseat.org](http://www.abuseat.org/lookup.cgi) - RBL online check
-   [senderbase.org](http://www.senderbase.org/lookup/) - CISCO RBL
    online check
-   [ers.trendmicro.com](https://ers.trendmicro.com/reputations) -
    Trendmicro reputation online check
-   [ipremoval.sms.symantec.com](http://ipremoval.sms.symantec.com/lookup/)
    - Symantec online check

### Misc

-   Dovecot - Dump Config

        doveconf -n

-   Dovecot - List Mailbox Dirs

        doveadm mailbox list -u <email>

-   [Dovecot - Configure Shared
    Mailboxes](http://wiki.dovecot.org/SharedMailboxes/Shared)
-   [Dovecot - Debug Shared Mailboxes
    Issues](http://lzone.de/blog/Debugging%20dovecot%20ACL%20Shared%20Mailboxes%20Not%20Showing%20in%20Thunderbird)
-   Dovecot IMAP - Check ACL

        doveadm acl debug -u <email>

-   [Postfix - Drop
    Mails](http://www.cyberciti.biz/tips/howto-postfix-flush-mail-queue.html)

        postsuper -d ALL
        postsuper -d ALL deferred

-   [Postfix - OpenDKIM Setup on
    Ubuntu](https://help.ubuntu.com/community/Postfix/DKIM)
-   [Postfix - SPF Setup on
    Ubuntu](https://help.ubuntu.com/community/Postfix/SPF)
-   [Microsoft SPF Record
    Tool](http://www.microsoft.com/mscorp/safety/content/technologies/senderid/wizard/default.aspx):
    SPF Record wizard

