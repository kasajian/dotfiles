@echo off
:: ============================================================
:: makesymlinks.bat — Windows setup script
:: Run from the dotfiles repo directory (as Administrator for symlinks)
:: ============================================================

echo Setting up dotfiles...

:: --- Vim plugin: sensible ---
if not exist "%USERPROFILE%\.vim\pack\tpope\start" mkdir "%USERPROFILE%\.vim\pack\tpope\start"
pushd "%USERPROFILE%\.vim\pack\tpope\start"
if not exist sensible (
    git clone --depth=1 https://tpope.io/vim/sensible.git
) else (
    cd sensible
    git pull
)
popd

:: --- Symlink .vimrc ---
:: Backup existing .vimrc if it's a regular file
if exist "%USERPROFILE%\.vimrc" (
    echo   Backing up existing .vimrc to .vimrc.bak
    move "%USERPROFILE%\.vimrc" "%USERPROFILE%\.vimrc.bak"
)
mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\dotfiles\.vimrc"
echo   ~/.vimrc -^> ~/dotfiles/.vimrc

echo Done.
