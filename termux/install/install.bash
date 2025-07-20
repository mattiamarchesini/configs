#!/usr/bin/env bash

termux-setup-storage
ln -s /storage/emulated/0/user-data $HOME/
#ln -s /storage/emulated/0/git $HOME/
mkdir $HOME/git

# use ~/.config/termux instead of cluttering HOME
rm -rf $HOME/.termux

proot-distro install debian
