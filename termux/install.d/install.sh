#!/bin/bash

set -xe

function update_sys() {
  pkg update && pkg upgrade -y
}

function install_dependencies() {
  pkg install -y "$(cat requirements | tr "\n" ' ')"
  # install termux-adb
  curl -s https://raw.githubusercontent.com/nohajc/termux-adb/master/install.sh | bash
  
  install_acodex_server
  
  pip install -U pipx
}

# Acodex is a plugin for the Acode app (F-Droid)
function install_acodex_server() {
  mkdir -p $HOME/.gyp && \
   echo "{'variables': {'android_ndk_path': ''}}" > $HOME/.gyp/include.gypi

  npm i -g acodex-server
}

update_sys
install_dependencies
termux-setup-storage
proot-distro install debian
#proot-distro login debian