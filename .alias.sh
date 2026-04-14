#!/bin/zsh
#
# Useful common git and system aliases

## Common git tasks
alias gs='git st'
alias ga='git add'
alias gb='git br'
alias gc='git ci'
alias gd='git diff'
alias go='git co'
alias gri='git rebase -i'
alias gcleanbr='git br --merged | egrep -v "(\*|main|develop)" | xargs -n 1 git br -d'

## Git misspellings
alias got='git'
alias get='git'
alias gti='git'

## Git push to main
alias gpmain='git push origin main'

## Git fetch, prune, and update
alias gf='git fetch -p origin'
alias gpr='git pull --rebase'
alias gffm='git merge --ff-only'
alias syncmain='git co main && gf && gffm origin/main'
alias syncdev='git co develop && gf && gffm origin/develop'
alias syncall='syncmain && syncdev'

## get rid of command not found
alias cd..='cd ..'

## Quick way to get out of current directory
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

## Recursively destroy all .DS_Store files in the current directory
alias killDS='find . -name "*.DS_Store" -type f -delete'

## Reload profile
alias reload='. ~/.zshrc'
alias git_config='. ~/.git-config-setup.sh'

## List everything
alias ll='ls -al'
