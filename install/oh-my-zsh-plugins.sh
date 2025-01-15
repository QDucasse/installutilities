#!/usr/bin/env bash

source ./utils.sh

e_arrow "Installing oh-my-zsh custom theme & plugins"

ZSH_CUSTOM=${ZSH}/custom

# ==============
# Theme
# ==============

if [ ! -d "${ZSH_CUSTOM}/themes/powerlevel10k" ]; then
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}/themes/powerlevel10k"
else
    e_arrow 'powerlevel10k is already installed!'
fi

# ==============
# Plugins
# ==============

mkdir -p "${ZSH_CUSTOM}/plugins"

plugins=(
    "zsh-syntax-highlighting"
    "zsh-autosuggestions"
)

for plugin in "${plugins[@]}"; do
    if [ ! -d "${ZSH_CUSTOM}/plugins/$plugin" ]; then
        git clone https://github.com/zsh-users/$plugin.git "${ZSH_CUSTOM}/plugins/$plugin"

    else
        e_arrow "$plugin is already installed!"
    fi
done

e_success "Done! (Activate the plugins in .zshrc with plugins=(...))"
