export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_BIN_HOME=$HOME/.local/bin
export PATH="$XDG_BIN_HOME:$PATH"
export REPOS_HOME=$HOME/git

export LESSHISTFILE=/dev/null
#export NIX_PATH='nixpkgs=channel:nixos-23.11'

if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi
