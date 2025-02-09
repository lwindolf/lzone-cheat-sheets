## Check for GPU on server

    vulkaninfo --summary

## Check for GPU on laptop

Performance test is possible with

    vkcube

which also show which GPU is autoselected.

## Check for browser GPU support

Use one of the options

- Use [https://webgpureport.org/](https://webgpureport.org/)
- In Google Chrome use `chrome://gpu` to check for support.
- In browser console:

      navigator.gpu.requestAdapter().then((res) => { console.log(res)})

For performance and feature completeness tests use the WebGPU demo page https://webgpu.github.io/webgpu-samples/
