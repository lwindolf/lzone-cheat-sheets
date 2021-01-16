This cheat sheet is about file locking techniques.

## Cron job locking

How to ensure cron job runs do not overlap: Use `flock -w 0 <lockfile> <cmd>`

     */10 * * * * flock -w 0 /tmp/myscript.lock ~/bin/myscript.sh

Note: that you have to create the lock file first!
