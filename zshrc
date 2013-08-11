# Set architecture flags
 export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
 export PATH=/usr/local/bin:/usr/bin:/usr/texbin:$PATH
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
# Extra info at prompt
PS1="%t %W %m %~ % : "
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="rkj-repos"

# Set to this to use case-sensitive completion
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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
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

# lets bash scripts get run
  source ~/dotfiles/bashrc

# list directory contents with every directory change

  function chpwd() {
    emulate -L zsh
    ls -a
}

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
export WORKON_HOME=$HOME/Virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
