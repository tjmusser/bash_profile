#!/bin/bash
#
LINES="------------------------------------------------------------------------------"

# Begin install
echo "Starting install of global bash settings and global git config"
echo ""

if test -f ~/.bash_profile; then
  echo $LINES
  echo "WARNING: This will overwrite the exisiting bash_profile file you might have created."
  echo $LINES
  echo ""
  read -p "Would you like to proceed? (y/n)" shouldWeProceed
  echo $shouldWeProceed | grep ^[Yy]$
  if [ $? -eq 0 ]
  then
    exit 0; #THE USER WANTS TO CONTINUE
  else
    exit 1; # THE USER DONT WANT TO CONTINUE SO ROLLBACK
  fi
fi

sleep 1
# Copy files
cp .alias.sh ~/
cp .bash-settings.sh ~/
cp .bash_profile ~/
cp .git-alias.sh ~/
cp .git-completion.bash ~/
cp .git-config-setup.sh ~/
cp .git-prompt.sh ~/
echo "[COPIED] git settings and bash files to user directory"

# Copy all hooks from repo to system template
echo -n "Install templates for git hooks? (y/n) "
read installHooks
echo ""
if [[ $installHooks =~ ^[Yy]$ ]]
then
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
  echo ""
  # Final step is to run `git init` on any exisiting local repos
  echo $LINES
  echo "NOTE: To use the installed git hooks on an existing local repo, run 'git init'"
  echo "New and cloned repos will automatically have these hooks"
  echo $LINES
  echo ""
  # New repos and cloned repos will have these hooks automatically
  # after installation
  sleep 2
fi

if test -f ~/.git-config-setup.sh; then
  . ~/.git-config-setup.sh
fi

# Change to root to load new bash_profile
. ~/.bash_profile

echo "$ADDED_TEXT git-completion.bash"
echo "$ADDED_TEXT git-prompt.sh"
echo "$ADDED_TEXT aliases for terminal commands"
echo "$ADDED_TEXT git aliases"
echo "$ADDED_TEXT Terminal window styles"
echo "[LOADED] bash file to current terminal."
echo "Ready to use!"
