#!/usr/bin/env bash

source ./utils.sh

e_header "Installing various versions of ruby"

if type_exists 'rbenv'; then
  (
    echo;
    echo '# rbenv';
    echo 'eval "$(rbenv init -)"'
  ) >> ~/.zshrc

  rbenv init
  rbenv install 3.4.1
  rbenv install truffleruby+graalvm-24.1.1
  rbenv global 3.4.1

  e_success "Ruby versions installed! (see with rbenv versions)"
else
  e_error "Failed to install ruby versions"
fi

# Globally installed gems
ruby_gems=(
  "rubocop"
  "rails"
)

for gem in "${ruby_gems[@]}"; do
  gem install "$gem"
done

e_success "Main ruby gems installed!"