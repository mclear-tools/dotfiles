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
