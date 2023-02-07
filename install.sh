#!/usr/bin/env bash

main() {
	prompt_user "install_nix" && install_nix
	prompt_user "source_nix" && source_nix
	prompt_user "enable_experimental_features" && enable_experimental_features
	prompt_user "install_packages" && install_packages
	prompt_user "set_zsh_as_shell" && set_zsh_as_shell
	prompt_user "add_zsh_config" && add_zsh_config
	prompt_user "copy_custom_scripts" && copy_custom_scripts
	# prompt_user "add_neovim_config" && add_neovim_config
	prompt_user "install_doom" && install_doom
	# prompt_user "add_emacs_config" && add_emacs_config
	# prompt_user "add_git_config" && add_git_config
	prompt_user "source_zsh" && source_zsh
}

prompt_user() {
	echo -n "[$1] >> Proceed? [y/n]: "
	read -r ans
	if [[ "$ans" == "y" ]]; then
		return 0
	else
		return 1
	fi
}

install_nix() {
	sh <(curl -L https://nixos.org/nix/install) --daemon
}

source_nix() {
	source $HOME/.nix-profile/etc/profile.d/nix.sh
}

enable_experimental_features() {
	echo "experimental-features = nix-command flakes" >> $HOME/.config/nix/nix.conf
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
		"nixpkgs#watchexec" \
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
	cp -R util $HOME/util
	chmod a+x $HOME/util/*
}

# add_neovim_config() {
	# TODO
# }

install_doom() {
	git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.emacs.d
	ln -s $HOME/.emacs.d/bin/doom $HOME/bin/doom
	$HOME/bin/doom install
}

# add_emacs_config() {
	# TODO
# }

# add_git_config() {
	# TODO
# }

source_zsh() {
	source $HOME/.zshrc
}

main
