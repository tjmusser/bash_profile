# Terminal Profile

Modular zsh configuration for macOS. Manages git integration, shell aliases, Node.js/NVM settings, and development tool shortcuts across machines.

Files are **symlinked** to your home directory, so pulling changes in this repo immediately updates your live config.

## What's Included

- **Git prompt** - Shows branch name in your prompt. Green `(branch)` for clean repos, red `{branch}` for dirty repos
- **Git aliases** - Shortcuts for common git tasks (`git co`, `git ci`, `git hist`, `syncmain`, etc.)
- **Git config** - Sensible defaults: rebase on pull, auto-prune, ff-only merges, rerere
- **Git hooks** - Pre-commit hook warns on commits to main/master and catches `console.log`/`debugger`. Pre-push hook prevents force pushes to protected branches
- **Shell aliases** - Directory navigation, reload, cleanup shortcuts
- **Node.js/NVM** - NVM initialization with automatic `nvm use` when entering a directory with `.nvmrc`
- **Dev tools** - Claude Code and jcodeMunch aliases

## Installation

Clone the repo and run the installer:

```
git clone <repo-url> ~/bash_profile
cd ~/bash_profile
chmod +x install.sh
./install.sh
```

The installer will:
1. Back up any existing config files (e.g. `~/.zshrc.backup.2026-04-14`)
2. Symlink config files from this repo to your home directory
3. Optionally install git hook templates
4. Walk you through git config setup (username, email, global settings)
5. Set up git aliases in your global git config

## Making Changes

Since files are symlinked, edit them directly in this repo. Changes are live in new terminal windows immediately.

To refresh the current terminal session:

```
reload
```

## Shell Aliases

### Git Shortcuts

| Alias | Command |
|-------|---------|
| `gs` | `git status` |
| `ga` | `git add` |
| `gb` | `git branch` |
| `gc` | `git commit --verbose` |
| `gd` | `git diff` |
| `go` | `git checkout` |
| `gri` | `git rebase -i` |
| `gf` | `git fetch -p origin` |
| `gpr` | `git pull --rebase` |
| `gpmain` | `git push origin main` |

### Sync Branches (Gitflow)

Fast-forward merge your local main and develop branches with origin:

```
syncmain  = git checkout main && git fetch -p origin && git merge --ff-only origin/main
syncdev   = git checkout develop && git fetch -p origin && git merge --ff-only origin/develop
syncall   = syncmain && syncdev
```

### Git Aliases (via git config)

| Alias | Description |
|-------|-------------|
| `git co` | checkout |
| `git ci` | commit --verbose |
| `git cob` | checkout -b |
| `git hist` | Pretty log with graph |
| `git save` | Add all + commit "SAVEPOINT" |
| `git wip` | Commit tracked changes as "WIP" |
| `git undo` | Soft reset last commit |
| `git amend` | Amend last commit |
| `git wipe` | Savepoint + hard reset (recoverable via reflog) |
| `git pfwl` | Push --force-with-lease |
| `git la` | List all aliases |

### npm Aliases

| Alias | Command |
|-------|---------|
| `ni` | `npm install` |
| `nr` | `npm run` |
| `nrd` | `npm run dev` |
| `nrb` | `npm run build` |
| `nrt` | `npm run test` |

### Dev Tool Aliases

| Alias | Command |
|-------|---------|
| `cc` | `claude` |
| `ccc` | `claude --continue` |
| `ccr` | `claude --resume` |
| `jcm` | `jcodemunch` |

### Navigation

| Alias | Command |
|-------|---------|
| `..` | `cd ..` |
| `...` | `cd ../..` |
| `....` | `cd ../../..` |
| `.2`-`.5` | cd up 2-5 directories |
| `ll` | `ls -al` |
| `killDS` | Recursively delete .DS_Store files |

## File Structure

| File | Purpose |
|------|---------|
| `.zshrc` | Main entry point, sources all other files |
| `.zsh-settings.sh` | Prompt configuration with git integration |
| `.alias.sh` | Shell and git shortcut aliases |
| `.git-alias.sh` | Git config aliases (run once during install) |
| `.git-config-setup.sh` | Interactive git config setup |
| `.git-prompt.sh` | Git prompt support (upstream script) |
| `.node-settings.sh` | NVM init, auto-switch, npm aliases |
| `.dev-tools.sh` | Claude Code, jcodeMunch aliases |
| `git-templates/hooks/` | Pre-commit and pre-push hook templates |
| `install.sh` | Installation script |
