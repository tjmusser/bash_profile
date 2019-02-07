#!/bin/bash
#

# Sets up all the standard git config options. Run this file or the `reload_bash` command 
# to reset to these defaults

ADDED_TEXT="[ADDED]"

echo "Global git config settings"
echo "--------------------------"
echo -n "Set user.name and user.email for git config? (y/n) "
read userConfig
if [[ $userConfig =~ ^[Yy]$ ]]; then
  # Ask for and set git username
  read -p 'git username: ' gitUsername
  git config --global user.name "$gitUsername"

  # Ask for and set git user email
  read -p 'git email: ' gitEmail
  git config --global user.email "$gitEmail"
  echo "$ADDED_TEXT User info to git config"
  echo
fi

echo -n "Set global config settings for git? (y/n) "
read globalConfig
if [[ $globalConfig =~ ^[Yy]$ ]]; then
  # Allow all Git commands to use colored output, if possible
  git config --global --replace-all color.ui auto

  # Tell Git which whitespace problems it should recognize
  git config --global --replace-all core.whitespace trailing-space,space-before-tab

  # Tell git diff to use mnemonic prefixes (index, work tree, commit, object) instead of the standard a and b notation
  git config --global --replace-all diff.mnemonicprefix true

  # When branching off a remote branch, automatically let the local branch track the remote branch
  git config --global --replace-all branch.autosetupmerge true

  # When pushing without giving a refspec, push the current branch to its upstream branch. 
  # See the git config man page for more possible options.
  git config --global --replace-all push.default current

  # Enable the recording of resolved conflicts, so that identical hunks can be resolved automatically later on.
  git config --global --replace-all rerere.enabled true

  # Auto update/stage rerere on merge fixes (works on rebase too)
  git config --global --replace-all rerere.autoupdate true

  # Set git to globally use templates directory
  git config --global --replace-all init.templatedir '~/.git-templates'

  echo "$ADDED_TEXT git config global settings"
fi
