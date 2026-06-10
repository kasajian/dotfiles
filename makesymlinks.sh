#!/usr/bin/env bash
# ============================================================
# makesymlinks.sh — macOS / Linux / WSL / Termux setup script
# Run from the dotfiles repo directory
# ============================================================

set -e

# Detect the actual dotfiles directory (in case not at ~/dotfiles)
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "Setting up dotfiles from: $DOTFILES_DIR"

# --- Vim plugin: sensible ---
mkdir -p ~/.vim/pack/tpope/start
pushd ~/.vim/pack/tpope/start > /dev/null
if [ ! -d sensible ]; then
    git clone --depth=1 https://tpope.io/vim/sensible.git
else
    cd sensible
    git pull
fi
popd > /dev/null

# --- Symlink .vimrc ---
if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; then
    echo "  Backing up existing ~/.vimrc to ~/.vimrc.bak"
    mv ~/.vimrc ~/.vimrc.bak
fi
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc
echo "  ~/.vimrc -> $DOTFILES_DIR/.vimrc"

# --- Symlink bashrc (macOS) ---
if [ "$(uname)" = "Darwin" ]; then
    if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
        echo "  Backing up existing ~/.bashrc to ~/.bashrc.bak"
        mv ~/.bashrc ~/.bashrc.bak
    fi
    ln -sf "$DOTFILES_DIR/bashrc_macos" ~/.bashrc
    echo "  ~/.bashrc -> $DOTFILES_DIR/bashrc_macos"
    echo "  (Add 'source ~/.bashrc' to ~/.bash_profile if not already present)"
fi

# --- Symlink bashrc (Linux) ---
if [ "$(uname)" = "Linux" ]; then
    if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; then
        echo "  Backing up existing ~/.bashrc to ~/.bashrc.bak"
        mv ~/.bashrc ~/.bashrc.bak
    fi
    ln -sf "$DOTFILES_DIR/bashrc_linux" ~/.bashrc
    echo "  ~/.bashrc -> $DOTFILES_DIR/bashrc_linux"
fi

echo "Done."
