Here is a side by side comparison of screen and tmux commands and
hotkeys.

 | Function            |Screen                                 |tmux
 | --------------------|---------------------------------------|---------------------
 | Start instance      |screen screen -S \<name\>              |tmux
 | Attach to instance  |screen -r \<name\> screen -x \<name\>  |tmux attach
 | List instances      |screen -ls screen -ls \<user name\>/   |tmux ls
 | New Window          |\^a c                                  |\^b c
 | Switch Window       |\^a n \^a p                            |\^b n \^b p
 | List Windows        |\^a "                                  |\^b w
 | Name Window         |\^a A                                  |\^b ,
 | Split Horizontal    |\^a S                                  |\^b "
 | Split Vertical      |\^a |                                  |\^b %
 | Switch Pane         |\^a Tab                                |\^b o
 | Kill Pane           |\^a x                                  |\^b x
 | Paging              |                                       |\^b PgUp \^b PgDown
 | Scrolling Mode      |\^a [                                  |\^b [

