## Syntax of ini_set()

The [ini_set() syntax](http://php.net/manual/en/function.ini-set.php) is simple:

    string ini_set ( string $varname , string $newvalue )

it is just a key value setter. The important question is *which* values can be set. Below you find a list of working examples. 
Please note that you cannot change all php.ini options especially those that need to be set before PHP initializes.

## Useful Working ini_set() Examples

### Enabling error display

On production sites you typically do not show errors in the page for usability and security reasons. But when you when you debug something live you might want to enable it temporarily and just for you:

    # Assuming 5.44.33.22 is your IP...
    if ( $_SERVER["REMOTE_ADDR"] == "5.44.33.22") {
        ini_set('display_errors', '1');
    }

Note: you may want to combine this with

    error_reporting(E_ALL | E_STRICT);

### Changing Memory Limit

When you need to increase memory from within the code:

    ini_set("memory_limit","1000M");

Note though that this might be prevent by a Suhosin hardended PHP installation.

### Adding include paths

Normally this shouldn't be necessary. It is way cleaner to do it in php.ini, but if you bundle libraries and you administrator doesn't know:

    <?php ini_set('include_path',ini_get('include_path').':../my-libs:');  ?>

## When You Cannot Use ini_set()

For most php.ini settings you can't use ini_set(). To workaround consider deploying a `.htaccess` along with your 
code as this `.htaccess` can provide all PHP options to overwrite the default php.ini settings.

For example to change the HTTP POST limit add this line to a `.htaccess` read by your webserver:

    php_value post_max_size 2500000

Note how the `php_value` prefix indicates settings for PHP. So the simple syntax is

    php_value <key name> <value>
