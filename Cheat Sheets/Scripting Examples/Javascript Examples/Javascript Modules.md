## Module Standards

* [common.js AMD standard](http://wiki.commonjs.org/wiki/Modules/AsynchronousDefinition)
* [Modules in ES6](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import)

## Importing ESM modules

Here is how you import modules without a packager.

### Find ESM for a package

If you download packages via `npm` check the `node_modules/<name>/dist` directory for files with
- extension `.es.js`
- extension `.esm.js`

### Import ESM module

Now there are two variants depending on the module having a default export or not:

1. `import * as Example from "./example.esm.js";`
2. `import { Example } from "./example.esm.js";`

Check the `export` statement in the module wether it has `as default` or not. If yes, use variant #1.

## Get converted ESM module from CDNJS

Just download `https://esm.run/<module name@version>` to get a auto converted module. The conversion
will not always work, but often will and is easier than the other workarounds.

## Importing UMD modules

From https://stackoverflow.com/questions/51461723/import-umd-javascript-modules-into-browser

    export default async function (url, module = {exports:{}})
    {
        const response = await fetch(url);
        const script = await response.text();
        const func = Function("module", "exports", script)
        func.call(module, module, module.exports);
        return module.exports;
    };
