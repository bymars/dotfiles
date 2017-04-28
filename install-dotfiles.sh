#!/bin/bash

# 1. Check Prerequisite
git --version
if [ "$?" != "0" ]; then
	echo "Need Install Git"
fi

tmux -V
if [ "$?" != "0" ]; then
	echo "Need Install Tmux"
fi

ctags --version
if [ "$?" != "0" ]; then
	echo "Need Install Ctags"
fi

zsh --version
if [ "$?" != "0" ]; then
	echo "Need Install Zsh"
fi

vim --version | grep "VIM - Vi IMproved"
if [ "$?" != "0" ]; then
	echo "Need Install Vim"
fi

# 2. Install vimrc
git clone https://github.com/bymars/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# 3. Install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# 4. Install other dotfiles
ln -svf ~/.dotfiles/dircolors.ansi-dark ~/.dircolors
ln -svf ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -svf ~/.dotfiles/.tmuxcolors-dark.conf ~/.tmuxcolors.conf
ln -svf ~/.dotfiles/.zshrc ~/.zshrc

