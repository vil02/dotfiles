# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="seth"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(vi-mode)

export TERM='xterm-256color'
export EDITOR=vim

if [ -e /usr/bin/vimx ]; then alias vim='vimx'; fi
alias tmux='TERMINFO=/usr/share/terminfo/x/xterm-16color TERM=xterm-16color tmux -2'
alias mux='tmuxinator'
alias gitlog='git log --oneline'
alias se-dev='ssh seth@se-dev'

source $ZSH/oh-my-zsh.sh

export LOCALE_ARCHIVE="$HOME/.nix-profile/lib/locale/locale-archive"

export GOPATH=$HOME/go
export COMPOSER_PATH=$HOME/.composer/vendor/bin
export ARCANIST_PATH=$HOME/.arcanist/arcanist/bin
export HEROKU_PATH=/usr/local/heroku/bin
export LOCAL_BIN=$HOME/.local/bin
export STACK_BIN=$HOME/.stack/snapshots/x86_64-linux/lts-7.9/8.0.1/bin:$HOME/.stack/programs/x86_64-linux/ghc-8.0.1/bin

export PATH=$PATH:$STACK_BIN
export PATH=$PATH:$LOCAL_BIN
export PATH=$PATH:$GOPATH
export PATH=$PATH:$COMPOSER_PATH
export PATH=$PATH:$HEROKU_PATH
export PATH=$PATH:$ARCANIST_PATH
#export PATH=$PATH:$RVM_PATH

# copy last commit sha
alias last-commit="git log --oneline -n 1 | cut -c 1-7"
alias copy-last-commit="git log --oneline -n 1 | cut -c 1-7 | pbcopy"
alias json-fmt="node -e \"console.log(JSON.stringify(JSON.parse(require('fs').readFileSync(process.argv[1]).toString('utf8')), null, 4));\""
#alias json-fmt="node -e \"console.log(JSON.stringify(JSON.parse(process.argv[1]), null, 4));\""
alias o="xdg-open"
alias notes="cd ~/notes && vim ."
alias doing="vim ~/notes/DOING.md"
alias scratch="vim ~/notes/SCRATCH.md"
alias journal="note journal journal"

# git aliases
alias gpull="git pull"
alias gpush="git push"
alias gs="git status"
alias gswatch="watch -n1 -c git -c color.ui=always status"
alias gc="git commit"
alias gd="git diff"
alias gco="git checkout"
alias gb="git branch"
alias gl="git log"
alias glo="git log --oneline"

function note() {
  if [ ! -z $2 ]; then
    mkdir -p ~/notes/$2
    vim ~/notes/$2/$(date +%y%m%d)-$1.md
  else
    vim ~/notes/$(date +%y%m%d)-$1.md
  fi
}

[ -f /Users/sethetter/.travis/travis.sh ] && source /Users/sethetter/.travis/travis.sh # added by travis gem

eval `dircolors ~/.dircolors`
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
if [ -e /home/sethetter/.nix-profile/etc/profile.d/nix.sh ]; then . /home/sethetter/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
