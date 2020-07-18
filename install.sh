#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

deps() {
  echo "Installing dependencies:"
  echo "➜ ohmyzsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "➜ chruby, elixir, fd, ripgrep, fzf, exa, bat, neovim, startship"
  brew install chruby elixir fd ripgrep fzf exa bat neovim starship
  echo "➜ rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "➜ sublime text"
  curl -O https://download.sublimetext.com/Sublime%20Text%20Build%203211.dmg -o SublimeText.dmg
  hdiutil attach SublimeText.dmg
  cd /Volumes/SublimeText/
  sudo installer -pkg SublimeText.pkg -target "/"
  hdiutil detach /Volumes/SublimeText/
  echo "➜ spacevim"
  curl -sLf https://spacevim.org/install.sh | bash
  echo "➜ spacemacs"
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d -b develop
  echo "✓ Dependencies installed!"
}

install() {
  echo "Installing dot-files:"
  echo "➜ .zshrc"
  cp zsh/zshrc $HOME/.zshrc
  echo "➜ .zsh_aliases"
  cp zsh/zsh_aliases $HOME/.zsh_aliases
  # Sublime Text
  # Neovim
  # Spacevim
  echo "➜ .spacemacs"
  cp spacemacs/spacemacs $HOME/.spacemacs
  echo "➜ .gitignore_global"
  cp git/gitignore_global $HOME/.gitignore_global
  echo "✓ Configurations installed!"
}

if [[ $# -gt 0 ]]; then
  if [[ $1 == "--deps" ]]; then
    deps
  fi
fi
install
