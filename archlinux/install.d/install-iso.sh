#!/usr/bin/env bash

set -xe

loadkeys it

bash install/disk_part_tool.sh

BASE_PKGS='base base-devel bash git nano curl wget networkmanager arch-install-scripts zip unzip'
pacman -Syu --noconfirm $BASE_PKGS
pacstrap /mnt $BASE_PKGS
genfstab -U /mnt >> /mnt/etc/fstab

read -p 'Type y to modify install.sh' RESPONSE
if [[ "$RESPONSE" == "y" ]]; then
    nano /mnt/install.sh
fi

cp install/install.sh /mnt/
arch-chroot /mnt /install.sh
