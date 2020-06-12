#!/usr/bin/env bash

source ./utils.sh

# ====================
# Python installationS
# ====================

e_header "Installing various versions of python"

if pyenv --version; then
  # For compilers to find zlib you may need to set:
  export LDFLAGS="${LDFLAGS} -L/usr/local/opt/zlib/lib"
  export CPPFLAGS="${CPPFLAGS} -I/usr/local/opt/zlib/include"

  # For pkg-config to find zlib you may need to set:
  export PKG_CONFIG_PATH="${PKG_CONFIG_PATH} /usr/local/opt/zlib/lib/pkgconfig"

  # Because of old python version
  #CFLAGS="-I$(brew --prefix openssl)/include" LDFLAGS="-L$(brew --prefix openssl)/lib" pyenv install 2.7.8
  pyenv install 2.7.17
  pyenv install 3.8.2
  pyenv global 3.8.2
  # Ideas taken from the article https://opensource.com/article/19/5/python-3-default-mac
  echo -e '\n# ======\n# Python\n# ======\nif command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv
  e_success "Done!"
else
  e_error "Failed to install python versions"
fi

# ===========================
# Virtual environment handler
# ===========================

# e_header "Installing virtualenvwrapper"
#
# if pip install virtualenvwrapper; then
#   echo -e '\nexport VIRTUALENVWRAPPER_PYTHON=$HOME/.pyenv/shims/python\nexport WORKON_HOME=$HOME/.virtualenvs\nsource "/Users/qducasse/.pyenv/versions/3.8.2/bin/virtualenvwrapper.sh"' >> ~/.zshenv
#   e_success "Done!"
# else
#   e_error "Failed to install virtualenvwrapper"
# fi
