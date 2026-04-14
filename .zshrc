#
# Main zsh configuration
# Sources modular config files for git, aliases, prompt, and dev tools

# Enable zsh completion system (replaces vendored git-completion.bash)
autoload -Uz compinit && compinit

if [ -f ~/.git-prompt.sh ]; then
  . ~/.git-prompt.sh
fi

if [ -f ~/.alias.sh ]; then
  . ~/.alias.sh
fi

if [ -f ~/.zsh-settings.sh ]; then
  . ~/.zsh-settings.sh
fi

if [ -f ~/.node-settings.sh ]; then
  . ~/.node-settings.sh
fi

if [ -f ~/.dev-tools.sh ]; then
  . ~/.dev-tools.sh
fi

if [ -f ~/.docker-aliases.sh ]; then
  . ~/.docker-aliases.sh
fi
