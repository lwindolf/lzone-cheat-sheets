This cheat sheet is about file locking techniques.

## Locking Variants

### flock

Note: that you have to create the lock file first!

    flock /tmp/myapp.lock <some command>
    flock -w 10 /tmp/myapp.lock <some command>

### lockfile-*

    lockfile-create /tmp/myapp.lock
    lockfile-touch  /tmp/myapp.lock
    lockfile-remove /tmp/myapp.lock

## Cron job locking

How to ensure cron job runs do not overlap: Use `flock -w 0 <lockfile> <cmd>`

    */10 * * * * flock -w 0 /tmp/myscript.lock ~/bin/myscript.sh

## How to find blocking locks

    lslocks

Will give an output listing all active locks:

    ~ $ lslocks
    COMMAND           PID  TYPE  SIZE MODE  M      START        END PATH
    thermald          485 POSIX       WRITE 0          0          0 /run...
    containerd        573 FLOCK       WRITE 0          0          0 /...
    tracker-miner-f  1245 POSIX 16,2M READ  0 1073741826 1073742335 /data/lars/.cache/tracker/meta.
    tracker-miner-f  1245 POSIX   32K READ  0        128        128 /data/lars/.cache/tracker/meta.
    firefox         21560 POSIX  160K WRITE 0 1073741826 1073742335 /data/lars/.mozilla/firefox/dzr
    [...]
