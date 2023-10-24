## Usage in different languages

As the actual use of regular expressions is quite language specific there are separate cheat sheets:

*   [Bash](Bash+Regex)
*   [Perl](https://perldoc.perl.org/perlre)
*   PHP
    *   [preg_match() Examples](/examples/PHP+preg_match)
    *   [preg_match() vs strpos() Performance](/articles/php-string-search.htm)
    *   [preg_replace() Examples](/examples/PHP+preg_replace)
*   Python
    *   [Python re.match Examples](/examples/Python+re.match)
    *   [Python re.sub Examples](/examples/Python+re.sub)
*   [Ruby](Ruby+Regex)
*   [Javascript](/examples/Javascript RegExp)
*   [C and Glib 2.14+](/examples/GLib+GRegex) (GTK, GNOME)

## Standards

*   [POSIX BRE: Basic Regular Expressions](http://pubs.opengroup.org/onlinepubs/7908799/xbd/re.html)
*   [POSIX ERE: Extended Regular Expressions](http://pubs.opengroup.org/onlinepubs/009696899/basedefs/xbd_chap09.html)

## Regex Variants

<table>

<tbody>

<tr>

<th>Variant</th>

<th>Used By</th>

<th>Meta Characters</th>

<th>Back References</th>

</tr>

<tr>

<td>POSIX BRE</td>

<td>grep, <a href="https://www.gnu.org/software/sed/manual/html_node/Regular-Expressions.html">sed</a></td>

<td>^ $ \{\} \[\] \(\) . *  
GNU extension: \+ \?</td>

<td>\1 ... \9</td>

</tr>

<tr>

<td>POSIX ERE</td>

<td>egrep, awk, <a href="http://www.math.utah.edu/docs/info/gawk_5.html">gawk</a></td>

<td>^ $ {} [] () . * + ? |</td>

<td>gawk: \\1 .. \\9</td>

</tr>

<tr>

<td>Perl RE</td>

<td>Perl, C, PHP, Python, Ruby...  
Every programming language using <a href="http://www.pcre.org/">PCRE</a></td>

<td>^ $ {} () . * + ? |</td>

<td>Based on language

<table>

<tbody>

<tr>

<td><a href="http://perldoc.perl.org/perlretut.html#Backreferences">Perl</a></td>

<td>\g1 \g2 ...  
\g-1 \g-2 ...  
\g{-1} \g{-2} ...  
\g{name}  
\k{name}  
\g'name'  
\k'name'</td>

</tr>

<tr>

<td><a href="http://php.net/manual/en/function.preg-match.php">PHP</a></td>

<td>\\1 .. \\9  
$1 .. $99  
${1} .. ${99}</td>

</tr>

<tr>

<td><a href="https://docs.python.org/2/library/re.html">Python</a></td>

<td>\1 .. \99  
\g1 .. \g99  
\g<name>  
(?P<name>...)  
(?P=name)  
</name></name></td>

</tr>

</tbody>

</table>

</td>

</tr>

</tbody>

</table>

## Other Hints:

*   ### [Bad and Good Extraction in Perl](/blog/Bad+and+Good+Extraction+with+Regular+Expressions+in+Perl)

*   ### [PHP: pgreg_match() vs. strpos() Performance](/articles/php-string-search.htm)
