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

# Configure git
git config --global user.signingkey $key_id
git config --global gpg.program $(which gpg)
git config --global commit.gpgsign true
git config --global tag.gpgSign true

# Add use agent information
echo 'use-agent' > ~/.gnupg/gpg.conf

# Caching behavior
(
    echo "default-cache-ttl 600";
    echo "max-cache-ttl 7200";
    echo "pinentry-program $(brew --prefix)/bin/pinentry-mac";
) >> ${HOME}/.gnupg/gpg-agent.conf

# Add info to the shell
(
    echo;
    echo "# GPG";
    echo "export GPG_TTY=$(tty)";
) >> ${HOME}/.zshrc

# Restart the daemon
gpgconf --kill gpg-agent
gpg-agent --daemon

e_success "GPG key created!"