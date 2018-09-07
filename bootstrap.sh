# [[file:~/dotfiles/dotfiles.org::*Header][Header:1]]
#!/usr/bin/env bash
# Header:1 ends here

# [[file:~/dotfiles/dotfiles.org::*Download][Download:1]]
# curl -O https://raw.githubusercontent.com/mclear-tools/dotfiles/master/bootstrap.sh && source bootstrap.sh
# Download:1 ends here

# [[file:~/dotfiles/dotfiles.org::*Brewfile][Brewfile:1]]
# Ask for the administrator password upfront.
sudo -v


# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Install xcode command line tools
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated)
brew install coreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install findutils

# Install current bash
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

binaries=(
  ansiweather
  ack
  cmus --with-ffmpeg
  cowsay
  elinks
  ffmpeg
  flac
  git
  graphicsmagick
  latex2html
  liquidprompt
  pandoc
  pandoc-citeproc
  par
  pdf2htmlex
  python
  ranger
  reattach-to-user-namespace
  rename
  ruby
  shpotify
  the_silver_searcher
  tree
  tmux
  trash
  wget
  xvid
  zsh
  phantomjs
  webkit2png
  mas
  rg
  )

echo "installing binaries..."
brew install ${binaries[@]}

# Install Brew Cask for Mac Apps

brew tap caskroom/cask
brew tap caskroom/versions

# Apps
apps=(
  alfred
  arq
  bartender
  caffeine
  cloudytabs
  superduper
  cleanmymac
  devonthink-pro-office
  djview
  dropbox
  fantastical
  firefox
  fluid
  hazel
  iterm2
  mailmate
  marked
  pdfexpert
  spectacle
  spotify
  pdfsam-basic
  skype
  soulver
  vlc
  flux
  1password
  xquartz
  )

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
# brew cask install --appdir="/Applications" ${apps[@]}
brew cask install ${apps[@]}

# Link alfred apps
# brew cask alfred link

# install font set up
brew tap caskroom/fonts

