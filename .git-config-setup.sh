#!/bin/bash
#

# File to be run once to set up some nice standard git global setting

# Allow all Git commands to use colored output, if possible
git config --global color.ui auto

# Tell Git which whitespace problems it should recognize
git config --global core.whitespace trailing-space,space-before-tab

# Tell git diff to use mnemonic prefixes (index, work tree, commit, object) instead of the standard a and b notation
git config --global diff.mnemonicprefix true

# When branching off a remote branch, automatically let the local branch track the remote branch
git config --global branch.autosetupmerge true

# When pushing without giving a refspec, push the current branch to its upstream branch. 
# See the git config man page for more possible options.
git config --global push.default tracking

# Enable the recording of resolved conflicts, so that identical hunks can be resolved automatically later on.
git config --global rerere.enabled true

# Auto update/stage rerere on merge fixes (works on rebase too)
git config --global rerere.autoupdate true
