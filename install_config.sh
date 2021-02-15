#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

install() {
  echo "Installing dot-files:"
  echo "➜ ZSH"
  cp zsh/zshrc $HOME/.zshrc
  cp zsh/zsh_aliases $HOME/.zsh_aliases
  echo "➜ Starship"
  cp starship/starship.toml $HOME/.config/starship.toml
  # echo "➜ Sublime Text"
  # cp sublime/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime Text 3/Packages/User/Preferences.sublime-settings
  echo "➜ SpaceVim"
  cp spacevim/init.toml $HOME/.SpaceVim.d/init.toml
  cp spacevim/tasks.toml $HOME/.SpaceVim.d/tasks.toml
  # echo "➜ Spacemacs"
  # cp spacemacs/spacemacs $HOME/.spacemacs
  # echo "➜ Git"
  # cp git/gitignore_global $HOME/.gitignore_global
  echo "✓ Configurations installed!"
}

install
