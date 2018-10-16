This is a cheat sheet on how to correctly setup Mesa / OpenGL + Vulkan + DXVK 

## Common dependencies

Always install the following

    apt install libvulkan1 libvulkan-dev vulkan-utils

## Instructions per GPU vendor

### Intel Graphics

When using Intel this means using Mesa

    apt install mesa-vulkan-drivers

### Nvidia

Use this PPA

    add-apt-repository ppa:graphics-drivers/ppa
    apt update
    apt upgrade
    apt install vulkan

### AMD

FIXME

## Verify setup

Running

    vulkaninfo

should print a lot of infos and not INCOMPATIBLE_DRIVER
