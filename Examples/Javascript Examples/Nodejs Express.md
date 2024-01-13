## Generate Express project

    npm install express-generator -g

    express <name>        # Create boiler plate

## Enabling CORS in Express

To set CORS headers add an `app.use()` block like this

    app.use(function (req, res, next) {
        res.setHeader('Access-Control-Allow-Origin', 'http://server:8080');
        res.setHeader('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, PATCH, DELETE');
        res.setHeader('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
        res.setHeader('Access-Control-Allow-Credentials', true);
        next();
    });

## Debugging Express Applications

Ensure to install the 'debug' module

    npm install debug

And the run with debugging enabled by setting the DEBUG environment variable like this

    DEBUG=express:* node index.js
    DEBUG=http,mail,express:* node index.js
    
    DEBUG=<app name>  node ./bin/www
    
    DEBUG_FD=3 node index.js 3> logfile

Debugging code would look like

    d = debug('http:instance1');

    d('Some logged event');
    d('Another logged event');