# fonts
fonts=(
  font-inconsolata
  font-inconsolata-for-powerline
  font-inconsolata-lgc
  font-fira-mono-for-powerline
  font-meslo-lg-for-powerline
  font-ubuntu-mono-powerline
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Install emacs
  brew tap railwaycat/emacsmacport
  brew install emacs-mac --with-glib --with-gnutls --with-imagemagick --with-xml2
# brew install emacs --HEAD --with-cocoa --with-gnutls --with-librsvg --with-imagemagick

# Install wine
  brew install wine

# Change path so Homebrew packages get priority
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
# Brewfile:1 ends here

# [[file:~/dotfiles/dotfiles.org::*MacOS%20Config][MacOS Config:1]]
# OSX for Hackers (Mavericks/Yosemite)
#
# Source: https://gist.github.com/brandonb927/3195465

#!/bin/sh

# Some things taken from here
# https://github.com/mathiasbynens/dotfiles/blob/master/.osx

# Ask for the administrator password upfront
sudo -v

echo "This script will make your Mac awesome"

###############################################################################
# General UI/UX
###############################################################################

# echo ""
# echo "Hide the Time Machine, Volume, User, and Bluetooth icons"
# for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.*; do
#   defaults write "${domain}" dontAutoLoad -array \
#     "/System/Library/CoreServices/Menu Extras/TimeMachine.menu" \
#     "/System/Library/CoreServices/Menu Extras/Volume.menu" \
#     "/System/Library/CoreServices/Menu Extras/User.menu"
# done
# defaults write com.apple.systemuiserver menuExtras -array \
#   "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
#   "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
#   "/System/Library/CoreServices/Menu Extras/Battery.menu" \
#   "/System/Library/CoreServices/Menu Extras/Clock.menu"

# sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search

echo ""
echo "Disabling OS X Gate Keeper"
echo "(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

echo ""
echo "Increasing the window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

echo ""
echo "Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Try e.g. `cd /tmp; unidecode "\x{0000}" > cc.txt; open -e cc.txt`
echo ""
echo "Displaying ASCII control characters using caret notation in standard text views"
defaults write NSGlobalDomain NSTextShowsControlCharacters -bool true

echo ""
echo "Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

echo ""
echo "Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

echo ""
echo "Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

echo ""
echo "Reveal IP address, hostname, OS version, etc. when clicking the clock in the login window"
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo HostName

# echo ""
# echo "Never go into computer sleep mode"
# systemsetup -setcomputersleep Off > /dev/null

echo ""
echo "Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo ""
echo "Disable smart quotes and smart dashes as theyÃ¢â‚¬â„¢re annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input
###############################################################################

echo ""
echo "Increasing sound quality for Bluetooth headphones/headsets"
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

echo ""
echo "Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# echo ""
# echo "Disabling press-and-hold for keys in favor of a key repeat"
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# echo ""
# echo "Setting a blazingly fast keyboard repeat rate (ain't nobody got time fo special chars while coding!)"
# defaults write NSGlobalDomain KeyRepeat -int 0

# echo ""
# echo "Disabling auto-correct"
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

echo ""
echo "Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

echo ""
echo "Turn off keyboard illumination when computer is not used for 5 minutes"
defaults write com.apple.BezelServices kDimTime -int 300

###############################################################################
# Screen
###############################################################################

# echo ""
# echo "Requiring password immediately after sleep or screen saver begins"
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 0

echo ""
echo "Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo ""
echo "Enable HiDPI display modes (requires restart)"
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

###############################################################################
# Finder
###############################################################################

echo ""
echo "Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

echo ""
echo "Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo ""
echo "Showing status bar in Finder by default"
defaults write com.apple.finder ShowStatusBar -bool true

echo ""
echo "Allowing text selection in Quick Look/Preview in Finder by default"
defaults write com.apple.finder QLEnableTextSelection -bool true

echo ""
echo "Displaying full POSIX path as Finder window title"
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

echo ""
echo "Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

echo ""
echo "Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo ""
echo "Disabling disk image verification"
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

echo ""
echo "Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist


###############################################################################
# Dock & Mission Control
###############################################################################

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you donÃ¢â‚¬â„¢t use
# the Dock to launch apps.
#defaults write com.apple.dock persistent-apps -array

echo ""
echo "Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

echo ""
echo "Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

echo ""
echo "Setting Dock to auto-hide and removing the auto-hiding delay"
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0


###############################################################################
# Safari & WebKit
###############################################################################

echo ""
echo "Hiding SafariÃ¢â‚¬â„¢s bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

echo ""
echo "Hiding SafariÃ¢â‚¬â„¢s sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

echo ""
echo "Disabling SafariÃ¢â‚¬â„¢s thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

echo ""
echo "Enabling SafariÃ¢â‚¬â„¢s debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

echo ""
echo "Making SafariÃ¢â‚¬â„¢s search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

echo ""
echo "Removing useless icons from SafariÃ¢â‚¬â„¢s bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

echo ""
echo "Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

echo ""
echo "Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

echo ""
echo "Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true


###############################################################################
# Mail
###############################################################################

echo ""
echo "Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false


###############################################################################
# Terminal
###############################################################################

echo ""
echo "Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"


###############################################################################
# Time Machine
###############################################################################

echo ""
echo "Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo ""
echo "Disabling local Time Machine backups"
hash tmutil &> /dev/null && sudo tmutil disablelocal


###############################################################################
# Messages                                                                    #
###############################################################################

echo ""
echo "Disable automatic emoji substitution (i.e. use plain text smileys)"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

echo ""
echo "Disable smart quotes as itÃ¢â‚¬â„¢s annoying for messages that contain code"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "automaticQuoteSubstitutionEnabled" -bool false

echo ""
echo "Disable continuous spell checking"
defaults write com.apple.messageshelper.MessageController SOInputLineSettings -dict-add "continuousSpellCheckingEnabled" -bool false

###############################################################################
# Personal Additions
###############################################################################

# echo ""
# echo "Disable hibernation (speeds up entering sleep mode)"
# sudo pmset -a hibernatemode 0

# echo ""
# echo "Remove the sleep image file to save disk space"
# sudo rm /Private/var/vm/sleepimage
# echo "Creating a zero-byte file insteadÃ¢â‚¬Â¦"
# sudo touch /Private/var/vm/sleepimage
# echo "Ã¢â‚¬Â¦and make sure it canÃ¢â‚¬â„¢t be rewritten"
# sudo chflags uchg /Private/var/vm/sleepimage

echo ""
echo "Disable the sudden motion sensor as itÃ¢â‚¬â„¢s not useful for SSDs"
sudo pmset -a sms 0

echo ""
echo "Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

echo ""
echo "Disable computer sleep and stop the display from shutting off"
sudo pmset -a sleep 0
sudo pmset -a displaysleep 0

echo ""
echo "Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

echo ""
echo "Always boot in verbose mode"
sudo nvram boot-args="-v"

###############################################################################
# Kill affected applications
###############################################################################

echo "Done!"
# MacOS Config:1 ends here
