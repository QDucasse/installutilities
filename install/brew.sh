#!/usr/bin/env bash

source ./utils.sh

e_header "Installing homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" 

(echo; echo 'eval "$(/usr/local/bin/brew shellenv)"') >> "${HOME}.zprofile"
eval "$(/usr/local/bin/brew shellenv)"

brew doctor
brew update

e_success "Done!"
