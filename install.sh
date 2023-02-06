#!/usr/bin/env bash

# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Source nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# TODO: Enable experimental-features and flakes

# Install packages
nix profile install \
	"nixpkgs#bat" \
	"nixpkgs#direnv" \
	"nixpkgs#emacs" \
	"nixpkgs#fzf" \
	"nixpkgs#grex" \
	"nixpkgs#git" \
	"nixpkgs#hugo" \
	"nixpkgs#jq" \
	"nixpkgs#kakoune" \
	"nixpkgs#neovim" \
	"nixpkgs#ripgrep" \
	"nixpkgs#tmux" \
	"nixpkgs#zsh"

# brew "asdf"
# brew "bat"
# brew "delta"
# brew "dust"
# brew "fd"
# brew "fzf"
# brew "grex"
# brew "http-server"
# brew "hugo"
# brew "jq"
# brew "lsd"
# brew "kakoune"
# brew "procs"
# brew "ripgrep"
# brew "sd"
# brew "starship"
# brew "tealdeer"
# brew "tokei"
# brew "xsv"
# brew "yq"
# brew "zellij"

# Add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# TODO: Add zsh plugins

# TODO: Neovim configuration

# Install doom
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
$HOME/.emacs.d/bin/doom install
