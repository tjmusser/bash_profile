# 
# Sourcing basic terminal tools for git and mac alises

ADDED_TEXT="[ADDED]"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

if [ -f ~/.alias.sh ]; then
  . ~/.alias.sh
fi

if [ -f ~/.git-alias.sh ]; then
  . ~/.git-alias.sh
fi

if [ -f ~/.bash-settings.sh ]; then
  . ~/.bash-settings.sh
fi
