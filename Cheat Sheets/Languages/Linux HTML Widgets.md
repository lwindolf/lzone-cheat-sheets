When you start a new open source project and decide to provide parts or the whole UI by an HTML widget you face the problem of first finding HTML widget libraries, especially light weight ones, and then using the correct one to avoid throwing away the code at a later point when you find one important feature missing.

With this blog post I try to give a summary of existing open source HTML renderer libraries in the Linux world. I have some background experiences with the libraries from working on <a href="http://liferea.sf.net">Liferea</a> where we started with GtkHTML2, later added GtkMozembed support, then added Webkit support and finally switched to WebKit-only rendering.

The following table tries to summarize the simple availability of the different HTML renderers:

<table>
<tr>
<th>Name</th>
<th>Toolkit</th>
<th>Platform</th>
<th>Derived From</th>
<th>Driving Force</th>
<th>Active</th>
</tr>
<tr><td><a href="http://www.konqueror.org/features/browser.php">KHTML</a><td>QT</td><td>%</td><td>KDE</td><td>KDE</td><td>Yes</td></tr>
<tr><td><a href="http://docs.wxwidgets.org/2.6/wx_wxhtml.html">wxHtml</td><td>wxWidgets</td><td>GTK, Windows</td><td>KHTML</td><td>wxWidgets</td><td>Yes</td></tr>
<tr><td><a href="http://directory.fsf.org/project/gtkhtml/">GtkHtml</a></td><td>GTK+ 1.0</td><td>GNOME 1</td><td>KHTML</td><td>GNOME 1</td><td>No, long gone</td></tr>
<tr><td><a href="https://bugzilla.gnome.org/browse.cgi?product=gtkhtml2">GtkHtml2</a></td><td>GTK+ 2.0</td><td>GNOME 2</td><td>GtkHtml</td><td>GNOME 2</td><td>No, v2.11: Aug 2007</td></tr>
<tr><td><a href="http://packages.debian.org/lenny/gtkhtml3.14">GtkHtml3</a></td><td>GTK+ 2.0</td><td>GNOME 2</td><td>GtkHtml</td><td>Ximian, Evolution</td><td>No, v3.14: May 2008</td></tr>
<tr><td><a href="http://www.mozilla.org/unix/gtk-embedding.html">GtkMozEmbed</a></td><td>GTK+ 2.0</td><td>Gecko</td><td>%</td><td>Mozilla</td><td>Somewhat</td></tr>
<tr><td><a href="http://webkitgtk.org/">WebKitGtk</a></td><td>GTK+ 2.0<br/>GTK+ 3.0</td><td>Webkit</td><td>KHTML</td><td>Apple Safari</td><td>Yes</td></tr>
</table>

<b>Note:</b> My summary somewhat complements <a href="http://en.wikipedia.org/wiki/Comparison_of_layout_engines">this Wikipedia list</a>. Still it focusses more on Linux renderers and does correctly distinguish between the rather mad history of GtkHtml*.

Given the list above one could conclude the only acceptable renderers are KTHML, wxHtml and WebkitGtk simply based on project activity. Still other renderers like GtkHtml2 and GtkHtml3 have gone a long way and provide a limited but stable functionality.

But the important question is: What features are supported by the different renderers?

<table>
<tr>
<th>Name</th>
<th>Widget<br/>Embed</td>
<th>Full<br/>HTML</td>
<th>CSS</th>
<th>JS</th>
<th>Java/Flash</th>
<th>Editor</th>
</tr>
<tr><td>KHTML</td><td>y</td><td>y</td><td>1,2,3</td><td>y</td><td>y</td><td>n</td></tr>
<tr><td>wxHtml</td><td>y</td><td>n</td><td>none</td><td>n</td><td>n</td><td>n</td></tr>
<tr><td>GtkHtml</td><td>y</td><td>y</td><td>none</td><td>n</td><td>n</td><td>y</td></tr>
<tr><td>GtkHtml2</td><td>y</td><td>y</td><td>1,2 inline</td><td>n</td><td>n</td><td>n</td></tr>
<tr><td>GtkHtml3</td><td>y</td><td>y</td><td>none</td><td>n</td><td>n</td><td>y</td></tr>
<tr><td>GtkMozEmbed</td><td>n</td><td>y</td><td>1,2,3</td><td>y</td><td>y</td><td>n</td></tr>
<tr><td>WebKitGtk</td><td>n</td><td>y</td><td>1,2,3</td><td>y</td><td>y</td><td>n</td></tr>
</tr>
</table>

The feature matrix along with the platform listing explains why a lot of those old renderer libraries are still around. Given you want to render simple markup in an email client you might still choose wxHtml or GtkHtml3, with the latter one providing you with a HTML editor for rich mail editing. Of course when you want to allow your users to have fully fledged inline browsing you need to use either KTHML, GtkMozEmbed or Webkit. Currently I believe WebKitGtk to be the best choice as it's widget gets a lot of attention, which GtkMozEmbed never had while being unstable and rather limited at the same time.

If you find mistakes or have something to add please post a comment!
