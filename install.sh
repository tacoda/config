#!/usr/bin/env bash

# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Source nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# TODO: Enable experimental-features and flakes

# Install packages
nix profile install \
	"nixpkgs#neovim" \
	"nixpkgs#tmux" \
	"nixpkgs#emacs" \
	"nixpkgs#fzf" \
	"nixpkgs#git" \
	"nixpkgs#kakoune" \
	"nixpkgs#ripgrep" \
	"nixpkgs#direnv" \
	"nixpkgs#zsh"

# Add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# TODO: Add zsh plugins

# TODO: Neovim configuration

# Install doom
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
$HOME/.emacs.d/bin/doom install
