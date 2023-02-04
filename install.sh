#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

deps() {
    echo "➜ Installing Brewfile"
    mkdir -p $HOME/.config/brew
    cp brew/Brewfile $HOME/.config/brew/Brewfile
    echo "➜ Installing Brew Packages"
    (cd $HOME/.config/brew && brew bundle)
}

install() {
    echo "Installing dot-files:"
    echo "➜ ZSH"
    cp zsh/zshrc $HOME/.zshrc
    cp zsh/zsh_aliases $HOME/.zsh_aliases
    # echo "➜ Starship"
    # cp starship/starship.toml $HOME/.config/starship.toml
    # echo "➜ Neovim"
    # echo "➜ Emacs"
    # cp -R emacs/ $HOME/.emacs.d
    # echo "➜ Git"
    # cp git/gitignore_global $HOME/.gitignore_global
    echo "✓ Configurations installed!"
}

reload() {
    source $HOME/.zshrc
    echo "✓ Configurations reloaded!"
}

deps
install
reload
