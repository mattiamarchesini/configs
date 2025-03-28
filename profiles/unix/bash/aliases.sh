#!/usr/bin/env bash

ll() { ls -alF "$@"; }
la() { ls -A "$@"; }
l() { ls -CF "$@"; }

c() { clear; }
e() {
    exit
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
