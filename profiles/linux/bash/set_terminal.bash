# Colorized terminal output ############################################################################################

color_prompt='no'
case "$TERM" in
    xterm*|*-256color|rxvt*) color_prompt='yes';;
esac
export $color_prompt

# If We have color support; assume it's compliant with Ecma-48 (ISO/IEC-6429). Lack of such support is extremely rare,
# and such a case would tend to support setf rather than setaf.
if [ "$color_prompt" = yes ] && [ "$(command -v tput)" ] && tput setaf 1 >&/dev/null; then

    # Enable dircolor color support
    if command -v dircolors > /dev/null; then
        # Customize default colors
        #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        #LS_COLORS=''
        #GREP_COLORS=''

        shopt -s expand_aliases
        alias ls=/usr/bin/ls --color=auto
        alias dir=/usr/bin/dir --color=auto
        alias vdir=/usr/bin/vdir --color=auto
        alias grep=/usr/bin/grep --color=auto
        alias fgrep=/usr/bin/fgrep --color=auto
        alias egrep=/usr/bin/egrep --color=auto
        shopt -u expand_aliases
    fi

    # colored GCC warnings and errors
    export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

    # make less more friendly for non-text input files, see lesspipe(1)
    if command -v lesspipe > /dev/null; then eval "$(SHELL=/bin/sh lesspipe)"; fi

fi

