Use `strripos()` to do case insensitive backwards matching for substrings in PHP.

## Important: Use Correct Comparsion Operator!

Only ever compare with the identical operators `===` / `!==` and only ever compare with `false`!

### Positive match

     if (strripos($str, $substr) !== false) {
          echo("Does match!")
     }

### Negative match

     if (strripos($str, $substr) === false) {
          echo("Does not match.")
     }

Check out [PHP strpos](https://lzone.de/examples/PHP strpos] for more details.

## Search From Offset

If you want to continue a search or want to skip something at the end use an offset as third parameter:

     if (strripos($str, $substr, 5) === false) {

By using the return value of `strripos() you can do repeated searches:

     $pos1 = strripos($str, $substr);
     $pos2 = strripos($str, $substr, $pos1 + strlen($pos1));



