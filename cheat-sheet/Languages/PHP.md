## Basic Debugging 

Value Dumping

    print_r($someArray);      # Print flat arrays
    var_dump($var);           # Nested printing of arbitrary structures

## Handling Exceptions

To catch exceptions do

    try {
        # do something
    } catch(Exception $e) {
        print "$e\n";
    }

As not all of PHP and its libraries do consistenly throw real exceptions you might
want to convert runtime errors (that would otherwise terminate the code execution)
into catchable exceptions:

    set_error_handler(function($errno, $errstr, $errfile, $errline ){
        throw new ErrorException($errstr, $errno, 0, $errfile, $errline);
    });

## Regular Expressings

- For details check [PHP preg_match](/examples/PHP%20preg_match) and [PHP preg_replace](/examples/PHP%20preg_replace)
- [PHP - strpos vs. preg\_match](https://lzone.de/articles/php-string-search.htm):
    In-depth comparison of PHP string operation methods (strpos, strstr,
    stripos) with different PHP5 interpreters and compared to the C
    equivalents.
- [PHP - Named Capture Groups](https://www.regular-expressions.info/named.html): As PHP uses
    PCRE it also supports named capture groups:

        preg_match("/(?P\d{4})-(?P\d{2})-(?P\d{2})/", "2012-10-20")

## Infrastructure

-   [PHP - Composer: dependency manangement](https://getcomposer.org/)
-   [PHP - Phing: build system](https://github.com/phingofficial/phing)

## PHP Security and Hardening

-   [PHP - php.ini Hardening](http://www.madirish.net/199)
-   [PHP - php.ini Security Check](https://github.com/funkatron/phpsecinfo)

