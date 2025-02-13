#!/usr/bin/env bash

source ./utils.sh

# Read name and email input
echo "Enter your full name (e.g. John Doe):"
read -r user_name
echo "Enter your email address (e.g. john.doe@mail.com):"
read -r user_email

if [ $(command -v brew) ]; then
  e_arrow 'homebrew is already installed!'
else
  source ./install/brew.sh
fi


if [ -d "$ZSH" ]; then
  e_arrow 'oh-my-zsh is already installed!'
else
  source ./install/oh-my-zsh.sh
  exit 0
fi

source ./install/oh-my-zsh-plugins.sh

echo ""
echo "Install brew utilities?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/brew-utilities.sh
fi

echo ""
echo "Install brew cask apps?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/brew-cask.sh
fi

echo ""
echo "Install python runtime?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/python.sh
fi

echo ""
echo "Install ruby runtime?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/ruby.sh
fi

echo ""
echo "Install javascript runtime?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/javascript.sh
fi


echo ""
echo "Install git config?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/git.sh "$user_name" "$user_email"
fi

echo ""
echo "Generate new ssh key?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/ssh.sh "$user_name" "$user_email"
fi

echo ""
echo "Generate new gpg key?  (y/n)"
read -r response
if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]; then
  source ./install/gpg.sh "$user_name" "$user_email"
fi

for app in "Activity Monitor" "cfprefsd" "Dock" "Finder" "Spectacle" "SystemUIServer"; do
  killall "${app}" &> /dev/null
done
