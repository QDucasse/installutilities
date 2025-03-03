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
  fzf                                   # fuzzy command line finder
  git                                   # up-to-date version of git
  git-ignore                            # gitignore templates
  gnupg                                 # GNU PGP key tools
  haskell-stack                         # haskell build tool
  htop                                  # the best process monitor
  imagemagick                           # another image processor
  neovim                                # vim with a lot more features
  ninja                                 # build system
  nvm                                   # node version manager
  pinentry-mac                          # pops a dialog for entering passphrases for GPG
  pyenv                                 # python versions manager
  qemu                                  # emulator
  rbenv                                 # ruby versions manager
  rustup-init                           # rust toolchain installer
  tldr                                  # man with examples
  tmux                                  # terminal multiplexer
  tree                                  # fast recursive directory listing tool
  uv                                    # python version managers
  wget                                  # up-to-date wget
)

# TODO: Maybe move the version managers of some languages inside their corresponding files.

e_arrow "Installing brew packages"

# Setting up shell integration if needed
# For pyenv/rbenv/nvm, done in their respective files
if fzf --version; then
  e_header "Installing fzf support in .zshrc"
  (
    echo;
    echo '# fzf';
    echo 'source <(fzf --zsh)';
  ) >> ~/.zshrc
fi

for binary in "${brew_binaries[@]}"; do
  brew install "$binary"
done

brew cleanup

e_success "Done!"
