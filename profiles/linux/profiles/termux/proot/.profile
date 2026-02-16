XDG_CONFIG_HOME=$HOME/.config
XDG_DATA_HOME=$HOME/.local/share
XDG_BIN_HOME=$HOME/.local/bin
PATH="$XDG_BIN_HOME:$PATH"
REPOS_HOME=$HOME/git
CONFIGS_REPO=$REPOS_HOME/config

LESSHISTFILE=/dev/null
PROOT_DISTRO="debian"
export NIX_PATH='nixpkgs=channel:nixos-23.11'
