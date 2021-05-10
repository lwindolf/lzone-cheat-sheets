---
related:
   cheat-sheet: ['npm']
---

## CLI

    node <script file>
    node -c <script file>     # Syntax check

## Node Version Manager Commands

Installation

    npm install n

Usage

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

## Node.js with extra CAs

You can make Node.js handle additional CAs like that

    export NODE_EXTRA_CA_CERTS=<path to ca certs>
