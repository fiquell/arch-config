#!/usr/bin/env bash
#
# Fiquell's Bash shell environment

# Prompt
eval "$(starship init bash)"

# Aliases
alias cs="xclip -selection clipboard"
alias rs="openssl rand -hex 32"
alias la="exa -a --group-directories-first"
alias ll="exa -l --group-directories-first"
alias ls="exa -al --group-directories-first"
alias lt="exa -aT --group-directories-first"

# Git aliases
alias ga="git add"
alias gb="git branch"
alias gc="git commit"
alias gd="git diff"
alias gl="git lg"
alias gs="git st"
alias gpl="git pull"
alias gps="git push"
alias gco="git checkout"
