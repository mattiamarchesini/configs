#!/usr/bin/env bash

function install_paru {
  git clone https://aur.archlinux.org/paru.git
  echo "mattia ALL=(ALL) NOPASSWD: /usr/bin/pacman" > /etc/sudoers.d/free-pacman
  sudo --user=mattia makepkg -si --noconfirm -D paru
  rm /etc/sudoers.d/free-pacman
  rm -rf paru
}

function install_bootloader {
}

if command -v systemctl > /dev/null; then
  systemctl enable --now NetworkManager.service
fi

ln -sf /usr/share/zoneinfo/Europe/Rome /etc/localtime
hwclock --systohc

echo LANG=it_IT.UTF-8 >> /etc/locale.conf
locale-gen
echo KEYMAP=it >> /etc/vconsole.conf

echo arch > /etc/hostname

passwd
useradd -s /bin/bash -G wheel -U -m mattia
passwd mattia
echo "%wheel ALL=(ALL:ALL) ALL" >> /etc/sudoers

install_paru

mkinitcpio -P

install_bootloader

rm /install-2.sh

reboot
