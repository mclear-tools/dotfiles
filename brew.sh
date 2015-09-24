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

binaries=(
  ack
  hub
  cmus --with-ffmpeg
  cowsay
  elinks
  ffmpeg
  flac
  git
  gibo
  graphicsmagick
  lame
  latex2html
  lua
  luajit
  mackup
  pandoc
  pandoc-citeproc
  par
  pdf2htmlex
  python
  ranger
  reattach-to-user-namespace
  rename
  ruby
  the_silver_searcher
  task
  tree
  tmux
  trash
  wget
  wine
  xvid
  zsh 
  webkit2png
  )

echo "installing binaries..."
brew install ${binaries[@]}

# Install Brew Cask for Mac Apps

brew install caskroom/cask/brew-cask
brew tap caskroom/versions

# Apps
apps=(
  alfred
  arq
  bartender
  caffeine
  superduper
  cleanmymac
  devonthink-pro-office
  djview
  dropbox
  easyfind
  evernote
  fantastical
  firefox
  fluid
  google-chrome
  hazel
  iterm2
  mailmate
  marked
  meteorologist
  nvalt
  seil
  spectacle
  pdfsam-basic
  path-finder
  rdio
  skype
  skim
  soulver
  transmission
  textwrangler
  things
  vlc
  flux
  1password
  )

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Link alfred apps
brew cask alfred link

# install font set up
brew tap caskroom/fonts

# fonts
fonts=(
  font-inconsolata
  font-inconsolata-for-powerline
  font-inconsolata-dz-for-powerline
  font-inconsolata-lgc
  font-droid-sans-mono-for-powerline
  font-fira-mono-for-powerline
  font-meslo-lg-for-powerline
  font-sauce-code-powerline
  font-source-code-pro-for-powerline
  font-ubuntu-mono-powerline
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Install vim 
brew install macvim --with-lua --with-luajit --custom-icons --override-system-vim
 
# Install neovim
brew tap neovim/neovim
brew install --HEAD neovim

brew tap rogual/neovim-dot-app
brew install --HEAD neovim-dot-app



# Change path so Homebrew packages get priority

# $PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
