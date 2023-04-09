## Syntax

    $c = curl_init();
    curl_setopt ($c, CURLOPT_&lt;some option>, "some value");
    curl_setopt ($c, CURLOPT_&lt;some option>, 531);
    curl_exec ($c);

## Examples

### HTTP POST

    curl_setopt ($c, CURLOPT_URL, "http://example.com/");
    curl_setopt ($c, CURLOPT_POST, 1);
    curl_setopt ($c, CURLOPT_POSTFIELDS, "field1=value1&amp;field2=value2");

### HTTP no header

    curl_setopt ($c, CURLOPT_HEADER, 1);

### FTP

    curl_setopt ($c, CURLOPT_URL, "ftp://example.com/");
    curl_setopt ($c, CURLOPT_FTPLIST_ONLY, 1);
    curl_setopt ($c, CURLOPT_RETURNTRANSFER, 1);

