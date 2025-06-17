#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y --no-install-suggests $(cat requirements | tr "\n" " ")

bash 
termux-setup-storage
ln -s /storage/emulated/0/user-data $HOME/
#ln -s /storage/emulated/0/git $HOME/
mkdir $HOME/git
mkdir $HOME/.config
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share
touch $HOME/.hushlogin

# use ~/.config/termux instead of cluttering HOME
rm -rf $HOME/.termux

$HOME/git/configs/.bin/cfg init termux

proot-distro install debian
