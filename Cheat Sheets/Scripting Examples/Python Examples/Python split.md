## Syntax

    str.split(sep=None, maxsplit=-1)

Note how the delimiter is optional. Passing None causes shell-like whitespace splitting.

By specifying the maxsplit parameter you can limit the number of results

## Examples

    >>> 'Fri Nov  2 21:40:09 CET 2018'.split()
    ['Fri', 'Nov', '2', '21:40:09', 'CET', '2018']
    
    >>> 'Fri Nov  2 21:40:09 CET 2018'.split(' ')
    ['Fri', 'Nov', '', '2', '21:40:09', 'CET', '2018']     <--- Note the extra empty string!
    
    >>> 'a,b,c'.split(',', 1)
    ['a', 'b,c']


Be careful on the border cases for empty strings!

    >>> ''.split()
    []

    >>> ''.split(' ')
    ['']



## Related Methods

- To split on newlines use *str.splitlines()*
- When you split only a part of the string you can use *str.rsplit()* to start splitting from the right
- When you want to split on regex patterns use *re.search()*
