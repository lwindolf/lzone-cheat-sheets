## Load file content

    echo file_get_contents('./values.txt');

## Fetch URL content

    echo file_get_contents('http://google.com/');

## Use cookies

    $opts = array(
      'http' => array(
        'method' => "GET",
        'header' => "Accept-language: en\r\n" .
                    "Cookie: foo=bar\r\n"
      )
    );

    $context = stream_context_create($opts);
    echo file_get_contents('http://www.example.com/', false, $context);

## Send Form with HTTP POST

    $postdata = http_build_query(['username'=>'jane.doe', 'password'=>'12345']);
    $opts = array(
      'http' => array(
        'method'=> 'POST',
        'header' => 'Content-type: application/x-www-form-urlencoded'. PHP_EOL .'Content-Length: '. strlen($postdata). PHP_EOL,
        'content' => $postdata
      )
    );
    $send_data  = stream_context_create($opts);
    echo file_get_contents('http://example.com/login.php', false, $send_data);
