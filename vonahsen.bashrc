# shellcheck disable=SC2148
# bash is pretty much implied with .bashrc :/

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# IDK how I'm going to distribute this yet
if [ -d /etc/rc.vonahsen/vonahsen.bashrc.d ]
then
	# shellcheck disable=SC1090
	source /etc/rc.vonahsen/vonahsen.bashrc.d/*
fi
if [ -d /usr/local/etc/rc.vonahsen/vonahsen.bashrc.d ]
then
	# shellcheck disable=SC1090
	source /usr/local/rc.vonahsen/vonahsen.bashrc.d/*
fi
if [ -d "${HOME}"/rc.vonahsen/vonahsen.bashrc.d ]
then
	# shellcheck disable=SC1090
	source "${HOME}"/rc.vonahsen/vonahsen.bashrc.d/*
fi
