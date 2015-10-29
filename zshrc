# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# set editor 
export EDITOR=/usr/local/bin/vim

# set shell
export SHELL=/usr/local/bin/zsh

# Ensure user-installed binaries take precedence
#export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/Users/Roambot/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/opt/X11/bin:/Library/TeX/texbin:/Users/Roambot/.fzf/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Terminal for 256 colors
# export TERM=xterm-256color

#export to allow nvim to change cursor shape
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

# zsh prompt
# Only load Liquid Prompt in interactive shells, not from a script or from scp
if [ -f /usr/local/share/liquidprompt ]; then
  . /usr/local/share/liquidprompt
fi  
#[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
#PROMPT='[%n@%m:%/]%# '

# locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# # Path to Beets
export BEETSDIR=~/Dropbox/Apps/Beets/

# virtualenvwrapper config
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=~/bin
export WORKON_HOME=~/bin/virtualenvs

# Set vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey '^R' history-incremental-search-backward

### ALIASES

# General bindings
alias zu='zgen selfupdate && zgen update'
alias bu='brew update && brew outdated && brew upgrade && brew cleanup && brew doctor'
alias bd='brew desc' 
alias bi='brew info'
alias ex='exit'
alias tm='tmux'
alias ll='ls -lAFh --color -a'
alias ls='ls --color -a'

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

# ls with every cd
chpwd() ls

# Dropbox uploader ("McDrop")
alias du='~/bin/Dropbox-Uploader/dropbox_uploader.sh'

# Read man pages in vim
vman() {
nvim -c "SuperMan $*"

if [ "$?" != "0" ]; then
echo "No manual entry for $*"
fi
}

alias man='vman'

# fuzzy completion in zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### OPTIONS ###

setopt nolistbeep
setopt histignoredups
setopt autolist


