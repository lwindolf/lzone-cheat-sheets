This cheat sheet is about file locking techniques.

## Filesystem Locking Variants

Solutions that lock files using the filesystem

### [flock](https://linux.die.net/man/1/flock)

Note: that you have to create the lock file first!

    flock /tmp/myapp.lock <some command>
    flock -w 10 /tmp/myapp.lock <some command>

### [lockfile-*](https://linux.die.net/man/1/lockfile-create)

    lockfile-create /tmp/myapp.lock
    lockfile-touch  /tmp/myapp.lock
    lockfile-remove /tmp/myapp.lock

### [setlock](https://cr.yp.to/daemontools/setlock.html)

    setlock -nX lockfile /tmp/myapp.lock

## Semaphore Locking Variants

Solutions that more or less safely aquire a lock file

### [lockfile](https://linux.die.net/man/1/lockfile)

    lockfile /tmp/myapp.lock
    lockfile -15 -r 3 /tmp/myapp.lock     # wait 15s, 3 retries

## Pure Shell Locking

Source: [https://wiki.bash-hackers.org/howto/mutex](https://wiki.bash-hackers.org/howto/mutex)

    if ( set -o noclobber; echo "locked" > "$lockfile") 2> /dev/null; then
      trap 'rm -f "$lockfile"; exit $?' INT TERM EXIT
      echo "Locking succeeded" >&2
      rm -f "$lockfile"
    else
      echo "Lock failed - exit" >&2
      exit 1
    fi

## Cron job locking

How to ensure cron job runs do not overlap: Use `flock -w 0 <lockfile> <cmd>`

    */10 * * * * flock -w 0 /tmp/myscript.lock ~/bin/myscript.sh
    
Another good alternative might be to rely on [systemd timer units](https://www.putorius.net/using-systemd-timers.html).

## How to find blocking locks

[lslocks](https://www.man7.org/linux/man-pages/man8/lslocks.8.html) will give an output listing all active locks:

    ~ $ lslocks
    COMMAND           PID  TYPE  SIZE MODE  M      START        END PATH
    thermald          485 POSIX       WRITE 0          0          0 /run...
    containerd        573 FLOCK       WRITE 0          0          0 /...
    tracker-miner-f  1245 POSIX 16,2M READ  0 1073741826 1073742335 /data/lars/.cache/tracker/meta.
    tracker-miner-f  1245 POSIX   32K READ  0        128        128 /data/lars/.cache/tracker/meta.
    firefox         21560 POSIX  160K WRITE 0 1073741826 1073742335 /data/lars/.mozilla/firefox/dzr
    [...]
