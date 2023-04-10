related:
   cheat-sheet: ['PHP stripos','PHP strrpos','PHP strripos']
---

Use `strpos()` to perform case sensititve matches.

## Important: use the correct comparsion operator!

With `strpos()` functions always use the identical operator `===` / `!==` and compare to `false`!

<table>
<tr><td><b style="color:#4a4">CORRECT</b></td><td>
<pre>if (strpos($str, $substr) === false) {</pre>
<pre>if (strpos($str, $substr) !== false) {</pre>
</td></tr>
<tr><td><b style="color:red">WRONG</b></td><td>
<pre>if (strpos($str, $substr) != false) {</pre>
<pre>if (strpos($str, $substr) == false) {</pre>
</td></tr>
</table>

The reason for using the identical operators (that also check for the type of the value) `===` / `!==` is that `strpos()` might return `0` for a match at the beginning or `false` for no match which cannot be distinguished by `==` or `!=`.

## Case Sensitivity

`strpos()` is case sensistive. When you want case insensitivity simply use `stripos()` instead.
`
## Search From Offset

If you want to continue a search or want to skip something at the start use an offset as third parameter:

    if (strpos($str, $substr, 5) === false) {

By using the return value of `strpos()` you can do repeated searches:

    $pos1 = strpos($str, $substr);
    $pos2 = strpos($str, $substr, $pos1 + strlen($pos1));

## Searching Backwards

There is an additional set of methods for backwards searching:

<table>
<tr>
<td><b>strrpos()</b></td><td>case sensitive backwards searching</td>
</tr><tr>
<td><b>strripos()</b></td><td>case insensitive backwards searching</td>
</tr>
</table>

## Extract Found Strings

If you want to extract a string at the position you've found you need to use the `substr()` method.

    $pos = strpos($str, $substr);
    $result = substr($str, $pos);

## When not to use strpos()?

Do not use `strpos()` if you want to do the following things:

- Test for a pattern at the start or end of a string -> <a href="https://lzone.de/examples/PHP preg_match">use preg_match()</a>
- Extract multiple substrings -> use <a href="https://lzone.de/examples/PHP preg_match">preg_match()</a>
- Match a string for a complex pattern -> use <a href="https://lzone.de/examples/PHP preg_match">preg_match()</a>
- If you want to split a string a delimiters -> use <a href="http://de3.php.net/manual/en/function.strpbrk.php">strpbrk()</a>
