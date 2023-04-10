This post gives some simple examples for using regular expressions with `preg_replace()` in PHP scripts.

## Syntax

While full syntax is

    mixed preg_replace ( mixed $pattern , mixed 
        $replacement , mixed $subject [, int $limit = -1 [, int &$count ]] )

you might to use the simpler examples given below:

## Simple Replacing

    $result = preg_replace('/abc/', 'def', $string);   # Replace all 'abc' with 'def'
    $result = preg_replace('/abc/i', 'def', $string);  # Replace with case insensitive matching
    $result = preg_replace('/\s+/', '', $string);      # Strip all whitespaces

## Advanced Usage

### Multiple replacements

    $result = preg_replace(
        array('/pattern1/', '/pattern2/'),
        array('replace1', 'replace2'),
        $string
    );

### Replacing with Back References

Back references allow you to re-insert a match captured using braces. There are different
ways to write a back reference e.g. `\\1`, `$1`, `${1}` for the first back reference:

    $result = preg_replace('/abc(def)hij/', '/\\1/', $string);
    $result = preg_replace('/abc(def)hij/', '/$1/', $string);
    $result = preg_replace('/abc(def)hij/', '/${1}/', $string);

### Perform only a limited number of replacements

    # Perform maximum of 5 replacements
    $result = preg_replace('/abc/', 'def', $string, -1, 5);

### Multi-line replace

    # Strip HTML tag
    $result = preg_replace('<span id="15">.*</span>#m', '', $string);
