#!/usr/bin/env bash

source ./utils.sh

# ===========================================
# SSH Key creation and addition to the agent
# ===========================================

e_header "Generating a new GPG key"

gpg --full-generate-key
key_id=$(gpg --list-secret-keys --keyid-format=long | grep 'sec' | awk '{print $2}' | cut -d/ -f2)

e_arrow "Public key:"
gpg --armor --export $key_id

e_success "GPG key created!"