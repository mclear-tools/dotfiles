#!/usr/bin/env bash


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

# Install Bash 4
brew install bash

# Install more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep

# Install vim 
brew install vim --override-system-vi --with-client-server --with-lua --with-luajit
 
# Install neovim
brew tap neovim/neovim
brew install --HEAD neovim

brew tap rogual/neovim-dot-app
brew install --HEAD neovim-dot-app


binaries=(
  cmus
  cowsay
  elinks
  ffmpeg
  flac
  gibo
  graphicsmagick
  lame
  latex2html
  lua
  luajit
  pandoc
  pandoc-citeproc
  ranger
  reattach-to-user-namespace
  the_silver_searcher
  task
  tmux
  wget
  xvid
  zsh 
  webkit2png
  rename
  zopfli
  ffmpeg
  python
  sshfs
  trash
  node
  tree
  ack
  hub
  git
)

echo "installing binaries..."
brew install ${binaries[@]}

# Install Brew Cask for Mac Apps

brew install caskroom/cask/brew-cask


# Apps
apps=(
  alfred
  arq
  bartender
  caffeine
  cleanmymac
  carbon-copy-cloner
  devonthink-pro-office
  djview
  dropbox
  evernote
  fantastical
  firefox
  fluid
  google-chrome
  hazel
  iterm2
  mailmate
  marked
  nvalt
  seil
  pdfsam-basic
  path-finder
  rdio
  skype
  soulver
  transmission
  textexpander
  textwrangler
  things
  vagrant
  vlc
  virtualbox
  flux
  1password
  qlstephen
  qlcolorcode
  qlmarkdown
  qlprettypatch
  quicklook-json
  )

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Link alfred apps
brew cask alfred link


# fonts
fonts=(
  font-m-plus
  font-clear-sans
  font-roboto
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Change path so Homebrew packages get priority

# $PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
