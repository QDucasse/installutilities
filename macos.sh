#!/usr/bin/env bash

# Based on https://mths.be/macos

source ./utils.sh

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

e_arrow "Trackpad, accessories and inputs"

# Disable auto-correct
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false

# Disable keyboard layout change when fn is pressed
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Disable special character propositions when pressing a letter
defaults write -g ApplePressAndHoldEnabled -bool false

# Disable natural scrolling
defaults write -g com.apple.mouse.swipescrolldirection -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

e_arrow "Finder"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
# defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "lstv"

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Show the ~/Library folder
chflags nohidden ~/Library

# Show the /Volumes folder
sudo chflags nohidden /Volumes

###############################################################################
# Desktop                                                                     #
###############################################################################

# Set icon size on desktop to 36
defaults write com.apple.finder DesktopViewSettings -dict IconSize 24

# Stack by kind
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder _FXGroupBy -string "Kind"

# Sort items by name
defaults write com.apple.finder _FXSortColumn -string "Name"
defaults write com.apple.finder _FXSortOrder -int 0

###############################################################################
# Dock, Dashboard, and Menu bar                                               #
###############################################################################

e_arrow "Dock, Dashboard, and Menu bar"

# Enable spring loading for all Dock items
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true

# Enable hot corner Desktop top-left
defaults write com.apple.dock wvous-tl-corner -int 4



###############################################################################
# Mail                                                                        #
###############################################################################

e_arrow "Mail"

# Disable inline attachments (just show the icons)
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true

# Disable automatic spell checking
defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"

###############################################################################
# Terminal & iTerm 2                                                          #
###############################################################################

e_arrow "Terminal & iTerm 2"

# Only use UTF-8 in Terminal.app, "Pro" theme
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

# Don’t display the annoying prompt when quitting iTerm
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

###############################################################################
# Activity Monitor                                                            #
###############################################################################

e_arrow "Activity Monitor"

# Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Visualize CPU usage in the Activity Monitor Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Show all processes in Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" "cfprefsd" "Finder" "Mail" \
  "Dock" "SystemUIServer" "Terminal" "System Preferences"; do
    killall "${app}" &> /dev/null
done
echo "Done. Note that some of these changes require a logout/restart to take effect."
