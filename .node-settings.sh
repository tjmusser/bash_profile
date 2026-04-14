# Node.js environment settings
# NVM initialization and auto-switching for projects with .nvmrc or .node-version

export NVM_DIR="$HOME/.nvm"

# Load NVM (supports both Homebrew and manual installations)
if [ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ]; then
  . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh"
elif [ -s "$NVM_DIR/nvm.sh" ]; then
  . "$NVM_DIR/nvm.sh"
fi

# Load NVM bash completion
if [ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ]; then
  . "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm"
elif [ -s "$NVM_DIR/bash_completion" ]; then
  . "$NVM_DIR/bash_completion"
fi

# Auto-switch node version when entering a directory with .nvmrc or .node-version
autoload -U add-zsh-hook
load-nvmrc() {
  local nvmrc_path
  nvmrc_path="$(nvm_find_nvmrc 2>/dev/null)"

  # Fallback: check for .node-version if no .nvmrc found
  if [ -z "$nvmrc_path" ] && [ -f ".node-version" ]; then
    nvmrc_path=".node-version"
  fi

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version
    nvmrc_node_version=$(nvm version "$(cat "$nvmrc_path")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then
      nvm use
    fi
  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc 2>/dev/null)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# npm aliases
alias ni='npm install'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'

# pnpm aliases
alias pi='pnpm install'
alias pr='pnpm run'
alias prd='pnpm run dev'
alias prb='pnpm run build'
alias prt='pnpm run test'
alias pa='pnpm add'
alias pad='pnpm add -D'
