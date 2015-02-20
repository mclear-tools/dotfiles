# antigen source
source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle brew
antigen bundle brew-cask
antigen bundle marked2
antigen bundle tmux
antigen bundle vi-mode

# OSX bundle if working on mac
if [ "$OSTYPE"="darwin11.0" ]; then
  antigen bundle osx
fi


# Fish style syntax highlighting
# Load *before* history substring search
antigen bundle zsh-users/zsh-syntax-highlighting

# Non-default bundles
antigen bundle zsh-users/zsh-history-substring-search
#antigen bundle srijanshetty/pandoc-completion
antigen bundle secrettriangle/smart-cd
antigen bundle voronkovich/gitignore.plugin.zsh
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle djui/alias-tips

# Load the theme.
antigen theme ys

# Tell antigen that you're done.
antigen apply

# Bindings for history substring search
# bind UP and DOWN arrow keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
 
  # bind P and N for EMACS mode
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down
 
  # bind k and j for VI mode
  bindkey -M vicmd 'k' history-substring-search-up
  bindkey -M vicmd 'j' history-substring-search-down

# help info
#unalias run-help
#autoload run-help
#HELPDIR=/usr/local/share/zsh/help
# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# # Path to Beets
# export BEETSDIR=~/Dropbox/Apps/Beets/
# Path to your oh-my-zsh configuration.
#ZSH=$HOME/.oh-my-zsh
# Extra info at prompt
# PS1="%t %W %m %~ % : "
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="rkj-repos"
# ZSH_THEME="ys"
#ZSH_THEME="random"

# Terminal for 256 colors
export TERM=xterm-256color-italic
#export TERM=xterm-256color

 #Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git osx brew python tmux)

#source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# use vi keybindings
#  bindkey -v


# open vim with clientserver
  alias v='vim --servername VIM'
  alias mvim='/usr/local/Cellar/macvim/7.4-73_1/bin/mvim'
# Alias open audio files with Vox in background
  alias p='open -g -a Vox'
# Alias open file with application
  alias o='open -a'

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

# open file with sublime text 2 from terminal
  alias e='subl . &'
# lets bash scripts get run
source ~/.bashrc 

# list directory contents with every directory change
  # function chpwd() {
  #   emulate -L zsh
  #   ls -a
# }

# virtualenv should use Distribute instead of legacy setuptools
# export VIRTUALENV_DISTRIBUTE=true
# Centralized location for new virtual environments
# export PIP_VIRTUALENV_BASE=$HOME/Virtualenvs
# pip should only run if there is a virtualenv currently activated
# export PIP_REQUIRE_VIRTUALENV=true
# cache pip-installed packages to avoid re-downloading
# export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

#syspip(){
#   PIP_REQUIRE_VIRTUALENV="" pip "$@"
#}

# If in the future we want to upgrade our global packages, the above function enables us to do so via:
# syspip install --upgrade pip distribute virtualenv

#virtualenvwrapper
#export WORKON_HOME=$HOME/Virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

#pandoc zsh autocomplete

#autoload bashcompinit
#bashcompinit
#source "/Users/Roambot/dotfiles/pandoc-completion/pandoc-completion.bash"

#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

#source ~/perl5/perlbrew/etc/bashrc

# Read man pages in vim
 vman() {
   vim -c "SuperMan $*"

   if [ "$?" != "0" ]; then
     echo "No manual entry for $*"
   fi
 }

# fuzzy completion in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh


# fix grep error
alias grep="/usr/local/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS
