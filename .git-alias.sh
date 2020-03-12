#!/bin/bash
#
# Aliases to use within git

git config --global --replace-all alias.co checkout
git config --global --replace-all alias.ci '!git commit --verbose'
git config --global --replace-all alias.st status
git config --global --replace-all alias.br branch
git config --global --replace-all alias.cp 'cherry-pick'
git config --global --replace-all alias.hist "log --format=format:'%C(bold yellow)%h%C(reset) %C(blue)(%ar)%C(reset) - %C(white)%s%C(reset) %C(dim white)[%an]%C(reset)%C(dim yellow)%d%C(reset)' --graph --decorate"
git config --global --replace-all alias.type 'cat-file -t'
git config --global --replace-all alias.dump 'cat-file -p'
git config --global --replace-all alias.last 'log -1 HEAD'

# ff merge or pull --rebase is better than standard merge when updating master or develop branches
# No accidental or unnecessary merge commits. Avoid stupid git mistakes
git config --global --replace-all alias.fp '!git fetch -p origin'
git config --global --replace-all alias.ffm 'merge --ff-only'
git config --global --replace-all alias.cob 'checkout -b'
git config --global --replace-all alias.la '!git config -l | grep alias | cut -c 7-'
git config --global --replace-all alias.ac '!git add . && git commit --verbose'
git config --global --replace-all alias.pfwl 'push --force-with-lease origin'
git config --global --replace-all alias.syncdev '!git co develop && git fp && git ffm origin/develop'
git config --global --replace-all alias.syncmaster '!git co master && git fp && git ffm origin/master'
git config --global --replace-all alias.syncall '!git syncmaster && git syncdev'
git config --global --replace-all alias cleanbranches="!git co develop && git branch | grep -v "master\|develop" | xargs git branch -D"

# This commits everything in your working directory and then does a hard reset to remove that commit.
# The nice thing is, the commit is still there, but it’s just unreachable. Unreachable commits are a bit
# inconvenient to restore, but at least they are still there. You can run the git reflog command and find
# the SHA of the commit if you realize later that you made a mistake with the reset. The commit message will
# be “WIPE SAVEPOINT” in this case.
git config --global --replace-all alias.wipe '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'

# Adds all changes including untracked files and creates a commit
git config --global --replace-all alias.save '!git add -A && git commit -m "SAVEPOINT"'

# Only commits tracked changes
git config --global --replace-all alias.wip 'commit -am "WIP"'

# Resets the previous commit, but keeps all the changes from that commit in the working directory.
# Slap people in the face that use `git reset HEAD --hard`. It’s a bad idea. Don’t do it!
git config --global --replace-all alias.undo 'reset HEAD~1 --mixed'

# Amends current changes to previous commit
git config --global --replace-all alias.amend 'commit -a --amend'

# Returns the total lines of code in a codebase
git config --global --replace-all alias.countfiles 'ls-files | xargs cat | wc -l'

# Terminal diff of all changes
git config --global --replace-all alias.filelog 'log -u'

# Same as `hist` without the bells and whistles
git config --global --replace-all alias.logtree 'log --graph --oneline --decorate --all'
