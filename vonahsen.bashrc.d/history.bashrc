#! /bin/bash
# probably redundant, but shuts shellcheck up

# history settings
# append to the history file, don't overwrite it
shopt -s histappend
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=-1
export HISTFILESIZE=-1
export PROMPT_COMMAND="history -a; history -n"

HISTTIMEFORMAT="%Y/%m/%d %T "

