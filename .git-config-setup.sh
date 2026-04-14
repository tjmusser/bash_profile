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

  # Global gitignore file
  git config --global --replace-all core.excludesfile '~/.gitignore_global'

  echo "$ADDED_TEXT git config global settings"
fi

echo ""
echo -n "Enable SSH commit signing? (y/n) "
read signingConfig
if [[ $signingConfig =~ ^[Yy]$ ]]
then
  # Look for existing SSH public keys
  ssh_keys=()
  for keyfile in "$HOME"/.ssh/*.pub; do
    [ -f "$keyfile" ] && ssh_keys+=("$keyfile")
  done

  if [ ${#ssh_keys[@]} -eq 0 ]; then
    echo "No SSH public keys found in ~/.ssh/"
    echo "Run the SSH key setup step in install.sh first, or generate one with:"
    echo "  ssh-keygen -t ed25519"
  else
    echo ""
    echo "Available SSH public keys:"
    i=1
    for key in "${ssh_keys[@]}"; do
      echo "  $i) $key"
      i=$((i + 1))
    done
    echo ""
    echo -n "Select key number to use for signing (1-${#ssh_keys[@]}): "
    read keyChoice

    if [[ "$keyChoice" =~ ^[0-9]+$ ]] && [ "$keyChoice" -ge 1 ] && [ "$keyChoice" -le "${#ssh_keys[@]}" ]; then
      selected_key="${ssh_keys[$keyChoice]}"

      git config --global --replace-all gpg.format ssh
      git config --global --replace-all user.signingkey "$selected_key"
      git config --global --replace-all commit.gpgsign true
      git config --global --replace-all tag.gpgsign true

      echo "$ADDED_TEXT SSH commit signing with $selected_key"
      echo ""
      echo "Add your public key to GitHub at:"
      echo "  https://github.com/settings/ssh"
      echo "  -> New SSH key -> Key type: Signing Key"
      echo ""
      cat "$selected_key"
    else
      echo "Invalid selection. Skipping SSH signing setup."
    fi
  fi
fi
