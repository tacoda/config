deps:
	echo "➜ Installing dependencies:"
	mkdir -p $HOME/.config/brew
	cp brew/Brewfile $HOME/.config/brew/Brewfile
	brew update && brew upgrade
	(cd $HOME/.config/brew && brew bundle)
	echo "✓ Dependencies installed!"

install:
	echo "Installing configurations:"
	echo "➜ ZSH"
	cp zsh/zshrc $HOME/.zshrc
	cp zsh/zsh_aliases $HOME/.zsh_aliases
	echo "➜ Custom Scripts"
	cp -R bin/ $HOME/bin
	cp -R scripts/ $HOME/scripts
	echo "✓ Configurations installed!"
