#!/bin/zsh
#
DIVIDER="------------------------------------------------------------------------------"
REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
BACKUP_SUFFIX=".backup.$(date +%Y-%m-%d)"
ADDED_TEXT="[ADDED]"

echo ""
echo "Terminal Profile Installer"
echo "=========================="
echo ""
echo "This will set up your zsh profile with git integration,"
echo "aliases, and development tools."
echo ""
echo "Config files will be symlinked from this repo:"
echo "  $REPO_DIR"
echo ""

# Files to symlink to home directory
config_files=(
  ".zshrc"
  ".zsh-settings.sh"
  ".alias.sh"
  ".git-prompt.sh"
  ".git-config-setup.sh"
  ".node-settings.sh"
  ".dev-tools.sh"
  ".docker-aliases.sh"
  ".gitignore_global"
)

# Check for existing .zshrc that isn't already our symlink
if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
  echo "$DIVIDER"
  echo "WARNING: This will replace your existing ~/.zshrc file."
  echo "A backup will be saved to ~/.zshrc${BACKUP_SUFFIX}"
  echo "$DIVIDER"
  echo ""
  echo -n "Would you like to proceed? (y/n) "
  read shouldWeProceed
  if ! echo "$shouldWeProceed" | grep -q '^[Yy]$'; then
    echo "Installation cancelled."
    exit 1
  fi
  echo ""
fi

# Back up and symlink each config file
for file in "${config_files[@]}"; do
  target="$HOME/$file"
  source="$REPO_DIR/$file"

  if [ -f "$target" ] && [ ! -L "$target" ]; then
    cp "$target" "${target}${BACKUP_SUFFIX}"
    echo "[BACKUP] ~/$file -> ~/${file}${BACKUP_SUFFIX}"
  fi

  ln -sf "$source" "$target"
  echo "[LINKED] ~/$file"
done

echo ""

# Ensure .zprofile has Homebrew init (Apple Silicon macs)
if [ -f /opt/homebrew/bin/brew ]; then
  if ! grep -q 'brew shellenv' "$HOME/.zprofile" 2>/dev/null; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    echo "$ADDED_TEXT Homebrew initialization to .zprofile"
  fi
fi

# Install git hook templates
echo ""
echo -n "Install templates for git hooks? (y/n) "
read installHooks
echo ""
if [[ $installHooks =~ ^[Yy]$ ]]; then
  if [ ! -d "$HOME/.git-templates/hooks" ]; then
    mkdir -p "$HOME/.git-templates/hooks"
    echo "[CREATED] directory for storing git hooks"
  fi

  for hook in "$REPO_DIR"/git-templates/hooks/*; do
    hookname=$(basename "$hook")
    ln -sf "$hook" "$HOME/.git-templates/hooks/$hookname"
    chmod a+x "$HOME/.git-templates/hooks/$hookname"
    echo "[LINKED] git hook: $hookname"
  done

  echo ""
  echo "$DIVIDER"
  echo "NOTE: To use the installed git hooks on an existing local repo, run 'git init'"
  echo "New and cloned repos will automatically have these hooks"
  echo "$DIVIDER"
  echo ""
fi

# Run git config setup (interactive, one-time)
if [ -f "$REPO_DIR/.git-config-setup.sh" ]; then
  . "$REPO_DIR/.git-config-setup.sh"
fi

# Run git alias setup (one-time, not on every shell startup)
if [ -f "$REPO_DIR/.git-alias.sh" ]; then
  . "$REPO_DIR/.git-alias.sh"
  echo "$ADDED_TEXT git aliases to global config"
fi

# SSH key setup
echo ""
echo -n "Set up SSH key for GitHub? (y/n) "
read sshSetup
echo ""
if [[ $sshSetup =~ ^[Yy]$ ]]; then
  # Check for existing keys
  existing_keys=()
  for keyfile in "$HOME"/.ssh/*.pub; do
    [ -f "$keyfile" ] && existing_keys+=("$keyfile")
  done

  if [ ${#existing_keys[@]} -gt 0 ]; then
    echo "Existing SSH keys found:"
    for key in "${existing_keys[@]}"; do
      echo "  $key"
    done
    echo ""
    echo -n "Generate a new key anyway? (y/n) "
    read genNew
    echo ""
  else
    genNew="y"
  fi

  if [[ $genNew =~ ^[Yy]$ ]]; then
    echo -n "Email to associate with SSH key: "
    read sshEmail
    key_path="$HOME/.ssh/id_ed25519"
    if [ -f "$key_path" ]; then
      echo -n "~/.ssh/id_ed25519 exists. Choose a name for the new key: "
      read key_name
      key_path="$HOME/.ssh/$key_name"
    fi
    ssh-keygen -t ed25519 -C "$sshEmail" -f "$key_path"
    echo "$ADDED_TEXT SSH key generated at $key_path"
  else
    key_path="${existing_keys[1]%.*}"
  fi

  # Ensure ssh-agent config for macOS Keychain
  ssh_config="$HOME/.ssh/config"
  if ! grep -q 'AddKeysToAgent' "$ssh_config" 2>/dev/null; then
    mkdir -p "$HOME/.ssh"
    cat >> "$ssh_config" <<EOF

Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ${key_path}
EOF
    chmod 600 "$ssh_config"
    echo "$ADDED_TEXT SSH agent config to ~/.ssh/config"
  fi

  # Add key to agent and Keychain
  ssh-add --apple-use-keychain "${key_path}" 2>/dev/null || ssh-add "${key_path}"

  echo ""
  echo "$DIVIDER"
  echo "Copy the public key below and add it to GitHub:"
  echo "  https://github.com/settings/ssh -> New SSH key"
  echo "$DIVIDER"
  echo ""
  cat "${key_path}.pub"
  echo ""
fi

# Load the new profile into current terminal
echo ""
. "$HOME/.zshrc"

echo ""
echo "$ADDED_TEXT git-prompt.sh"
echo "$ADDED_TEXT aliases for terminal commands"
echo "$ADDED_TEXT git aliases (global config)"
echo "$ADDED_TEXT terminal prompt styles"
echo "$ADDED_TEXT Node.js/NVM settings with auto-switch"
echo "$ADDED_TEXT development tool aliases"
echo "$ADDED_TEXT docker aliases"
echo "$ADDED_TEXT global gitignore"
echo "[LOADED] zsh profile to current terminal"
echo ""
echo "Ready to use!"
echo ""
echo "Since files are symlinked, changes to this repo are"
echo "immediately active in new terminal windows."
echo "Run 'reload' to refresh the current terminal."
