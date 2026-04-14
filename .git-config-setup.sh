#!/bin/zsh
#
# Sets up global git config options. Run during install or with `git_config` alias.

ADDED_TEXT="[ADDED]"

echo "Global git config settings"
echo "--------------------------"
echo -n "Set user.name and user.email for git config? (y/n) "
read userConfig
if [[ $userConfig =~ ^[Yy]$ ]]
then
  echo -n "git username: "
  read gitUsername
  git config --global user.name "$gitUsername"

  echo -n "git email: "
  read gitEmail
  git config --global user.email "$gitEmail"
  echo "$ADDED_TEXT User info to git config"
  echo ""
fi

echo -n "Set global config settings for git? (y/n) "
read globalConfig
if [[ $globalConfig =~ ^[Yy]$ ]]
then
  # Allow all Git commands to use colored output
  git config --global --replace-all color.ui auto

  # Whitespace problems git should recognize
  git config --global --replace-all core.whitespace trailing-space,space-before-tab

  # Use mnemonic prefixes (index, work tree, commit, object) instead of a/b
  git config --global --replace-all diff.mnemonicprefix true

  # Auto-track remote branches when branching off them
  git config --global --replace-all branch.autosetupmerge true

  # Push the current branch to its upstream branch
  git config --global --replace-all push.default current

  # Record resolved conflicts so identical hunks resolve automatically
  git config --global --replace-all rerere.enabled true

  # Auto-stage rerere resolutions on merge/rebase
  git config --global --replace-all rerere.autoupdate true

  # Use templates directory for git hooks
  git config --global --replace-all init.templatedir '~/.git-templates'

  # Default branch name for new repos
  git config --global --replace-all init.defaultBranch main

  # Rebase by default on pull (avoids merge commits)
  git config --global --replace-all pull.rebase true

  # Auto-prune dead remote branches on fetch
  git config --global --replace-all fetch.prune true

  # Better conflict markers showing base, ours, and theirs
  git config --global --replace-all merge.conflictstyle zdiff3

  echo "$ADDED_TEXT git config global settings"
fi
