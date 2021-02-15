#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

deps() {
  echo "Installing dependencies:"
  echo "➜ docker neovim"
  dnf install -y docker neovim python3-neovim git make automake gcc gcc-c++ kernel-devel
  echo "➜ ohmyzsh"
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # echo "➜ bat, chruby, elixir, emacs-plus, exa, fd, fzf, gcc, ripgrep, neovim, node, starship"
  # bat, exa, fd, fzf, ripgrep, starship
  # fish or zsh
  echo "➜ SpaceVim"
  curl -sLf https://spacevim.org/install.sh | bash
  echo "✓ Dependencies installed!"
}

deps
