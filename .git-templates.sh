#!/bin/bash
#

# Set git to globally use templates directory
git config --global init.templatedir '~/.git-templates'

# Control will enter here if $DIRECTORY doesn't exist.
if [ ! -d ~/.git-templates/hooks ]; then
  mkdir -p ~/.git-templates/hooks
fi
