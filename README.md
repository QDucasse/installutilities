# Installation facilities for macOS

---

This repository is based on *brandonb927*'s [dotfiles](https://github.com/brandonb927/dotfiles) and their customisation for my usage.


### Usage

Clone the repository and run the main files `bootstrap.sh` for utilities and app installations or `macos.sh` for macOS customisation.

```bash
$ git clone https://github.com/QDucasse/install_utilities.git
$ cd install_utilities
$ sh bootstrap.sh
```

### Dive in

This part consists of an explanation of the contents of the main scripts for the installation and customisation.

1. **`bootstrap.sh`**

The different components run by `bootstrap.sh` are the following:

***The first two are mandatory***

- `brew.sh`: Install `homebrew`
- `oh-my-zsh.sh`: Install `zsh` and some plugins (`oh-my-zsh-plugins.sh`)

***The next ones are asked to be confirmed by the user***
- `brew-utilities.sh`: Command line utilities from `homebrew`.
- `brew-cask.sh`: Applications that can be installed directly from `casks`.
- `python.sh`: Python working environment (`pyenv`, `pipenv`).
- `ssh.sh`: Create a new ssh key and add it to the keychain.
- `gpg.sh`: Create a new gpg key.
- `git.sh`: Git global configuration. **PLEASE USE YOUR OWN NAME AND EMAIL!**

1.  `macos.sh`

Some tweaks *mostly* tested on macOS Sequoia. **PLEASE READ IT TO SEE WHAT THEY DO!!!**

```bash
$ sh macos.sh
```
