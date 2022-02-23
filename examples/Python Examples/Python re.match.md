---
related:
   examples: [ 'Python re.sub' ]
---

Note that re.match() matches from the start of the string. Use re.search() when you want to match anywhere in a string.

- Use re.search() if you want to search anywhere inside a string
- Use <a href='Python re.sub'>re.sub()</a> if you want to substitute substrings.
- Use <a href='Python split'>str.split()</a> if you want to extract fields when you have a common field separator.


## Syntax

### Ad-hoc match

    import re

    result = re.match(pattern, string, flags=0);

### Pre-compiled pattern

Use this if you use a pattern multiple times.

    import re

    pattern = re.compile('some pattern')
    result = pattern.match(string [, pos [, end]]);

### Simple Examples

    result = re.match(r'abc', input)               # Check for substring 'abc'
    result = re.match(r'^\w+$', input)             # Ensure string is one word

    pattern = re.compile('abc')                    # Same as first example
    result = pattern.match(input)
