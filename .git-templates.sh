#!/bin/bash
#

# Set git to globally use templates directory
git config --global init.templatedir '~/.git-templates'

# Create template hooks directory if missing
if [ ! -d ~/.git-templates/hooks ]; then
  mkdir -p ~/.git-templates/hooks
fi

# Copy all hooks from repo to system template
./git-templates/hooks/* ~/.git-templates/hooks

# Make hooks executable
chmod a+x ~/.git-templates/hooks/pre-commit
chmod a+x ~/.git-templates/hooks/pre-push

# Final step is to run `git init` on any exisiting local repos
#
# New repos and cloned repos will have these hooks automatically
# after installation
