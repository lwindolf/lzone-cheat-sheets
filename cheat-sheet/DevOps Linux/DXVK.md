This is a cheat sheet on how to correctly setup Mesa / OpenGL + Vulkan + DXVK 

Helpful tutorials online
- https://linuxconfig.org/improve-your-wine-gaming-on-linux-with-dxvk
- https://www.reddit.com/r/wine_gaming/comments/8f5awl/tutorial_installing_dxvk_in_playonlinux/

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

should print a lot of infos and not VK_ERROR_INCOMPATIBLE_DRIVER

## Debuging performance

Run your wine setup with the following environment

    export DXVK_HUD=devinfo,fps 
