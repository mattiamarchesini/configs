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

function feature_uv {
  script_path="$HOME/.local/bin/install-uv"
  wget https://astral.sh/uv/install.sh -O $script_path
  chmod +x $script_path
  "$script_path" --no-modify-path
  uv generate-shell-completion bash > $HOME/.config/bash/completions/uv
  uv venv "~/.local/share/uv-venv"
}

function _feature_uv {
  rm -r "$(uv python dir)"
  rm -r "$(uv tool dir)"
  rm ~/.local/bin/uv ~/.local/bin/uvx' > "$HOME/.local/bin/install-uv"
  rm -rf "~/.local/share/uv-venv"
}

function feature_nix {
  apt install -y nix-bin
}


features='nix'
for a in $features; do eval "feature_$a"; done
