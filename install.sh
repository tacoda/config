#!/usr/bin/env bash

main() {
	install_nix
	source_nix
	enable_experimental_features
	install_packages
	set_zsh_as_shell
	add_zsh_config
	copy_custom_scripts
	add_neovim_config
	install_doom
	add_emacs_config
}

install_nix() {
	sh <(curl -L https://nixos.org/nix/install) --daemon
}

source_nix() {
	source $HOME/.nix-profile/etc/profile.d/nix.sh
}

enable_experimental_features() {
	echo "experimental-features = nix-command flakes" >> $HOME/.config/nix/nix.conf
	# NOTE: Do I need to source again?
}

install_packages() {
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
}

set_zsh_as_shell() {
	command -v zsh | sudo tee -a /etc/shells
	sudo chsh -s $(which zsh) $USER
}

add_zsh_config() {
	cp zsh/zshrc $HOME/.zshrc
	cp zsh/zsh_aliases $HOME/.zsh_aliases
}

copy_custom_scripts() {
	cp -R bin $HOME/bin
	chmod a+x $HOME/bin/*
	cp -R scripts $HOME/scripts
	chmod a+x $HOME/scripts/*
}

add_neovim_config() {
	# TODO
}

install_doom() {
	git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
	ln -s $HOME/.emacs.d/bin/doom $HOME/bin/doom
	$HOME/bin/doom install
}

add_emacs_config() {
	# TODO
}

main
