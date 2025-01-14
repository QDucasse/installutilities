#!/usr/bin/env bash

source ./utils.sh

e_header "Installing brew utilities"

binaries=(
  bash                                  # up-to-date bash version
  bat                                   # cat clone with syntax highlighting and git integration https://github.com/sharkdp/bat
  cmake                                 # build tool
  coreutils                             # gnu coreutils
  curl                                  # up-to-date version of curl
  ffmpeg                                # streaming media editing tool
  git                                   # up-to-date version of git
  ghidra                                # reverse engineering
  gnupg                                 # GNU PGP key tools
  haskell-stack                         # haskell build tool
  htop                                  # the best process monitor
  imagemagick                           # another image processor
  llvm                                  # LLVM compiler infrastructure
  neovim                                # vim with a lot more features
  ninja                                 # build system
  pinentry-mac                          # pops a dialog for entering passphrases for GPG
  pyenv                                 # python versions manager
  qemu                                  # emulator
  rustup-init                           # rust toolchain installer
  tldr                                  # man with examples
  tmux                                  # terminal multiplexer
  tree                                  # fast recursive directory listing tool
  wget                                  # up-to-date wget
)

e_arrow "Installing brew packages"

for binary in "${binaries[@]}"; do
  brew install $binary
done

brew cleanup

e_success "Done!"
