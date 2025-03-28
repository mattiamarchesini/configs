# REMEMBER: source this script before aliases

# make less more friendly for non-text input files, see lesspipe(1)
if command -v lesspipe > /dev/null; then eval "$(SHELL=/bin/sh lesspipe)"; fi


case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
else
    color_prompt=
fi

# Set PS1 for different environments
unset color_prompt

# enable color support of ls and also add handy aliases
if command -v dircolors > /dev/null; then
#if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    ls() { /usr/bin/ls --color=auto "$@"; }
    dir() { /usr/bin/dir --color=auto "$@"; }
    vdir() { /usr/bin/vdir --color=auto "$@"; }

    grep() { /usr/bin/grep --color=auto "$@"; }
    fgrep() { /usr/bin/fgrep --color=auto "$@"; }
    egrep() { /usr/bin/egrep --color=auto "$@"; }
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
