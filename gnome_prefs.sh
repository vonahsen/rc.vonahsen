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
dpkg -s gnome-shell-extension-dashtodock >/dev/null 2>&1
if [ ! $? ]
then
	echo "must install gnome-shell-extension-dashtodock"
else
	gnome-extensions enable dash-to-dock@micxgx.gmail.com
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'LEFT'
	gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
	gsettings set org.gnome.shell.extensions.dash-to-dock autohide true
	# disable "dodge windows" - true = only hide if interfering with an app window
	gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false

fi

# show desktop icons
dpkg -s gnome-shell-extension-desktop-icons-ng >/dev/null 2>&1
if [ ! $? ]
then
	echo "must install gnome-shell-extension-desktop-icons-ng"
else
	gnome-extensions enable ding@rastersoft.com
fi

# show logout icon in power/shutdown menu
gsettings set org.gnome.shell always-show-log-out true
