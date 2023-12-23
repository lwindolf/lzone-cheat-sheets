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
