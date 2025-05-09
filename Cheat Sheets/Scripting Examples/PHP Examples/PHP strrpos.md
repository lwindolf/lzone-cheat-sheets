Use `strrpos()` to do backwards matching for substrings in PHP.

## Important: Use Correct Comparsion Operator!

Only ever compare with the identical operators `===` / `!==` and only ever compare with `false`!

### Positive match

     if (strrpos($str, $substr) !== false) {
          echo("Does match!")
     }

### Negative match

     if (strrpos($str, $substr) === false) {
          echo("Does not match.")
     }

Check out [PHP strpos](https://lzone.de/examples/PHP+strpos) for more details.

## Search From Offset

If you want to continue a search or want to skip something at the end use an offset as third parameter:

     if (strrpos($str, $substr, 5) === false) {

By using the return value of `strrpos()` you can do repeated searches:

     $pos1 = strrpos($str, $substr);
     $pos2 = strrpos($str, $substr, $pos1 + strlen($pos1));




