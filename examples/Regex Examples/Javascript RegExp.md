## Checking for Patterns

To check wether a string matches a pattern use RegExp.test()

    var s = "abcdef";
    var re = /abc.+/;
    
    if(re.test(s))
        console.log("matches!");

## Extracting Matches

To use capture groups you must not use RegExp.test() but String.match(). The resulting array will have one 
string for the entire match and one for each capture group.

    var results = "abcdef".match(/bc(def)/);
    console.log(results[0]);            # Gives "bcdef"
    console.log(results[1]);            # Gives "def"
    
If a pattern doesn't match null is returned.

## Replacing Patterns

To replace substrings by pattern just pass a regular expression to String.replace()

    var result = "some  wild    spaces".replace(/\s+/, '');

To restructure a string using capture groups use backreferences in the target string like this

    var result = "2018-02-01".replace(/(\d+)-(\d+)-(\d+)/, '$3.$2.$1');

## Splitting by Regexp

Split into result array:

    var results = s.split(/\s+/);         # e.g. split by whitespace separated columns

## Reusing RegExp objects

To reuse expressions assign them to a variable or explicitely create an RegExp object like this

    var re = /abc/;
    var re = new RegExp("abc");
