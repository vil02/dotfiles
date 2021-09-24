# zsh being installed via homebrew leads to some directories used for autocomplete
# being considered insecure by zsh, this disables that check since we trust homebrew
export ZSH_DISABLE_COMPFIX=true
export EDITOR=vim

export VOLTA_HOME=$HOME/.volta
export PATH=$VOLTA_HOME/bin:$PATH

plugins=(git vi-mode fzf)

ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh

alias gdc="git diff --cached"
alias tma="tmux a"
alias dc="docker compose"
alias hmb="home-manager build"
alias hms="home-manager switch"
alias lg="lazygit"

function tm {
  rootdir=$(pwd)
  if [ ! -z "$1" ]; then
    rootdir=$1
  fi
  cd $rootdir
  tmux new-session -A -s "${rootdir##*/}"
}

function mdp() {
  # Requires Markdown Viewer extension
  # - https://chrome.google.com/webstore/detail/markdown-viewer/ckkdlimhmcjmikdlpkmbgfkaikojcbjk?hl=en
  open -a '/Applications/Google Chrome.app' $1
}