Stuff to know when writing PWAs without a framework.

## Minimum PWA infrastructure

- index.html
- manifest.json
- worker.js

## Using URI schemas to combine apps

PWAs (and other apps/applications) both on mobile and desktop OS can trigger each other
using custom registered URI schemes: 
See https://github.com/MicrosoftEdge/MSEdgeExplainers/blob/main/URLProtocolHandler/explainer.md

URI schemes are registered in manifest.json

## Testing the PWA

1. [Chrome](https://developer.chrome.com/docs/devtools/progressive-web-apps/) is better at checking stuff than Firefox
2. Perform at least a test offline using the network throttling settings
3. Check the "Cache Control" header of the website serving the PWA (reasonable interval for standard files, short or no interval for worker.js)

## Cache busting

There is a good summary at https://jun711.github.io/web/service-worker-cache-busting/

It is also a good practice to allow the user to perform a cache reset. E.g. using a "Reset Cache"
button available in the preferences that triggers a service worker message asking the service
worker to drop the cache, e.g.:

     navigator.serviceWorker.controller.postMessage('resetCache');
   
