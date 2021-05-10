---
related:
   cheat-sheet: ['Node.js']
---

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

## Using npm modules for clients

E.g. exposing jquery with Express:

    app.use('/assets', [
        express.static(path.join(__dirname, 'node_modules', 'jquery', 'dist'))
    ]);

which allows the client to fetch `/assets/jquery.js`.

## Misc

-   [NPM global vs locally installed
    modules](http://blog.nodejs.org/2011/03/23/npm-1-0-global-vs-local-installation/)
