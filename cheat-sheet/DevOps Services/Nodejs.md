## CLI

    node <script file>

## NPM

Node Package Manager

### Commands

    npm list        # Show packages in local path
    npm list -g     # Show global packages
    npm list -g -p      # Show global packages, parseble list

    npm view <package>

    npm install <package>[@<version>]
    npm uninstall <package>[@<version>]
    npm rm <package>

    npm search <something>

    npm link <package>    # Link global package into user env
    npm unlink <package>

    npm link        # Link package into global env (when in package dir)
    npm unlink

### Development

    npm init        # Create new package

    npm publish
    npm unpublish <package>

    npm adduser

    npm owner add <user> <package>
    npm owner rm <user> <package>
    npm owner ls <package>

    npm start       # Start an app

Misc:

-   [NPM global vs locally installed
    modules](http://blog.nodejs.org/2011/03/23/npm-1-0-global-vs-local-installation/)

## n Commands

Node Version Manager

    npm install n

    n help
    n ls
    n <version>       # Install version
    n use <version>
    n bin <version>   # Print bin path
    n rm <version>
    n --latest      # Print latest version
    n --stable      # Print latest stable

## PM2 Commands

PM2 Process Manager

    pm2 log
    pm2 flush

    pm2 list
    pm2 kill
    pm2 <start|stop|restart|reload> <all|id|app_name>
    pm2 describe <id>
    pm2 monit

    pm2 prettylist    # For complete JSON process infos including
                      # memory, CPU, restart, latency metrics

Install PM2 as Systemd service:

    sudo pm2 startup systemd

## Monitoring

-   [Etsy Statsd](https://github.com/etsy/statsd)

## Node.js Enterprise Support

-   [Running Node.js at enterprise level](http://codewinds.com/assets/article/battle-ready-hardening-nodejs-enterprise.pdf)
    (slides, PDF)

## Node.js with self-signed certs

Accept self-signed certs: set env variable

    export NODE_TLS_REJECT_UNAUTHORIZED=0

or in your code set

    process.env.NODE_TLS_REJECT_UNAUTHORIZED = "0";


