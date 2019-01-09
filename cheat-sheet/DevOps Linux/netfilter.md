## Syntax


    nft add    <table|chain|rule> ...
    nft list   <table|chain|rule> ...
    nft list   <tables|chains>
    nft flush  <table|chain|rule> ...
    nft delete <table|chain|rule> ...
    
List rules with numbers

    nft list ruleset -a

## Simple Example

Create new table and chain:

    nft create chain inet table1 { type filter hook input priority 0\; }
    nft add rule     inet table1 chain1 iif lo accept
    
Allow existing and outbind, as well as SSH

    nft add rule     inet table1 chain1 ct state established,related accept
    nft add rule     inet table1 chain1 tcp dport 22 ct state new accept
    
Default drop policy

    nft add rule     inet table1 chain1 drop
    
## Advanced

### Inject rule at position

    nft add rule inet table1 chain1 position <number> <rule>
    
### Convert iptables to nftables

Check out [iptables-translate](https://wiki.nftables.org/wiki-nftables/index.php/Moving_from_iptables_to_nftables)

## Debug rule changes

    nft monitor               # Reports all rule changes live
    nft monitor new tables
    nft monitor destroy rules
