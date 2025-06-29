#!/usr/bin/env bash

# Launch this script from the iso to install ArchLinux on hardware

set -xe

install_bootloader() {
}


loadkeys it

bash -c 'install/disk_part_tool.sh'

pacman -Syu
PKGS=$(cat install/pacman-requirements | tr "\n" " ")
pacstrap /mnt $PKGS arch-install-scripts networkmanager linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

cp install/install.sh /mnt/
read -p 'Type y to modify install.sh' RESPONSE
if [[ "$RESPONSE" == 'y' ]]; then
    nano /mnt/install.sh
fi

arch-chroot /mnt /bin/bash -c '/install.sh'
rm /mnt/install.sh

arch-chroot /mnt /bin/bash -c 'mkinitcpio -P'

install_bootloader

clear
read -p 'Type y to reboot now' RESPONSE
if [[ "$RESPONSE" == "y" ]]; then
  reboot
fi
