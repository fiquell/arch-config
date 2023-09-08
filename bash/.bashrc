#!/usr/bin/env bash
#
# Fiquell's Bash shell environment

# Set global environment variables
export EDITOR="nvim"
export MANPAGER="nvim +Man!"
export FZF_DEFAULT_OPTS="--margin 20% --info inline-right --color 16,bg+:#1a1b26"

# Add custom paths to the PATH variable
export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/bin:$PATH"

# Aliases
alias cat="bat --theme base16 --style changes,numbers"
alias cs="xclip -selection clipboard"
alias grep="grep --color=always"

# Use "exa" instead of "ls" with custom options
alias ls="exa --all --long --color=always --group-directories-first"
alias la="exa --all --color=always --group-directories-first"
alias lt="exa --all --tree --color=always --group-directories-first"

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
