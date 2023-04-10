PHP inherits the ternary operator you might know from C, Java, Javascript or Perl.

## Syntax

    <condition> ? <value on true> : <value on false>

## Examples

Set variable `$query` with HTTP GET parameter `q` or to `default` if parameter is missing.

    $query = isset($_GET['q'])?$_GET['q']:'default';

Multiple defaults: the first non-false value is returned

    $result = $input1 ?: $input2 ?: $input3

## Use Cases

Why would you want to use the ternary operator?

- Non-disruptive editing of existing code
- Shorter than an equivalent if condition (1 instead of 5 lines)
- If you want to output the result of the condition in 1 output method invocation
- To use a list of variables as defaults for a result

