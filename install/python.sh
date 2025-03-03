#!/usr/bin/env bash

source ./utils.sh

# ====================
# Python installationS
# ====================

e_header "Installing various versions of Python and pipenv"


# Installing pyenv
if uv --version; then
  e_header "Installing various python versions"
  uv python install 3.12 3.13 pypy
  e_success "Python versions installed:"
  uv python list
else
  e_error "Failed to install python versions, is uv installed?"
fi


e_header "Installing various python libraries"

# Globally installed python libs
python_libs=(
  "ruff"       # linter
  "mypy"       # static type annotations
  "tox"        # venv automation
  "pytest"     # unit tests
  "Pygments"   # latex minted
)

for lib in "${python_libs[@]}"; do
  uv tool install "$lib"
done

uv tool update-shell

e_success "Python libs installed:"

uv tool list