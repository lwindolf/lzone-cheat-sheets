## Data Types

Dumping complex structures

    import json
    print json.dumps(something)

### Python Arrays (Lists)

Print array of strings:

    print "\n".join(arr)

Iterating by index

    for i in range(len(arr)):
      print arr[i]
      
## Exceptions

    try:
       # Do something
    except Exception as e:
       # Handle it

For empty exception clauses add the `pass` statement.

## Standard Tasks

### Passing CLI arguments

    import sys

    print(sys.argv[0])      # Access C-like argv array as needed

### Using env variables

    import os
    print(os.environ)
    
    print(os.environ.get('HTTPS_PROXY'))
    os.environ['MYVAR'] = 'myvalue'

### Reading from a Pipe in Python

Line by line

    proc = subprocess.Popen(['/bin/ls', 'something'],stdout=subprocess.PIPE)
    while True:
      line = proc.stdout.readline()
      if line != '':
        do_something
      else:
        break

Entire output at once

    echo subprocess.check_output(['/bin/ls', 'something])

### Parse JSON in Python

    import json
    data = json.loads(json_string)

### Convert YAML to JSON

    import yaml, json

    with open('./file.yaml') as f:
        print(json.dumps(yaml.load(f)))
