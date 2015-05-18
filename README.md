OS X:
    cd
    git clone https://github.com/kasajian/dotfiles.git
    cd dotfiles

Windows:
    Make sure you have vim, git and curl installed.  Try:
        vim --version
        curl --version
        git --version

    If so, do these steps:
        cd /d %USERPROFILE%
        git clone https://github.com/kasajian/dotfiles.git
        cd dotfiles
        makesymlinks.bat
    
    If all went well, continue:
        cd /d %home%
        git clone https://github.com/gmarik/Vundle.vim.git vimfiles/bundle/Vundle.vim
        vim +PluginInstall +qall    
    
