# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
#export PATH=/usr/local/bin:$PATH
#export PATH="$HOME/.cask/bin:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/opt/X11/bin:/Library/TeX/texbin:$HOME/.fzf/bin:$HOME/.cabal/bin:$HOME/.local/bin"
export PATH=/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:$HOME/bin:$HOME/.local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/opt/X11/bin:/Library/TeX/texbin:$HOME/.fzf/bin:$HOME/.cabal/bin:$HOME/.local/bin:$PATH
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

#set GOPATH
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/.go
export GOBIN=$HOME/bin
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:$GOBIN/bin

# set editor
# export EDITOR="/usr/local/bin/nvim"
export EDITOR="/usr/local/bin/emacsclient"
# export EDITOR="/usr/local/Cellar/emacs-mac/emacs-24.5-z-mac-5.15/bin/emacsclient -a -c"

# set shell
export SHELL=/usr/local/bin/zsh
# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# # Path to Beets
export BEETSDIR=~/Dropbox/Apps/Beets/

# virtualenvwrapper config
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=~/Dropbox/Work/projects
export WORKON_HOME=~/bin/virtualenvs

#export to allow nvim to change cursor shape
# export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# Terminal for 256 colors
# export TERM=xterm-256color

# Set vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

#### ZGEN PLUGINS #######

# load zgen
 source "${HOME}/.zgen/zgen.zsh"

# Completion path
# fpath=(~/.zsh/Completion $fpath)

# check if there's no init script
 if ! zgen saved; then
     echo "Creating a zgen save"

    # prezto and modules
    zgen prezto
    zgen prezto spectrum
    zgen prezto homebrew
    zgen prezto git
    zgen prezto command-not-found
    # zgen prezto syntax-highlighting
    zgen prezto utility
    zgen prezto directory


    # zgen load zsh-users/zsh-completions

    # This must go last
    zgen load zsh-users/zsh-syntax-highlighting
    zgen prezto prompt theme 'garrett'

 ### OLD CONFIG ###########

     # zgen oh-my-zsh

   # plugins

     # zgen oh-my-zsh plugins/git
     # zgen oh-my-zsh plugins/sudo
     # zgen oh-my-zsh plugins/command-not-found
     # zgen oh-my-zsh plugins/vi-mode
     # zgen oh-my-zsh plugins/tmux
     # zgen oh-my-zsh plugins/brew
     # zgen oh-my-zsh plugins/brew-cask
     # zgen oh-my-zsh plugins/marked2

   # Non-default bundles

     # zgen load zsh-users/zsh-syntax-highlighting
     # zgen load srijanshetty/zsh-pandoc-completion
     # zgen load peterhurford/git-aliases.zsh
     # zgen load zsh-users/zsh-history-substring-search
     # zgen load secrettriangle/smart-cd
     # zgen load voronkovich/gitignore.plugin.zsh
     # zgen load djui/alias-tips
     # zgen load supercrabtree/k

   # completions

     # zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/ys  # good standard theme
    # zgen oh-my-zsh themes/xiong-chiamiov-plus # Good two-line theme

 ## END OLD ZGEN ################################

# save all to init script
 zgen save
fi
 ## END ZGEN ################################

 # zsh prompt
 if [ -n "$INSIDE_EMACS" ]; then
     # LIQUID PROMPT
     # Only load Liquid Prompt in interactive shells, not from a script or from scp
     if [ -f /usr/local/share/liquidprompt ]; then
         . /usr/local/share/liquidprompt
     fi  
 else
     promptinit
     prompt garrett
fi


 ### ALIASES ################################

# General bindings
alias zu='zgen selfupdate && zgen update'
alias bu='brew update && brew outdated && brew upgrade && brew cleanup && brew doctor'
alias bd='brew desc' 
alias bi='brew info'
alias ex='exit'
alias tm='tmux'
alias ll='ls --color -lAFh -a'
alias ls='ls --color -a'
alias ld="ls -lht | grep '^d'"
alias nf='neofetch'
# List directory on cd
function chpwd() {
  ls
}

# source
alias so='source'

# Vim
alias v='/usr/local/bin/vim'
alias vim='emacs'
# alias v='nvim'
# alias nv='nvim'
# alias work='nvim -S ~/.nvim/session/Work'
# alias web='nvim -S ~/.nvim/session/Website'
# alias mvim='/usr/local/Cellar/macvim/HEAD/bin/mvim'

### EMACS #####
alias ec='/usr/local/bin/emacsclient'
alias ect='/usr/local/bin/emacsclient -nw'
# alias et='emacs -nw'
# alias ec='/usr/local/bin/emacsclient -nw'
alias et="/Applications/Emacs.app/Contents/MacOS/emacs -nw"


# Alias open audio files with Vox in background
# alias p='open -g -a Vox'
# Alias open file with application
alias o='open -a'

# Alias for Plex
alias pms="/Applications/Plex\ Media\ Server.app/Contents/MacOS/Plex\ Media\ Scanner"

# Weather
alias weather='ansiweather'
alias forecast='ansiweather -f 5'

# cd to the path of the front Finder window
cdf() {
target=`osascript -e 'tell application "Finder" to if (count of Finder windows) > 0 then get POSIX path of (target of front Finder window as text)'`
if [ "$target" != "" ]; then
cd "$target"; target=""; pwd
else
echo 'No Finder window found' >&2
fi
}

# does the reverse of above
alias f='open -a Finder ./'

# Dropbox uploader ("McDrop")
alias du='~/bin/Dropbox-Uploader/dropbox_uploader.sh'

# Read man pages in vim
# vman() {
# nvim -c "SuperMan $*"

# if [ "$?" != "0" ]; then
# echo "No manual entry for $*"
# fi
# }

# alias man='vman'

# fuzzy completion in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### OPTIONS ###

setopt nolistbeep
setopt histignoredups
setopt autolist
set -o promptsubst
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
 export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

 syspip () {
     PIP_REQUIRE_VIRTUALENV="" pip "$@"
 }

# for the fuck
 eval "$(thefuck --alias fuck)"

# shell script for colors in nvim using gruvbox
# source "$HOME/.nvim/plugged/gruvbox/gruvbox_256palette_osx.sh"

# Set homebrew cask destination (not necessary any more)
# export HOMEBREW_CASK_OPTS='--caskroom=/opt/homebrew-cask/Caskroom'

