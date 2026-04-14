#!/bin/zsh
#
# Git aliases set via git config (run once during install, not on every shell startup)

git config --global --replace-all alias.co checkout
git config --global --replace-all alias.ci '!git commit --verbose'
git config --global --replace-all alias.st status
git config --global --replace-all alias.br branch
git config --global --replace-all alias.cp 'cherry-pick'
git config --global --replace-all alias.hist "log --format=format:'%C(bold yellow)%h%C(reset) %C(blue)(%ar)%C(reset) - %C(white)%s%C(reset) %C(dim white)[%an]%C(reset)%C(dim yellow)%d%C(reset)' --graph --decorate"
git config --global --replace-all alias.type 'cat-file -t'
git config --global --replace-all alias.dump 'cat-file -p'
git config --global --replace-all alias.last 'log -1 HEAD'

# ff merge or pull --rebase is better than standard merge when updating main or develop branches
# No accidental or unnecessary merge commits
git config --global --replace-all alias.fp '!git fetch -p origin'
git config --global --replace-all alias.ffm 'merge --ff-only'
git config --global --replace-all alias.cob 'checkout -b'
git config --global --replace-all alias.la '!git config -l | grep alias | cut -c 7-'
git config --global --replace-all alias.ac '!git add . && git commit --verbose'
git config --global --replace-all alias.pfwl 'push --force-with-lease origin'
git config --global --replace-all alias.syncdev '!git co develop && git fp && git ffm origin/develop'
git config --global --replace-all alias.syncmain '!git co main && git fp && git ffm origin/main'
git config --global --replace-all alias.syncall '!git syncmain && git syncdev'
git config --global --replace-all alias.cleanbranches '!git co develop && git branch | grep -v "main\|develop" | xargs git branch -D'

# Commits everything then does a hard reset to remove that commit.
# The commit is still there but unreachable. Use git reflog to find it if needed.
git config --global --replace-all alias.wipe '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'

# Adds all changes including untracked files and creates a commit
git config --global --replace-all alias.save '!git add -A && git commit -m "SAVEPOINT"'

# Only commits tracked changes
git config --global --replace-all alias.wip 'commit -am "WIP"'

# Resets the previous commit, but keeps all changes in the working directory
git config --global --replace-all alias.undo 'reset HEAD~1 --mixed'

# Amends current changes to previous commit
git config --global --replace-all alias.amend 'commit -a --amend'

# Returns the total lines of code in a codebase
git config --global --replace-all alias.countfiles '!git ls-files | xargs cat | wc -l'

# Terminal diff of all changes
git config --global --replace-all alias.filelog 'log -u'

# Same as `hist` without the bells and whistles
git config --global --replace-all alias.logtree 'log --graph --oneline --decorate --all'
