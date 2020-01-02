#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

main() {
  install
}

install() {
  echo "Installing dot-files:"
  echo " - .zshrc"
  cp zsh/zshrc $HOME/.zshrc
  echo " - .zsh_aliases"
  cp zsh/zsh_aliases $HOME/.zsh_aliases
  # Neovim
  # Spacevim
  echo " - .spacemacs"
  cp spacemacs/spacemacs $HOME/.spacemacs
  echo " - .gitignore_global"
  cp git/gitignore_global $HOME/.gitignore_global
  echo "Done!"
}

main
