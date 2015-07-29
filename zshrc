# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
#export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/Users/Roambot/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/opt/X11/bin:/Library/TeX/texbin:/Users/Roambot/.fzf/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# virtualenvwrapper config
export PROJECT_HOME=$HOME/bin
export WORKON_HOME=$HOME/bin/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# # Path to Beets
 export BEETSDIR=~/Dropbox/Apps/Beets/

# Terminal for 256 colors
export TERM=xterm-256color-italic

# Eval to reset LS_COLORS
eval "$(TERM=xterm-256color dircolors)"

#export to allow nvim to change cursor shape
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# load zgen
source "${HOME}/dotfiles/zgen/zgen.zsh"

# Completion path
# fpath=(~/.zsh/Completion $fpath)

# Enable autocompletion
autoload -U compinit
compinit
# check if there's no init script
if ! zgen saved; then
    echo "Creating a zgen save"

    zgen oh-my-zsh

   # plugins
   # zgen oh-my-zsh plugins/git
    zgen oh-my-zsh plugins/sudo
    zgen oh-my-zsh plugins/command-not-found
    zgen oh-my-zsh plugins/vi-mode
    zgen oh-my-zsh plugins/tmux
    zgen oh-my-zsh plugins/brew
    zgen oh-my-zsh plugins/brew-cask
    zgen oh-my-zsh plugins/marked2
    zgen oh-my-zsh plugins/tmux
    
    # Non-default bundles
    zgen load zsh-users/zsh-syntax-highlighting
    zgen load srijanshetty/zsh-pandoc-completion
    zgen load peterhurford/git-aliases.zsh
    # zgen load zsh-users/zsh-history-substring-search
    zgen load secrettriangle/smart-cd
    zgen load voronkovich/gitignore.plugin.zsh
    zgen load djui/alias-tips

    # completions
    zgen load zsh-users/zsh-completions src

    # theme
    # zgen oh-my-zsh themes/ys  # good standard theme
    # zgen oh-my-zsh themes/xiong-chiamiov-plus # Good two-line theme
    zgen load nojhan/liquidprompt  # Very extensible theme

# OSX bundle if working on mac
 if [ "$OSTYPE"="darwin14.0.0" ]; then
   zgen oh-my-zsh plugins/osx
 fi


    # save all to init script
    zgen save
fi

# Bindings for history substring search
# bind UP and DOWN arrow keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down
 
# bind P and N for EMACS mode
  # bindkey -M emacs '^P' history-substring-search-up
  # bindkey -M emacs '^N' history-substring-search-down
 
# bind k and j for VI mode
  # bindkey -M vicmd 'k' history-substring-search-up
  # bindkey -M vicmd 'j' history-substring-search-down

# Set vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

### ALIASES

# General bindings
alias zu='zgen selfupdate && zgen update'
alias bu='bubu && brew doctor'
alias bd='brew desc' 
alias bi='brew info'

# source
  alias so='source'

# Vim
  alias v='vim --servername VIM'
  alias nv='nvim'
  alias work='nvim -S ~/.nvim/session/Work'
  alias web='nvim -S ~/.nvim/session/Website'
#  alias mvim='/usr/local/Cellar/macvim/HEAD/bin/mvim'

# Alias open audio files with Vox in background
  alias p='open -g -a Vox'
# Alias open file with application
  alias o='open -a'

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

 alias man='vman'

# fuzzy completion in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# autojump
[[ -s $(brew --prefix)/etc/autojump.sh ]] && . $(brew --prefix)/etc/autojump.sh

# fix grep error
# alias grep="/usr/local/bin/grep $GREP_OPTIONS"
# unset GREP_OPTIONS

# set editor 
export EDITOR=/usr/local/bin/nvim


# shell script for colors in nvim using gruvbox

source "$HOME/.nvim/plugged/gruvbox/gruvbox_256palette_osx.sh"


source /Users/Roambot/.iterm2_shell_integration.zsh
