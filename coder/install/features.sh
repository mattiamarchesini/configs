#!/usr/bin/env bash

function feature_ssh {
  dnf --set-opt="" ssh
  ssh-keygen -t ed25519 -C "$CREDENTIALS_EMAIL"
  ssh-add ~/.ssh/id_ed25519
}

function feature_gpg {
  pk install gnupg
  gpg --full-generate-key
  key_id=$(gpg --list-secret-keys --keyid-format=long | grep sec | awk '{print $2}' | cut -d '/' -f2)

  # Copy  the GPG key ID, in ASCII armor format
  gpg --armor --export "$key_id" | clp
}

function feature_neovim_env {
  if command -v nvim &> /dev/null; then
    echo "nvim is installed"
    echo 'installing neovim stuff'
  else
    echo "nvim is not installed"
  fi
}
