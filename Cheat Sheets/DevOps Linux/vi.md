See also

- [vi - Advanced](http://www.lagmonster.org/docs/vi2.html)
- [vim - Scripting](https://devhints.io/vimscript)
- [vim - Usage](https://devhints.io/vim)

<table border="1" cellpadding="6" cellspacing="0">
	<tbody>
		<tr>
			<td>
			<h3>DOS Line Breaks</h3>
			</td>
			<td>
Insert line break on command line

    Ctrl-v + Ctrl-M
</td>
		</tr>   
		<tr>
			<td>
			<h3>Convert DOS -> Unix line breaks</h3>
			</td>
			<td>
First enter 
				
	:set ff=unix
	
and then save the file
</td>
		</tr>
		<tr>
			<td>
			<h3>Navigation</h3>
			</td>
			<td>
			<pre>
55r         # 55 columns to the right
20l         # 20 columns to the left
!1000       # go to column 1000
:20         # go to line 20
</pre>
			</td>
		</tr>
		<tr>
			<td>
			<h3>File Open At Position</h3>
			</td>
			<td>
			<pre>
vi &lt;file&gt; +&lt;line nr&gt;</pre>
			</td>
		</tr>
		<tr>
			<td>
			<h3>Vim Modelines</h3>
			</td>
			<td>
			Enable them in ~/.vimrc with

<pre>set modeline</pre>

Examples:

<pre>&lt;!-- vim: set ts=4 sw=4: --&gt;
// vim: noai:ts=4:sw=4
/* vim: set noai ts=4 sw=4: */
# vim: set expandtab:</pre>

To re-indent all press

<pre>gg=G</pre>

More hints: <a href="http://vim.wikia.com/wiki/Modeline_magic">http://vim.wikia.com/wiki/Modeline_magic</a>
			</td>
		</tr>
		<tr>
			<td>
			<h3>Vim Addon Manager</h3>
			</td>
			<td>
			<pre>
apt-get install vim-nox               # ensures scripting support
apt-get install vim-addon-manager

vim-addon-manager install &lt;addon&gt;
vim-addon-manager show &lt;addon&gt;        # check installation
vim-addon-manager enable &lt;addon&gt;      # some addons need enabling
</pre>
			</td>
		</tr>
		<tr>
			<td>
			<h3>Vim Enable Mouse Cursor Moving</h3>
			</td>
			<td>
			<pre>set mouse=a</pre>
			</td>
		</tr>
	</tbody>
</table>

## Quickfix

    :copen                                  # Open quickfix list
    :cn                                     # Next
    :cp                                     # Previous
    :cclose                                 # Close quickfix list
        
    :cexpr system('grep -n xyz *')          # Load a grep result as quickfix

Hint: fastest skipping on English keyboard layout "@:"
