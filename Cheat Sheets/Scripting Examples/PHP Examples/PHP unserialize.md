When you want to store PHP data structures in a database or network request you use 
`serialize`/`unserialize` to convert and restore the data. Below is an example:

    <?php
    $data_string = serialize(array(1, 'a string', 'another string'));
    echo $data_string . '\n';

    $data = unserialize($data_string);
    var_dump($data);
    ?>

Test unserialize online using a site like <a href="http://unserialize.com">unserialize.com</a>
