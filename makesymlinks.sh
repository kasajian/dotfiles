#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

pdir=~/p                          # private directory
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_aliases bash_profile gitignore_global" # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv -v -f ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s -F $dir/$file ~/.$file
done

echo "Creating symlink to $dir/vim/ at ~/.vim"
if [ -h ~/.vim ]; then
    rm -f ~/.vim
fi
ln -s -F $dir/vim/ ~/.vim

if [ -f $pdir/bash_private ]; then
    echo "creating symlink to $pdir/bash_private at ~/.bash_private"
    if [ -h ~/.vim ]; then
        rm -f ~/.bash_private
    fi
    ln -s -f $pdir/bash_private ~/.bash_private
fi

# 2018/6/13 tried on ubuntu (win10)
# cd
# ln -s ~/dotfiles/vim vimfiles
# ln ~/dotfiles/vim/vimrc .vimrc
# ln -s ~/dotfiles/vim .vim
