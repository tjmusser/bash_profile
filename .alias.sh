#!bin/bash
#
# Useful common git and system aliases

## Common git task
alias gs='git st'
alias ga='git add'
alias gb='git br'
alias gc='git ci'
alias gd='git diff'
alias go='git co'
alias gri='git rebase -i'
alias gcleanbr='git br --merged | egrep -v "(\*|master|develop)" | xargs -n 1 git br -d'

## Git misspellings
alias got='git'
alias get='git'
alias gti='git'

## Git push to master
alias gpm='git push origin master'

## Git fetch, prune, and update
alias gf='git fetch -p origin'
alias gpr='git pull --rebase'
alias gffm='git merge --ff-only'
alias syncmaster='git co master && gf && gffm origin/master'
alias syncdev='git co develop && gf && gffm origin/develop'
alias syncall='syncmaster && syncdev'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

## Recursively destroys all .DS_Store files in the folder I am currently in
alias killDS='find . -name *.DS_Store -type f -delete'

## Reload profile
alias reload_bash='. ~/.bash_profile'

## List everything
alias ll='ls -al'
