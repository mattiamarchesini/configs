#!/usr/bin/env bash

function feature_neovim {
  # Install official appimage
  arch=$(uname -m)
  if [[ "$arch" != "x86_64" && "$arch" != "arm64" ]]; then
    if [[ "$arch" == "aarch64" || "$arch" == "arm64" ]]; then
      arch="arm64"
    else
      echo "Architecture $arch not supported" >&2
      exit 1
    fi
  fi

  curl -o $HOME/.cache/nvim -L https://github.com/neovim/neovim/releases/latest/download/nvim-linux-${arch}.appimage
  chmod u+x $HOME/.cache/nvim
  mv -f $HOME/.cache/nvim $HOME/.local/bin/nvim

  VENV_DIR="$HOME/.local/share/venvs"
  if [ -d "$VENV_DIR" ]; then
    NEOVIM_VENV_PATH="$VENV_DIR/neovim"
    python3 -m venv "$NEOVIM_VENV_PATH"
    "$NEOVIM_VENV_PATH/bin/pip" install pynvim
  fi
}
