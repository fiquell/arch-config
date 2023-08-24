#!/usr/bin/env bash
#
# Fiquell's bash environment

# Environment variables
export EDITOR="nvim"
export HISTCONTROL="erasedups:ignorespace"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_OPTS="--reverse --margin 20% --info inline-right \
  --color 16,bg+:#1a1b26"

# Path
function set_path() {
  [[ $(id -u) -ge 1000 ]] || return

  for i in "$@"; do
    export PATH="$i:${PATH}"
  done
}

set_path scripts "$HOME"/bin "$HOME"/.local/bin "$HOME"/.cargo/bin

# Prompt
eval "$(starship init bash)"

# Aliases / Functions
alias :q="exit"
alias cat="bat -pp --theme ansi"
alias cs="xclip -selection clipboard"
alias grep="grep --color=always"
alias la="ls --almost-all"
alias ll="ls --almost-all --human-readable -l"
alias ls="ls -v --color=always --group-directories-first"
alias lt="tree -aCI '.git|node_modules' --dirsfirst"
alias vim="nvim"

# Git related commands
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gl="git lg"
alias gs="git st"
alias gpl="git pull"
alias gps="git push"
alias gco="git checkout"

# Change directory while displaying directory contents
function cd() {
  builtin cd "$@" && la
}

# Create a directory and move into it
function mc() {
  mkdir -p "$1"
  cd "$1" || return
}
