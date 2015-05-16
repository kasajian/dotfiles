#!/bin/bash

chmod +x ~/dotfiles/makesymlinks.sh

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

