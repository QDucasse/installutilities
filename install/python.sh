#!/usr/bin/env bash

source ./utils.sh

# ====================
# Python installationS
# ====================

e_header "Installing various versions of Python and pipenv"


# Installing pyenv
if pyenv --version; then
  e_header "Installing pyenv environment in .zshrc"
  (
    echo;
    echo '# pyenv';
    echo 'export PYENV_ROOT="$HOME/.pyenv"';
    echo '[[ -d "${PYENV_ROOT}/bin" ]] && export PATH="$PYENV_ROOT/bin:$PATH"';
    echo 'eval "$(pyenv init -)"'
  ) >> ~/.zshrc
  pyenv install 3.13
  pyenv install pypy3.10-7.3.17
  pyenv global 3.13
  e_success "Python versions installed! (see with pyenv versions)"

  e_header "Installing pipenv"
  pip install pipenv --user
  (
    echo;
    echo '# pipenv';
    echo 'export PIPENV_BIN="$HOME/.local/bin"';
    echo 'command -v pipenv >/dev/null || export PATH="$PIPENV_BIN:$PATH"'
  ) >> ~/.zshrc

  e_success "pipenv installed!"
else
  e_error "Failed to install python versions"
fi

# Globally installed python libs
python_libs=(
  ruff       # linter
  uv         # package/venv manager (when ditching pipenv one day)
  mypy       # static type annotations
  tox        # venv automation
  pytest     # unit tests
  Pygments   # latex minted
)

pip install "${python_libs[@]}" --user

e_success "Main python libs installed!"