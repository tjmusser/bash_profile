# 
# Sourcing basic terminal tools for git and mac alises

ADDED_TEXT="[ADDED]"

if [ -f ~/.git-config-setup.sh ]; then
  . ~/.git-config-setup.sh
fi

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
  echo "$ADDED_TEXT git-completion.bash"
fi

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
  echo "$ADDED_TEXT git-prompt.sh"
fi

if [ -f ~/.alias.sh ]; then
  . ~/.alias.sh
  echo "$ADDED_TEXT aliases for terminal commands"
fi

if [ -f ~/.git-alias.sh ]; then
  sh ~/.git-alias.sh
  echo "$ADDED_TEXT git aliases"
fi

if [ -f ~/.bash-settings.sh ]; then
  . ~/.bash-settings.sh
  echo "$ADDED_TEXT Terminal window styles"
fi

echo "Done!"
