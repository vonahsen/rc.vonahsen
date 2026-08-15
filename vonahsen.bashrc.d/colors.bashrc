#! /bin/bash
# probably redundant, but shuts shellcheck up

# dircolors settings and enablement
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
	# from debian upstream, I trust them to know how A && B || C evaluates
	# shellcheck disable=SC2015 
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi
