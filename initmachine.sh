#!/bin/bash

# ~/p is installed from here:
#   https://kasajian.visualstudio.com/DefaultCollection/_git/p


# Haven't tested with non-link, but actual, ~/.vim dir existing

chmod +x ~/dotfiles/makesymlinks.sh
~/dotfiles/makesymlinks.sh


if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

