#!/bin/zsh
##################
## set personal preferences
##################


##################
## mouse-y stuff
##################
# disable natural scroll
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false
# mouse right-click
defaults write com.apple.trackpad.enableSecondaryClick -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode TwoButton
# mouse gestures
#defaults write -g AppleEnableSwipeNavigateWithScrolls -bool true
defaults write -g AppleEnableMouseSwipeNavigateWithScrolls -bool true
# swipe full screen apps (desktop spaces)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseTwoFingerHorizSwipeGesture -int 2
# Allow tap to click for Apple trackpad devices
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true

##################
## terminal/paste/format stuff
##################
# disable terminal copy/paste format
defaults write com.apple.Terminal CopyAttributesProfile com.apple.Terminal.no-attributes
# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
# disable doublespace for period
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
# Use plain text for new documents in TextEdit.app
defaults write com.apple.TextEdit RichText -bool false
# set my own favorite text substitution
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array-add '{on=1;replace=ssshrug;with="\\U00af\\\\_(\\U30c4)_/\\U00af";}'

##################
## bottom-left hot corner for screensaver - don't need this now that there's a hotkey
##################
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

##################
## GUI
##################
# Use the Graphite theme, dark menu/dock
defaults write NSGlobalDomain AppleAquaColorVariant -int 6
defaults write NSGlobalDomain AppleInterfaceStyle Dark 
# 24h clock
defaults write com.apple.menuextra.clock Show24Hour -bool YES
# show bt icon in the top bar
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true
# disable click to reveal desktop
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false

##################
## dock
##################
# Position the dock in the left-center of the screen
defaults write com.apple.dock orientation -string "left"
defaults write com.apple.dock pinning -string "middle"
# smaller icons with zoomies
defaults write com.apple.dock magnification -int 1
defaults write com.apple.dock tilesize -int 33
defaults write com.apple.dock autohide -int 0
# don't show apps I've used recently
defaults write com.apple.dock show-recents -bool false
# do not rearrange desktops/spaces based on most recent use - a dock setting for some reason
defaults write com.apple.dock mru-spaces -bool false
killall Dock

##################
## finder stuff
##################
# Expand save panel by default.
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
# list view by default
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
killall Finder
echo "finder > settings > show computer, home, pictures"

##################
## change screenshots directory
##################
#TODO: check zsh compatibility :'(
if [ ! -d ${HOME}/screenshots ]
then
    mkdir -p ${HOME}/screenshots
fi
defaults write com.apple.screencapture location ${HOME}/screenshots
