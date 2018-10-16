This is a cheat sheet on how to correctly setup Mesa / OpenGL + Vulkan + DXVK 

Helpful tutorials online
- https://github.com/lutris/lutris/wiki/How-to:-DXVK
- https://linuxconfig.org/improve-your-wine-gaming-on-linux-with-dxvk
- https://www.reddit.com/r/wine_gaming/comments/8f5awl/tutorial_installing_dxvk_in_playonlinux/

## Common dependencies

Always install the following

    apt install libvulkan1 libvulkan-dev vulkan-utils

## Instructions per GPU vendor

A general support matrix can be found here https://en.wikipedia.org/wiki/Vulkan_(API)#Compatibility

### Intel Graphics

Intel support starts with i3-/i5-/i7-3000 chipsets.

When using Intel this means using Mesa

    apt install mesa-vulkan-drivers

### Nvidia

Use this PPA

    add-apt-repository ppa:graphics-drivers/ppa
    apt update
    apt upgrade
    apt install vulkan

### AMD

Note: the "radeon" driver won't work with vulkan.

FIXME

## Verify setup

Running

    vulkaninfo

should print a lot of infos and not VK_ERROR_INCOMPATIBLE_DRIVER

## Debuging performance

Run your wine setup with the following environment

    export DXVK_HUD=devinfo,fps 
