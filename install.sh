#!/bin/bash
#
echo "Starting install of bash settings and git config"
echo
sleep 1
# Copy files
cp .alias.sh ~/
cp .bash-settings.sh ~/
cp .bash_profile ~/
cp .git-alias.sh ~/
cp .git-completion.bash ~/
cp .git-config-setup.sh ~/
cp .git-prompt.sh ~/
echo "[COPIED] settings files to root directory"

# Copy all hooks from repo to system template
echo -n "Install git hook templates? (y/n) "
read installHooks
echo
if [[ $installHooks =~ ^[Yy]$ ]]; then
  sleep 1
  # Create template hooks directory if missing
  if [ ! -d ~/.git-templates/hooks ]; then
    mkdir -p ~/.git-templates/hooks
    echo "[CREATED] directory for storing git hooks"
  fi

  cp ./git-templates/hooks/* ~/.git-templates/hooks

  # git hooks need to be executable
  chmod a+x ~/.git-templates/hooks/pre-commit
  chmod a+x ~/.git-templates/hooks/pre-push
  echo "[ADDED] git hook templates"
  echo
  # Final step is to run `git init` on any exisiting local repos
  echo "------------------------------------------------------------------------------"
  echo "NOTE: To use the installed git hooks on an existing local repo, run 'git init'"
  echo "New and cloned repos will automatically have these hooks"
  echo "------------------------------------------------------------------------------"
  echo
  # New repos and cloned repos will have these hooks automatically
  # after installation
  sleep 2
fi

# Change to root to load new bash_profile
cd ~

. ~/.bash_profile
