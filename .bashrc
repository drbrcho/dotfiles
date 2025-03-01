#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '
export BASH_SILENCE_DEPRECATION_WARNING=1

# Set to superior editing mode
set -o vi

### History ###

export HISTFILE=~/.histfile
export HISTSIZE=25000
export SAVEHIST=25000
export HISTCONTROL=ignorespace

### Aliases ###

# cd
alias ..='cd ..'

# clear
alias c='clear'

# ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -lathr'

# nvim
alias v='nvim'

# git
alias gp='git pull'
alias gs='git status'
alias gc='git clone'

# kubectl
alias kubectl="k"

# podman
alias podman="docker"