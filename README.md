OS X or Linux

    Make sure you have vim, git and curl installed.  Try:
        vim --version
        curl --version
        git --version

    cd
    git clone https://github.com/kasajian/dotfiles.git
    cd dotfiles
    sh makesymlinks.sh

Windows:

    Make sure you have vim, git and curl installed.  Try:
        vim --version
        curl.exe --version
        git --version

    If so, do these steps:
        cd /d %USERPROFILE%
        git clone https://github.com/kasajian/dotfiles.git
        cd dotfiles
        makesymlinks.bat

