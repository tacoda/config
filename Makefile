deps:
	echo "➜ Installing Brewfile"
	mkdir -p $HOME/.config/brew
	cp brew/Brewfile $HOME/.config/brew/Brewfile
	echo "➜ Installing Brew Packages"
	(cd $HOME/.config/brew && brew bundle)

install:
	echo "Installing dot-files:"
	echo "➜ ZSH"
	cp zsh/zshrc $HOME/.zshrc
	cp zsh/zsh_aliases $HOME/.zsh_aliases
	echo "➜ Custom Scripts"
	cp -R bin/ $HOME/bin
	cp -R scripts/ $HOME/scripts
	echo "✓ Configurations installed!"
