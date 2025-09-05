# install homebrew
xcode-select --install
export NONINTERACTIVE=1
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

export MANPATH="/opt/homebrew/opt/coreutils/share/man:$MANPATH"
brew install bash bash-completion@2 curl wget yq tar gzip less nano python@3
