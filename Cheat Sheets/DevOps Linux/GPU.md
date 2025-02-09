## Check for GPU on server

General GPU support is easy to check via Vulkan

    vulkaninfo --summary

For NVidia you can also check with

    nvidia-smi

For AMD

    aticonfig --odgc --odgt

## GPU Monitoring

For load monitoring

    nvtop
    radeontop

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
