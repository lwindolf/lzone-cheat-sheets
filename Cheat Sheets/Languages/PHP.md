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

See [PHP Examples](https://lzone.de/#/LZone%20Examples/PHP%20Examples)

### Named Capture Groups

PHP supports multiple ways for named capture groups

    preg_match('/(?P<name>.+)/', $string, $matches);
    preg_match('/(?<name>.+)/',  $string, $matches);
    preg_match("/(?'name'.+)/",  $string, $matches);

All variants above return the same match named 'name'.

## Infrastructure

-   [PHP - Composer: dependency manangement](https://getcomposer.org/)
-   [PHP - Phing: build system](https://github.com/phingofficial/phing)

## PHP Security and Hardening

-   [PHP - php.ini Hardening](http://www.madirish.net/199)
-   [PHP - php.ini Security Check](https://github.com/funkatron/phpsecinfo)

