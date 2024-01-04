## CLI

    screen                       # Start new instance
    screen -S <name>             # Start named instance
    
    screen -x                    # Attach to latest instance
    screen -x <name>             # Attach to named instance
    
    screen -ls                   # Show instances
    screen -ls <user name>/      # Show instances for user

## Initial layout using .screenrc

Here is an example `.screenrc` that provides 3 panes with titles each running different commands inside

    screen -t "top" top
    split -v
    focus
    screen -t "df" watch df -h
    split
    focus
    screen -t "Shell" bash

Use `split` and `split -v` to split horizontally or vertically. Also you need to use `focus` to move the
initial cursor to the preferred pane.

You can also start specific screen sessions with other splitting by running `screen -c <screenrc file>`.
    

## Screen compared to tmux

Here is a side by side comparison of screen and tmux commands and hotkeys.

 | Function            |Screen                                   |tmux
 | --------------------|-----------------------------------------|---------------------
 | Start instance      |`screen` or `screen -S <name>`           |`tmux`
 | Attach to instance  |`screen -r <name>` or `screen -x <name>` |`tmux attach`
 | List instances      |`screen -ls` or `screen -ls <user name>/`|`tmux ls`
 | New Window          |\^a c                                    |\^b c
 | Switch Window       |\^a n \^a p                              |\^b n \^b p
 | List Windows        |\^a "                                    |\^b w
 | Name Window         |\^a A                                    |\^b ,
 | Split Horizontal    |\^a S                                    |\^b "
 | Split Vertical      |\^a \|                                   |\^b %
 | Switch Pane         |\^a Tab                                  |\^b o
 | Kill Pane           |\^a x                                    |\^b x
 | Paging              |                                         |\^b PgUp \^b PgDown
 | Scrolling Mode      |\^a [                                    |\^b [


## Allow login of other users

Preparation in running session

    Ctrl-A :multiuser on
    Ctrl-A :acladd <user to grant access>

Attach to other users screen session

    screen -x <user name>/<session name>
    screen -x <user name>/<pid>.<ptty>.<host>

## [Solve "Cannot open your terminal '/dev/pts/0'"](https://makandracards.com/makandra/2533-solve-screen-error-cannot-open-your-terminal-dev-pts-0-please-check):

Sign in as user who opened the screen

    script /dev/null
    screen -x
