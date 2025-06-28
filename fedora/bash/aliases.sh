shopt -s expand_aliases
alias pk='sudo dnf -y'
alias pka="pk install --setopt='install_weak_deps=False'"
pkr(){ pk remove "$@"; pk autoremove; }
alias pku="pk upgrade --setopt='install_weak_deps=False'"
#shopt -o expand_aliases
