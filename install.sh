#!/bin/bash
#

# Copy files
cp .alias.sh ~/
cp .bash-settings.sh ~/
cp .bash_profile ~/
cp .git-alias.sh ~/
cp .git-completion.bash ~/
cp .git-config-setup.sh ~/
cp .git-prompt.sh ~/
cp .git-templates.sh ~/

# Create template hooks directory if missing
if [ ! -d ~/.git-templates/hooks ]; then
  mkdir -p ~/.git-templates/hooks
fi

# Copy all hooks from repo to system template
cp ./git-templates/hooks/* ~/.git-templates/hooks

# Make hooks executable
chmod a+x ~/.git-templates/hooks/pre-commit
chmod a+x ~/.git-templates/hooks/pre-push

# Final step is to run `git init` on any exisiting local repos
#
# New repos and cloned repos will have these hooks automatically
# after installation

# Change to root to load new bash_profile
cd ~

. ~/.bash_profile
