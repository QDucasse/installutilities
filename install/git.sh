#!/usr/bin/env bash

source ./utils.sh

e_header "Setting some git config defaults"

git config --global user.name "$1"
git config --global user.email "$2"
git config --global color.diff-highlight.oldNormal "red bold"
git config --global color.diff-highlight.oldHighlight "red bold 52"
git config --global color.diff-highlight.newNormal "green bold"
git config --global color.diff-highlight.newHighlight "green bold 22"

git config --global gpg.format ssh
git config --global commit.gpgsign true
git config --global tag.gpgSign true
git config --global user.signingkey "${HOME}/.ssh/id_ed25519.pub"

# Create a nice last-change git log message, from https://twitter.com/elijahmanor/status/697055097356943360
git config --global alias.lastchange 'log -p --follow -n 1'

e_success "Done!"
