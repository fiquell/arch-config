#!/usr/bin/env bash
#
# Fiquell's bash environment

# Replaces current shell process with Fish shell
if command -v fish &>/dev/null; then
  SHELL=$(command -v fish)
  exec "$SHELL"
fi

# Aliases
alias cat="bat --theme base16 --style changes,numbers"
alias cs="xclip -selection clipboard"
alias grep="grep --color=always"

# Changed "ls" to "exa"
alias ls="exa --all --long --color=always --group-directories-first"
alias la="exa --all --color=always --group-directories-first"
alias lt="exa --all --tree --color=always --group-directories-first"

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
