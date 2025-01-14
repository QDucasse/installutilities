#!/usr/bin/env bash

source ./utils.sh

# ===========================================
# SSH Key creation and addition to the agent
# ===========================================

e_header "Creating new ssh key and adding it to the keychain"

ssh-keygen -t ed25519 -C "$2"
eval "$(ssh-agent -s)"
echo "Host github.com\n  AddKeysToAgent yes\n  UseKeychain yes\n  IdentityFile ~/.ssh/id_ed25519" >> "${HOME}/.ssh/config"
ssh-add --apple-use-keychain ~/.ssh/id_ed25519

e_arrow "Public key:"
cat ~/.ssh/id_ed25519.pub
e_arrow "Add the above public key to your GitHub account!"


e_success "SSH key created and added to the Keychain!"