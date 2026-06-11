@echo off
:: ============================================================
:: bootstrap.bat — Windows dotfiles setup
:: Run as Administrator (required for mklink)
:: ============================================================

:: --- Admin check ---
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: This script requires Administrator privileges (for mklink).
    echo Right-click Command Prompt ^> Run as Administrator, then re-run.
    exit /b 1
)

echo ==^> Dotfiles bootstrap

:: --- Vim plugin: sensible ---
echo     vim-sensible plugin...
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
:: Remove any existing .vimrc (file or symlink) so mklink can recreate it
dir /a "%USERPROFILE%\.vimrc" >nul 2>&1
if not errorlevel 1 del /f /q "%USERPROFILE%\.vimrc"
mklink "%USERPROFILE%\.vimrc" "%USERPROFILE%\dotfiles\.vimrc" >nul


echo ==^> Done: .vimrc, vim-sensible
