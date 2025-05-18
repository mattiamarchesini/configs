#!/usr/bin/env bash
export DEBIAN_FRONTEND=noninteractive
apt update && apt upgrade -y
apt install -y --no-install-suggests\
  bash-completion curl jq man manpages\
  proot-distro termux-api tmux wget

termux-setup-storage
ln -s /storage/emulated/0/user-data $HOME/
#ln -s /storage/emulated/0/git $HOME/
mkdir $HOME/git
mkdir $HOME/.config
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.local/share
touch $HOME/.hushlogin

# use XDG instead of cluttering HOME
#rm -rf $HOME/.termux

#$HOME/git/configs/scripts/cfg setup termux

proot-distro install debian
