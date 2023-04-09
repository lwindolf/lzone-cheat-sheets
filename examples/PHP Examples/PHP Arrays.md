
## Creating Arrays

### Lists

    $a = array(1, 2, 3, 4);	
    $b = array("abc", "def", "ghi");
    $empty = array();

Assign values to specific indizes:

    $list = array();
    $list[1] = 'Tom';
    $list[45] = 'Sam';
    $list[100] = 'Julie';

### Hashes

To create an associative array create a list of key/value pairs:

    $h = array(
        'command'	=> 'grep',
        'path'		=> '/usr/bin',
        'options'	=> '-ac',
        'param1'	=> '"pattern"',
        'param2'	=> '/data/file1.txt'
    );

### Nesting Arrays

To create a multi-dimensional array just nest array() declarations as values:

    $a = array(
        array("key1", 4, 0, "description 1"),
        array("key2", 0, 33, ""),
        array("", 0, 10000, "something")
    );

### Array &lt;-> String

    $s = implode($a, ",");
    $a = explode($s, ",");

### Array Functions

    array_push($a, "new value");
    array_unshift($a, "new value");

    $value = array_pop($a);
    $value = array_shift($a);

    array_walk($a, 'callback_function');

    $a = array_unique($a);

    $keys    = array_keys($a);
    $indices = array_keys($a, 'key value');

### Iterating Arrays

Get Length

    echo count($list);

Iterate with for loop

    for($i = 0; $i < count($list); $i++) {
        echo "$i: $list[$i]\n";
    }

Iterate with foreach loop

foreach($list as $element) {
	print "$element\n";
}

### Iterating Hashes

    foreach($hash as $key => $value) {
        print "$key => $value\n";
    }

