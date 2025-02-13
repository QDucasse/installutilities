#!/usr/bin/env bash

source ./utils.sh

e_header "Installing nvm"


e_header "Installing node nvm"

if nvm --version
  e_header "Installing pyenv environment in .zshrc"
  (
    echo;
    echo '# nvm';
    echo 'export NVM_DIR="$HOME/.nvm"';
    echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"';
    echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"'
  ) >> ~/.zshrc
  nvm install node
  nvm install --lts
  e_success "Node versions installed! (see with nvm ls)"
else
  e_error "Failed to install node versions"
fi

e_header "Installing bun"

curl -fsSL https://bun.sh/install | bash

node_packs=(
)

bun install -g "${node_packs[@]}"

e_success "Main node packages installed!"