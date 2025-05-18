#!/usr/bin/env bash

set -xe

loadkeys it

bash install/disk_part_tool.sh

BASE_PKGS='base base-devel bash git nano curl wget networkmanager arch-install-scripts zip unzip'
pacman -Syu --noconfirm $BASE_PKGS
pacstrap /mnt $BASE_PKGS
genfstab -U /mnt >> /mnt/etc/fstab

cp install/install-2.sh /mnt/
read -p 'Type yes to modify install-2.sh' RESPONSE
if [[ "$RESPONSE" == "yes" ]]; then
    nano /mnt/install-2.sh
fi

arch-chroot /mnt /install-2.sh
