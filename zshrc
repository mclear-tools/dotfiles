# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# # Path to Beets
 export BEETSDIR=~/Dropbox/Apps/Beets/
# Terminal for 256 colors
export TERM=xterm-256color-italic
#export TERM=xterm-256color

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# Completion path
fpath=(~/.zsh/Completion $fpath)

# Enable autocompletion
autoload -U compinit
compinit
# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

    # plugins
    zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/brew-cask
    zgen oh-my-zsh plugins/marked2
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/tmux
    
    # Non-default bundles
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load srijanshetty/zsh-pandoc-completion
    zgen load peterhurford/git-aliases.zsh
    zgen load zsh-users/zsh-history-substring-search
    zgen load secrettriangle/smart-cd
    zgen load voronkovich/gitignore.plugin.zsh
    zgen load djui/alias-tips

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    zgen oh-my-zsh themes/ys

# OSX bundle if working on mac
 if [ "$OSTYPE"="darwin14.0.0" ]; then
   zgen oh-my-zsh plugins/osx
 fi


    # save all to init script
    zgen save
fi

# antigen source
# source $HOME/dotfiles/antigen/antigen.zsh

# Load the oh-my-zsh's library.
# antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
# antigen bundle git
# antigen bundle pip
# antigen bundle command-not-found
# antigen bundle brew
# antigen bundle brew-cask
# antigen bundle marked2
# antigen bundle tmux
# antigen bundle vi-mode

# OSX bundle if working on mac
# if [ "$OSTYPE"="darwin14.0.0" ]; then
#   antigen bundle osx
# fi


# Fish style syntax highlighting
# Load *before* history substring search
# antigen bundle zsh-users/zsh-syntax-highlighting

# Non-default bundles
# antigen bundle peterhurford/git-aliases.zsh
# antigen bundle zsh-users/zsh-history-substring-search
# antigen bundle srijanshetty/zsh-pandoc-completion
# antigen bundle secrettriangle/smart-cd
# antigen bundle voronkovich/gitignore.plugin.zsh
# antigen bundle unixorn/autoupdate-antigen.zshplugin
# antigen bundle djui/alias-tips

# Load the theme.
# antigen theme ys

# Tell antigen that you're done.
# antigen apply

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

### ALIASES

# source
  alias so='source'

# Vim
  alias v='vim --servername VIM'
  alias nv='nvim'
#  alias mvim='/usr/local/Cellar/macvim/HEAD/bin/mvim'
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
# source ~/.bashrc 

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

# set editor as homebrew's vim
export EDITOR=/usr/local/bin/vim

