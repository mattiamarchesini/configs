#!/usr/bin/env bash

function feature_ssh {
  pk install ssh
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
