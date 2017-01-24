# 
# Sourcing basic terminal tools for git and mac alises

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
  sh ~/.git-alias.sh
fi

if [ -f ~/.bash-settings.sh ]; then
  . ~/.bash-settings.sh
fi

if [ -f ~/.git-templates.sh ]; then
  sh ~/.git-templates.sh
fi
