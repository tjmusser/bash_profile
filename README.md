# Terminal Profile

Modular zsh configuration for macOS. Manages git integration, shell aliases, Node.js/NVM settings, and development tool shortcuts across machines.

Files are **symlinked** to your home directory, so pulling changes in this repo immediately updates your live config.

## What's Included

- **Git prompt** - Shows branch name in your prompt. Green `(branch)` for clean repos, red `{branch}` for dirty repos
- **Git aliases** - Shortcuts for common git tasks (`git co`, `git ci`, `git hist`, `syncmain`, etc.)
- **Git config** - Sensible defaults: rebase on pull, auto-prune, ff-only merges, rerere, SSH commit signing
- **Git hooks** - Pre-commit catches `console.log`/`debugger` and warns on commits to protected branches. Pre-push prevents force pushes and validates gitflow branch naming
- **Gitflow shortcuts** - Branch creation aliases for feature, bugfix, release, and hotfix branches
- **Shell aliases** - Navigation, cleanup (`nuke_modules`, `nuke_dist`), reload shortcuts
- **Node.js/NVM** - NVM initialization with automatic `nvm use` when entering a directory with `.nvmrc` or `.node-version`
- **npm/pnpm** - Aliases for both package managers
- **Docker** - Container and Docker Compose aliases (only active when Docker is installed)
- **Dev tools** - Claude Code and jcodeMunch aliases
- **Global gitignore** - Excludes `.env`, `.DS_Store`, `node_modules`, and common editor files globally
- **SSH setup** - Interactive SSH key generation and macOS Keychain integration

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
4. Walk you through git config setup (username, email, global settings, SSH signing)
5. Set up git aliases in your global git config
6. Optionally generate an SSH key and configure macOS Keychain

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

### Gitflow Branch Shortcuts

Create branches following gitflow naming conventions:

| Alias | Creates branch |
|-------|----------------|
| `gff my-feature` | `feature/my-feature` |
| `gfb my-fix` | `bugfix/my-fix` |
| `gfr 1.2.0` | `release/1.2.0` |
| `gfh critical-fix` | `hotfix/critical-fix` |

Also available as git aliases: `git feature`, `git bugfix`, `git release`, `git hotfix`

### Cleanup

| Alias | What it does |
|-------|-------------|
| `nuke_modules` | Recursively delete all `node_modules` directories from cwd |
| `nuke_dist` | Recursively delete all `dist` directories from cwd |
| `cleanup` | Delete merged branches + prune stale remote refs |
| `killDS` | Recursively delete `.DS_Store` files |

### Git Aliases (via git config)

| Alias | Description |
|-------|-------------|
| `git co` | checkout |
| `git ci` | commit --verbose |
| `git cob` | checkout -b |
| `git feature` | checkout -b feature/ |
| `git bugfix` | checkout -b bugfix/ |
| `git release` | checkout -b release/ |
| `git hotfix` | checkout -b hotfix/ |
| `git wta` | worktree add |
| `git wtl` | worktree list |
| `git wtr` | worktree remove |
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

### pnpm Aliases

| Alias | Command |
|-------|---------|
| `pi` | `pnpm install` |
| `pr` | `pnpm run` |
| `prd` | `pnpm run dev` |
| `prb` | `pnpm run build` |
| `prt` | `pnpm run test` |
| `pa` | `pnpm add` |
| `pad` | `pnpm add -D` |

### Docker Aliases

Active only when Docker is installed.

| Alias | Command |
|-------|---------|
| `dps` | `docker ps` |
| `dpsa` | `docker ps -a` |
| `dimg` | `docker images` |
| `dprune` | `docker system prune -af` |
| `dlog` | `docker logs -f` |
| `dcu` | `docker compose up -d` |
| `dcd` | `docker compose down` |
| `dcr` | `docker compose restart` |
| `dcl` | `docker compose logs -f` |
| `dcb` | `docker compose build` |

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

## File Structure

| File | Purpose |
|------|---------|
| `.zshrc` | Main entry point, sources all other files |
| `.zsh-settings.sh` | Prompt configuration with git integration |
| `.alias.sh` | Shell, git, gitflow, and cleanup aliases |
| `.git-alias.sh` | Git config aliases (run once during install) |
| `.git-config-setup.sh` | Interactive git config and SSH signing setup |
| `.git-prompt.sh` | Git prompt support (upstream script) |
| `.node-settings.sh` | NVM init, auto-switch (`.nvmrc`/`.node-version`), npm and pnpm aliases |
| `.docker-aliases.sh` | Docker and Docker Compose aliases |
| `.dev-tools.sh` | Claude Code, jcodeMunch aliases |
| `.gitignore_global` | Global gitignore for secrets, macOS, editor, and build files |
| `git-templates/hooks/pre-commit` | Warns on commits to protected branches, catches console.log/debugger |
| `git-templates/hooks/pre-push` | Validates gitflow branch naming, blocks force pushes to main/master |
| `install.sh` | Installation script |
