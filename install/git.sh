#!/usr/bin/env bash

source ./utils.sh

e_header "Setting some git config defaults"

# User basics
git config --global user.name "$1"
git config --global user.email "$2"

# Branches/tags
git config --global init.defaultBranch main
git config --global column.ui auto
git config --global branch.sort -committerdate
git config --global tag.sort version:refname

# Diffs
git config --global color.diff-highlight.oldnormal=red bold
git config --global color.diff-highlight.oldhighlight=red bold 52
git config --global color.diff-highlight.newnormal=green bold
git config --global color.diff-highlight.newhighlight=green bold 22
git config --global diff.algorithm histogram
git config --global diff.colorMoved plain
git config --global diff.mnemonicPrefix true
git config --global diff.renames true

# Pushes
git config --global push.autoSetupRemote true
git config --global push.followTags true

# Fetches
git config --global fetch.prune true
git config --global fetch.pruneTags true
git config --global fetch.all true

# Commit
git config --global commit.verbose true


# Aliases

# - Show aliases
git config set alias.aliases "config get --all --show-names --regexp '^alias\.'"
# - Diff staged
git config --global alias.diffs "diff --staged"
# - Create a nice last-change git log message, from https://twitter.com/elijahmanor/status/697055097356943360
git config --global alias.lastchange 'log -p --follow -n 1'

# Default gitignore for macos
git-ignore macos > ${HOME}/.gitignore
git config --global core.excludesFile '~/.gitignore'

e_success "Done!"
