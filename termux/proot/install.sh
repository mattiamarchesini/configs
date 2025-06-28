#!/usr/bin/env bash

export DEBIAN_FRONTEND='noninteractive'
apt update && apt upgrade -y
apt install -y --no-install-suggests\
  bash-completion curl git jq man-db manpages\
  manpages-dev nodejs npm python3 tmux wget\
  pip pipx python3-venv

mkdir -p "$HOME/.config/"
mkdir -p "$HOME/.local/share/"
mkdir -p "$HOME/.local/bin/"

ln -s /storage/emulated/0 $HOME/storage
ln -s /storage/emulated/0/user-data $HOME/user-data
ln -s /data/data/com.termux/files/home/git $HOME/git

#./$HOME/git/configs/scripts/cfg init termux-proot
source $HOME/.profile
