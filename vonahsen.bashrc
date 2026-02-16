# If not running interactively, don't do anything
[ -z "$PS1" ] && return


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias grep='grep --color=auto'
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# append to the history file, don't overwrite it
shopt -s histappend
export HISTCONTROL=ignoreboth
export HISTSIZE=-1
export HISTFILESIZE=-1
export PROMPT_COMMAND="history -a; history -n"

HISTTIMEFORMAT="%Y/%m/%d %T "


export PATH=$PATH:/home/barry/android/platform-tools
