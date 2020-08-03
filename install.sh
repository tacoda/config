#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# REQUIREMENTS:
# PCRE
# OpenSSL
# xcode-select --install


deps() {
  echo "Installing dependencies:"
  echo "➜ ohmyzsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  echo "➜ chruby, elixir, emacs-plus, fd, gcc, ripgrep, fzf, exa, bat, neovim, starship"
  brew tap d12frosted/emacs-plus
  brew install chruby elixir emacs-plus fd gcc ripgrep fzf exa bat neovim starship
  brew linkapps emacs-plus
  echo "➜ rustup"
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "➜ Sublime Text"
  curl -O https://download.sublimetext.com/Sublime%20Text%20Build%203211.dmg -o SublimeText.dmg
  hdiutil attach SublimeText.dmg
  cd /Volumes/SublimeText/
  sudo installer -pkg SublimeText.pkg -target "/"
  hdiutil detach /Volumes/SublimeText/
  echo "➜ SpaceVim"
  curl -sLf https://spacevim.org/install.sh | bash
  echo "➜ Spacemacs"
  git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d -b develop
  echo "✓ Dependencies installed!"
}

install() {
  echo "Installing dot-files:"
  echo "➜ ZSH"
  cp zsh/zshrc $HOME/.zshrc
  cp zsh/zsh_aliases $HOME/.zsh_aliases
  echo "➜ Starship"
  cp starship/starship.toml $HOME/.config/starship.toml
  echo "➜ Sublime Text"
  cp sublime/Preferences.sublime-settings $HOME/Library/Application\ Support/Sublime Text 3/Packages/User/Preferences.sublime-settings
  echo "➜ SpaceVim"
  cp spacevim/init.toml $HOME/.SpaceVim.d/init.toml
  echo "➜ Spacemacs"
  cp spacemacs/spacemacs $HOME/.spacemacs
  echo "➜ Git"
  cp git/gitignore_global $HOME/.gitignore_global
  echo "✓ Configurations installed!"
}

if [[ $# -gt 0 ]]; then
  if [[ $1 == "--deps" ]]; then
    deps
  fi
fi
install
