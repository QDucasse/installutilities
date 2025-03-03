#!/usr/bin/env bash

source ./utils.sh

e_header "Installing rust"

if type_exists 'rustup'; then
  rustup-init
  e_success "Rust installed!"
else
  e_error "Failed to install rust versions"
fi

# Globally installed rust crates
rust_crates=(
)

for crate in "${rust_crates[@]}"; do
  cargo install "$crate"
done

e_success "Main rust crates installed!"