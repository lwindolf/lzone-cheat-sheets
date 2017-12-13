## PHP Exceptions Handling

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

## Regular Expressings in PHP

- For details check <?add topic='PHP preg_match'?> and <?add topic='PHP preg_replace'?>
- [PHP - strpos vs. preg\_match](http://lzone.de/articles/php-string-search.htm):
    In-depth comparison of PHP string operation methods (strpos, strstr,
    stripos) with different PHP5 interpreters and compared to the C
    equivalents.
- [PHP - Named Capture Groups](http://www.regular-expressions.info/named.html): As PHP uses
    PCRE it also supports named capture groups:

        preg_match("/(?P\d{4})-(?P\d{2})-(?P\d{2})/", "2012-10-20")

## PHP Infrastructure

-   [PHP - Frameworks Overview](http://www.phpframeworks.com/)
-   [PHP - Composer: dependency manangement](https://getcomposer.org/)
-   [PHP - Phing: build system](https://github.com/phingofficial/phing)

## PHP Security and Hardening

-   [PHP - php.ini Hardening](http://www.madirish.net/199)
-   [PHP - php.ini Security Check](http://phpsec.org/projects/phpsecinfo/index.html)

## Basic Debugging 

-   PHP - Value Dumping

        print_r($someArray);      # Print flat arrays
        var_dump($var);           # Nested printing of arbitrary structures

-   Python - Value Dumping

        print vars(somevar)


