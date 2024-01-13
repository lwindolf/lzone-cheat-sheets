Use `stripos()` to do case insensitive substring matching in PHP.

## Important: Use Correct Comparsion Operator!

Only ever compare with the identical operators `===` / `!==` and only ever compare with `false`

### Positive match

     if (stripos($str, $substr) !== false) {
          echo("Does match!")
     }

### Negative match

     if (stripos($str, $substr) === false) {
          echo("Does not match.")
     }

Check out [PHP strpos](/examples/PHP strpos)' for more details

## Search From Offset

If you want to continue a search or want to skip something at the start use an offset as third parameter:

     if (stripos($str, $substr, 5) === false) {

By using the return value of `stripos()` you can do repeated searches:

     $pos1 = stripos($str, $substr);
     $pos2 = stripos($str, $substr, $pos1 + strlen($pos1));

### Searching Backwards

For backwards searching there is another special method `strripos()` with the same signature:

     if (strripos($str, $substr) === false) {
          echo("Does not match.")
     }
