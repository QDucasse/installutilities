#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew cask apps"

e_arrow "Installing cask and tapping"

brew tap homebrew/cask-versions

e_arrow "Installing cask apps"

apps=(
  appcleaner
  balenaetcher
  bitwarden
  discord
  docker
  firefox
  flycut
  gpg-suite
  iterm2
  libreoffice
  mactex
  mattermost
  microsoft-office
  microsoft-teams
  nextcloud
  obs
  signal
  tailscale
  temurin
  the-unarchiver
  visual-studio-code
  vlc
  zotero
)

for app in "${apps[@]}"; do
  brew install --cask $app
done

e_success "Done!"
