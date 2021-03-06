#!/bin/bash

echo "sudo password is needed"
echo "Please intall below packages:"
echo "\tgit tmux ctags zsh vim"
# 1. Check Prerequisite
git --version
if [ "$?" != "0" ]; then
	echo "Need Install Git"
	exit 1
fi

tmux -V
if [ "$?" != "0" ]; then
	echo "Need Install Tmux"
	exit 1
fi

ctags --version
if [ "$?" != "0" ]; then
	echo "Need Install Ctags"
	exit 1
fi

zsh --version
if [ "$?" != "0" ]; then
	echo "Need Install Zsh"
	exit 1
fi

vim --version | grep "VIM - Vi IMproved"
if [ "$?" != "0" ]; then
	echo "Need Install Vim"
	exit 1
fi

# 2. Install vimrc
git clone https://github.com/bymars/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

# 3. Install oh-my-zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# 4. Install other dotfiles
ln -svf ~/.dotfiles/tmux.conf ~/.tmux.conf
ln -svf ~/.dotfiles/zshrc ~/.zshrc
ln -svf ~/.dotfiles/gitconfig ~/.gitconfig
~/.dotfiles/setbg dark

# 5. Install setbg
mkdir -pv ~/bin
ln -svf ~/.dotfiles/setbg ~/bin/setbg
