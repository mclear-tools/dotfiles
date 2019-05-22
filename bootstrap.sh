# [[file:~/dotfiles/dotfiles.org::*Brewfile][Brewfile:1]]
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

# Install current bash
brew install bash

binaries=(
  ansiweather
  ack
  aspell
  cmus --with-ffmpeg
  cmatrix
  cowsay
  dark-mode
  elinks
  ffmpeg
  flac
  fzf
  git
  graphicsmagick
  latex2html
  liquidprompt
  neofetch
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
  thefuck
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
  zplug
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
  deluge
  devonthink-pro-office
  dictcc-en-de-dictionary-plugin
  djview
  dropbox
  fantastical
  firefox
  forklift
  fluid
  google-chrome
  hammerspoon
  handbrake
  hazel
  istat-menus
  iterm2
  karabiner-elements
  lingon-x
  mactex
  mailmate
  marked
  pdf-expert
  spotify
  pdfsam-basic
  plex-media-player
  qlcolorcode
  qlstephen
  qlmarkdown
  quicklook-json
  qlimagesize
  quicklookase
  qlvideo
  rocket
  skim
  skype
  soulver
  suspicious-package
  vlc
  webpquicklook
  1password
  xquartz
  zotero
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
  font-hasklig
)

# install fonts
echo "installing fonts..."
brew cask install ${fonts[@]}

# Install emacs
brew tap d12frosted/emacs-plus
brew install emacs-plus --without-spacemacs-icon

# Install wine
brew install wine

# Change path so Homebrew packages get priority
$PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH

# Change shell to zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh
# Brewfile:1 ends here
