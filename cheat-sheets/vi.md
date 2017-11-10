+--------------------------------------+--------------------------------------+
| ### DOS Line Breaks                  | Insert line break on command line    |
|                                      |                                      |
|                                      |     Ctrl-v + Ctrl-M                  |
+--------------------------------------+--------------------------------------+
| ### Navigation                       |     55r         # 55 columns to the  |
|                                      | right                                |
|                                      |     20l         # 20 columns to the  |
|                                      | left                                 |
|                                      |     !1000       # go to column 1000  |
|                                      |     :20         # go to line 20      |
+--------------------------------------+--------------------------------------+
| ### File Open At Position            |     vi <file> +<line nr>             |
+--------------------------------------+--------------------------------------+
| ### Vim Modelines                    | Enable them in \~/.vimrc             |
|                                      |                                      |
|                                      |     :set modelines                   |
|                                      |                                      |
|                                      | Examples:                            |
|                                      |                                      |
|                                      |     <!-- vim: set ts=4 sw=4: -->     |
|                                      |                                      |
|                                      |     // vim: noai:ts=4:sw=4           |
|                                      |                                      |
|                                      |     /* vim: set noai ts=4 sw=4: */   |
|                                      |                                      |
|                                      |     # vim: set expandtab:            |
|                                      |                                      |
|                                      | To re-indent all press               |
|                                      |                                      |
|                                      |     gg=G                             |
|                                      |                                      |
|                                      | More hints:                          |
|                                      | [http://vim.wikia.com/wiki/Modeline\ |
|                                      | _magic](http://vim.wikia.com/wiki/Mo |
|                                      | deline_magic)                        |
+--------------------------------------+--------------------------------------+
| ### Vim Addon Manager                |     apt-get install vim-nox          |
|                                      |       # ensures scripting support    |
|                                      |     apt-get install vim-addon-manage |
|                                      | r                                    |
|                                      |                                      |
|                                      |     vim-addon-manager install <addon |
|                                      | >                                    |
|                                      |     vim-addon-manager show <addon>   |
|                                      |       # check installation           |
|                                      |     vim-addon-manager enable <addon> |
|                                      |       # some addons need enabling    |
+--------------------------------------+--------------------------------------+
| ### Vim Enable Mouse Cursor Moving   |     set mouse=a                      |
+--------------------------------------+--------------------------------------+


