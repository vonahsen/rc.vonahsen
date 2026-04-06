#!/bin/bash

set -ueo pipefail
set -x

gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false

# dark mode
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.gnome.desktop.interface accent-color 'slate'

# 24h time
gsettings set org.gnome.desktop.interface clock-format '24h'

# dash/dock
# check installed
dpkg -s gnome-shell-extension-dashtodock 2>&1 >/dev/null
if [ ! $? ]
then
	echo "must install gnome-shell-extension-dashtodock"
else
	gsettings set org.gnome.shell enabled-extensions "['dash-to-dock@micxgx.gmail.com']"
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
	gsettings set org.gnome.shell.extensions.dash-to-dock intellihide true

fi

