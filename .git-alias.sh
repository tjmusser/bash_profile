#!/bin/bash
#
# Aliases to use within git

git config --global alias.co checkout
git config --global alias.ci '!git commit --verbose'
git config --global alias.st status
git config --global alias.br branch
git config --global alias.hist "log --format=format:'%C(bold yellow)%h%C(reset) %C(blue)(%ar)%C(reset) - %C(white)%s%C(reset) %C(dim white)[%an]%
C(reset)%C(dim yellow)%d%C(reset)' --graph --decorate"
git config --global alias.type 'cat-file -t'
git config --global alias.dump 'cat-file -p'
git config --global alias.last 'log -1 HEAD'

# ff merge or pull --rebase is better than standard merge when updating master or develop branches
# No accidental or unnecessary merge commits 
git config --global alias.ffm 'merge --ff-only'
git config --global alias.cob 'checkout -b'
git config --global alias.la '!git config -l | grep alias | cut -c 7-'
git config --global alias.ac '!git add . && git commit --verbose'
git config --global alias.pfwl 'push --force-with-lease origin'


# slap people in the face that use `git reset HEAD --hard`. It’s a bad idea. Don’t do it!
#
# This commits everything in my working directory and then does a hard reset to remove that commit. 
# The nice thing is, the commit is still there, but it’s just unreachable. Unreachable commits are a bit 
# inconvenient to restore, but at least they are still there. You can run the git reflog command and find 
# the SHA of the commit if you realize later that you made a mistake with the reset. The commit message will 
# be “WIPE SAVEPOINT” in this case.
git config --global alias.wipe '!git add -A && git commit -qm "WIPE SAVEPOINT" && git reset HEAD~1 --hard'

# Adds all changes including untracked files and creates a commit
git config --global alias.save '!git add -A && git commit -m "SAVEPOINT"'

# Only commits tracked changes
git config --global alias.wip 'commit -am "WIP"'

# Resets the previous commit, but keeps all the changes from that commit in the working directory.
git config --global alias.undo 'reset HEAD~1 --mixed'

# Amends current changes to previous commit
git config --global alias.amend 'commit -a --amend'

# Terminal diff of all changes
git config --global alias.filelog 'log -u'

# Same as `hist` without the bells and whistles
git config --global alias.logtree 'log --graph --oneline --decorate --all'
