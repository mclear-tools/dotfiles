# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Ensure user-installed binaries take precedence
#export PATH=/usr/local/bin:$PATH
export PATH="/usr/local/opt/coreutils/libexec/gnubin:/usr/local/bin:/Users/Roambot/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/sbin:/bin:/opt/X11/bin:/Library/TeX/texbin:/Users/Roambot/.fzf/bin"
export MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# TERM
COLORTERM=yes

# zsh prompt
# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt
#PROMPT='[%n@%m:%/]%# '

# locale
export LANG=en_US.UTF-8

# # Path to Beets
export BEETSDIR=~/Dropbox/Apps/Beets/

# virtualenvwrapper config
source /usr/local/bin/virtualenvwrapper.sh
export PROJECT_HOME=~/bin
export WORKON_HOME=~/bin/virtualenvs

# Terminal for 256 colors
export TERM=xterm-256color

# Bindings for history substring search
# bind UP and DOWN arrow keys
  zmodload zsh/terminfo
  bindkey "$terminfo[kcuu1]" history-substring-search-up
  bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
  bindkey -M emacs '^P' history-substring-search-up
  bindkey -M emacs '^N' history-substring-search-down

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

# open file with sublime text 2 from terminal
  alias e='subl . &'
# lets bash scripts get run
# source ~/.bashrc 

# Dropbox uploader ("McDrop")
alias du='~/bin/Dropbox-Uploader/dropbox_uploader.sh'

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

# set editor 
export EDITOR=/usr/local/bin/vim

