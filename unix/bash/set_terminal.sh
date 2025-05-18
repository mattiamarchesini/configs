# REMEMBER: source this script before aliases.sh and after 

case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# If We have color support; assume it's compliant with Ecma-48
# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
# a case would tend to support setf rather than setaf.)
if [ command -v tput ] && tput setaf 1 >&/dev/null; then

    export COLOR_PROMPT=yes
    export PS1=


    # Enable dircolor color support
    if command -v dircolors > /dev/null; then
        # Customize default colors
        #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        #LS_COLORS=''
        #GREP_COLORS=''

        alias ls=/usr/bin/ls --color=auto
        alias dir=/usr/bin/dir --color=auto
        alias vdi=/usr/bin/vdir --color=auto
        alias grep=/usr/bin/grep --color=auto
        alias fgrep=/usr/bin/fgrep --color=auto
        alias egrep=/usr/bin/egrep --color=auto
    fi

    # colored GCC warnings and errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    # make less more friendly for non-text input files, see lesspipe(1)
    if command -v lesspipe > /dev/null; then eval "$(SHELL=/bin/sh lesspipe)"; fi

else
    export COLOR_PROMPT=no
    export PS1=
fi

