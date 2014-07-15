#!/bin/bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# =====================================
# Installation Helpers
# =====================================
dotfiles_install() {
	FILE=$1
	rm -rf ~/.$FILE
	ln -s $DIR/$FILE ~/.$FILE
}

dotfiles_backup() {
	FILE=$1
	if ! [ -h ~/.$FILE ]; then
		[ -e ~/.$FILE.local ] && mv ~/.$FILE.local ~/.$FILE.local.bak
		[ -e ~/.$FILE ] && mv ~/.$FILE ~/.$FILE.local
	fi
}

dotfiles_backup_shallow() {
	FILE=$1
	rm -rf ~/.$FILE.bak
	[ -e ~/.$FILE ] && mv ~/.$FILE ~/.$FILE.bak
}

# =====================================
# Setup ZSH
# =====================================
dotfiles_backup zshrc
rm -f ~/.zshrc
ln -s $DIR/shellrc ~/.zshrc


# =====================================
# Setup Bash
# =====================================
dotfiles_backup bashrc
rm -f ~/.bashrc
ln -s $DIR/shellrc ~/.bashrc


# =====================================
# Setup VIM
# =====================================
dotfiles_backup vimrc
dotfiles_install vimrc
dotfiles_backup gvimrc
dotfiles_install gvimrc
dotfiles_install vim

# Run vundle installer
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall


# =====================================
# Setup git
# =====================================
dotfiles_install gitconfig
dotfiles_install gitignore
