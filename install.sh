#!/usr/bin/env bash
set -euo pipefail
IFS=$'\n\t'

deps() {
    echo "Installing dependencies:"
    # echo "➜ docker neovim"
    # dnf install -y docker neovim python3-neovim git make automake gcc gcc-c++ kernel-devel
    echo "➜ ohmyzsh"
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    # echo "➜ bat, chruby, elixir, emacs-plus, exa, fd, fzf, gcc, ripgrep, neovim, node, starship"
    # bat, exa, fd, fzf, ripgrep, starship
    #  zsh
    # echo "➜ SpaceVim"
    # curl -sLf https://spacevim.org/install.sh | bash
    echo "✓ Dependencies installed!"
}

install() {
    echo "Installing dot-files:"
    # echo "➜ ZSH"
    # cp zsh/zshrc $HOME/.zshrc
    # cp zsh/zsh_aliases $HOME/.zsh_aliases
    # echo "➜ Starship"
    # cp starship/starship.toml $HOME/.config/starship.toml
    # echo "➜ Spacemacs"
    # cp spacemacs/spacemacs $HOME/.spacemacs
    echo "➜ Emacs"
    cp -R emacs/ $HOME/.emacs.d
    # echo "➜ Git"
    # cp git/gitignore_global $HOME/.gitignore_global
    echo "✓ Configurations installed!"
}

# deps
install
