#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

# deps() {
    # echo "Installing dependencies:"
    # echo "➜ docker neovim emacs"
    # dnf install -y docker neovim python3-neovim git make automake gcc gcc-c++ kernel-devel
    # echo "➜ bat, chruby, elixir, emacs-plus, exa, fd, fzf, gcc, ripgrep, neovim, node, starship"
    # bat, exa, fd, fzf, ripgrep, starship
    # echo "✓ Dependencies installed!"
# }
# deps

install() {
    echo "Installing dot-files:"
    echo "➜ ZSH"
    cp zsh/zshrc $HOME/.zshrc
    cp zsh/zsh_aliases $HOME/.zsh_aliases
    # echo "➜ Starship"
    # cp starship/starship.toml $HOME/.config/starship.toml
    # echo "➜ Emacs"
    # cp -R emacs/ $HOME/.emacs.d
    # echo "➜ Git"
    # cp git/gitignore_global $HOME/.gitignore_global
    echo "✓ Configurations installed!"
}

install
