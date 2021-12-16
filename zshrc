# zsh being installed via homebrew leads to some directories used for autocomplete
# being considered insecure by zsh, this disables that check since we trust homebrew
export ZSH_DISABLE_COMPFIX=true
export EDITOR=vim
export BAT_THEME="Solarized (light)"

plugins=(git vi-mode fzf direnv)
ZSH_THEME="robbyrussell"
source $HOME/.oh-my-zsh/oh-my-zsh.sh

eval "$(rbenv init - zsh)"

alias tma="tmux a"
alias dc="docker compose"
alias tf="terraform"
alias gdc="git diff --cached"
alias ytop="ytop -c 'default-dark'"
alias lg="lazygit"
alias ld="lazydocker"

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

function gbrowse() {
  branch=$(git branch --show-current)
  if [ -z "$branch" ]; then
    branch=$(git rev-parse HEAD)
  fi
  gh browse --branch="$branch" $1
}

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export RUST_BIN="$HOME/.cargo/bin"
export PATH="$RUST_BIN:$PATH"