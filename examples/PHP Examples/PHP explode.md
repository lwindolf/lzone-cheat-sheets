## Syntax

Use `explode()` in one of the following syntax variants with `$delimiter` being the separator string.

    $array = explode($delimiter, $string);
    $array = explode($delimiter, $string, $limit);

## Simple Examples

    $fields = explode(',', $csv);
    $lines  = explode('\n', $text);

## Advanced Usage

`explode()` is often used in conjuction with `implode()` to do something really useful.

    # Replace separator ';' with ','
    $result = implode(',', explode(';', $input));

