#!/usr/bin/env bash

# Install nix
sh <(curl -L https://nixos.org/nix/install) --daemon

# Source nix
source $HOME/.nix-profile/etc/profile.d/nix.sh

# TODO: Enable experimental-features and flakes

# Install packages
nix profile install \
	"nixpkgs#bat" \
	"nixpkgs#delta" \
	"nixpkgs#direnv" \
	"nixpkgs#emacs" \
	"nixpkgs#fd" \
	"nixpkgs#fzf" \
	"nixpkgs#grex" \
	"nixpkgs#git" \
	"nixpkgs#hugo" \
	"nixpkgs#jq" \
	"nixpkgs#lsd" \
	"nixpkgs#kakoune" \
	"nixpkgs#neovim" \
	"nixpkgs#procs" \
	"nixpkgs#ripgrep" \
	"nixpkgs#sd" \
	"nixpkgs#tldr" \
	"nixpkgs#tmux" \
	"nixpkgs#tokei" \
	"nixpkgs#xsv" \
	"nixpkgs#yq" \
	"nixpkgs#zellij" \
	"nixpkgs#zsh"

# Add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# Use zsh as default shell
sudo chsh -s $(which zsh) $USER

# TODO: Add zsh plugins
cp zsh/zshrc $HOME/.zshrc
cp zsh/zsh_aliases $HOME/.zsh_aliases

# Copy binaries
cp -R bin $HOME/bin
cp -R scripts $HOME/scripts

# TODO: Neovim configuration

# Install doom
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
$HOME/.emacs.d/bin/doom install
