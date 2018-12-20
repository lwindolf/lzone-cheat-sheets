
## Create Specs

- https://editor.swagger.io/

## Testing running API

<pre>$ mkdir swagger
$ wget https://example.com/dist/swagger.json

# install npm tools
$ npm --version
$ npm install json2yaml
$ npm install dredd
$ npm install junit-viewer

# convert json to yml as dredd reads only yml
$ ./node_modules/json2yaml/cli.js ./swagger/swagger.json > ./swagger/swagger.yml

# create ./dredd.yml (check user-field!)
---------------------------
dry-run: null
hookfiles: null
language: nodejs
sandbox: false
server: null
server-wait: 3
init: false
custom: {}
names: false
only: []
reporter: xunit
output: dredd-output.xml
header: []
sorted: false
user: !!!!!!!!username:password!!!!!!!
inline-errors: false
details: true
method: []
color: true
level: info
timestamp: true
silent: false
path: []
hooks-worker-timeout: 5000
hooks-worker-connect-timeout: 1500
hooks-worker-connect-retry: 500
hooks-worker-after-connect-wait: 100
hooks-worker-term-timeout: 5000
hooks-worker-term-retry: 500
hooks-worker-handler-host: 127.0.0.1
hooks-worker-handler-port: 61321
config: ./dredd.yml
blueprint: ./swagger/swagger.yml
endpoint: 'https://example.com'

----------------------

# run dredd
$ ./node_modules/dredd/bin/dredd --config dredd.yml

# view dredd results
$ ./node_modules/junit-viewer/bin/junit-viewer --results=dredd-output.xml --save=junit.html && firefox junit.html</pre>
