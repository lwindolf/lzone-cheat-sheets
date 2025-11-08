## CLI

cryptsetup open <device> <mapper name>
cryptsetup status <mapper name>
cryptsetup close <mapper name>

cryptsetup luksFormat /dev/sdb1

## Encrypting USB stick/SD card

See also this good guide on [LUKS encryption](https://comfy.guide/client/luks/).

1. Ensure it is unmounted
2. `cryptsetup luksFormat /dev/sdb1`
3. `cryptsetup open /dev/sdb1 cryptusb1`
4. `mkfs.ext4 /dev/mapper/cryptusb1`
5. `cryptsetup close cryptusb1`
6. Mount it via file manager
