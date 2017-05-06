#!/bin/bash

print_not_exit() {
    echo "file or folder not exist'$1'"
}

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    print_not_exit ~/.vim/bundle/Vundle.vim
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
fi

if [ ! -e ~/.vimrc ]; then
    print_not_exit ~/.vimrc
    cp .vimrc ~/.vimrc
fi

if [ ! -e ~/.bashrc ]; then
    print_not_exit ~/.bashrc
    cp .bashrc ~/.bashrc
fi

if [ ! -e ~/.gitconfig ]; then
    print_not_exit ~/.gitconfig
    cp .gitconfig ~/.gitconfig
fi

echo $0 done!
