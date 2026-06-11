#!/usr/bin/env bash
# ============================================================
# bootstrap.sh — One-command dotfiles setup
# Detects OS, checks prerequisites, symlinks everything
# Idempotent: safe to run repeatedly
# ============================================================

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
OS="$(uname -s)"

echo "==> Dotfiles bootstrap"
echo "    OS:      $OS"
echo "    Source:  $DOTFILES_DIR"

# --- Prerequisite checks (actionable one-liners only) ---
check_cmd() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "    MISSING: $1 — install with: $2"
        MISSING=1
    fi
}

check_cmd git  "sudo apt install git   # or: brew install git   or: pkg install git"

check_optional() {
    if ! command -v "$1" >/dev/null 2>&1; then
        echo "    Note: $1 not found — $2"
    fi
}

check_optional vim "sudo apt install vim   # or: brew install vim   or: pkg install vim"

if [ "$OS" = "Darwin" ]; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "    MISSING: Homebrew — install: /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        MISSING=1
    else
        echo "    Tip: run 'brew bundle' in $DOTFILES_DIR to install all dev tools"
    fi
elif grep -qi microsoft /proc/version 2>/dev/null; then
    check_optional wslview "sudo apt install wslu"
fi

if [ "${MISSING:-0}" = 1 ]; then
    echo "    Install missing packages above, then re-run: bash $DOTFILES_DIR/bootstrap.sh"
    exit 1
fi

echo ""

# --- Vim plugin: sensible ---
echo "    vim-sensible plugin..."
mkdir -p ~/.vim/pack/tpope/start
pushd ~/.vim/pack/tpope/start > /dev/null
if [ ! -d sensible ]; then
    git clone --depth=1 https://tpope.io/vim/sensible.git
else
    cd sensible && git pull --ff-only 2>/dev/null || true
fi
popd > /dev/null

# --- Symlink .vimrc ---
rm -f ~/.vimrc
ln -sf "$DOTFILES_DIR/.vimrc" ~/.vimrc

# --- Symlink bashrc ---
if [ "$OS" = "Darwin" ]; then
    BASHRC_SRC="$DOTFILES_DIR/bashrc_macos"
elif [ "$OS" = "Linux" ]; then
    BASHRC_SRC="$DOTFILES_DIR/bashrc_linux"
fi

if [ -n "$BASHRC_SRC" ]; then
    rm -f ~/.bashrc
    ln -sf "$BASHRC_SRC" ~/.bashrc
fi

# --- Summary ---
echo ""
echo "==> Done: ~/.vimrc, ~/.bashrc, vim-sensible"
if [ "$OS" = "Darwin" ]; then
    echo "    Run: echo 'source ~/.bashrc' >> ~/.bash_profile && source ~/.bashrc"
else
    echo "    Reload: source ~/.bashrc"
fi
echo ""
echo "    Next steps:"
echo "      git config:   bash $DOTFILES_DIR/git_config/core.sh"
echo "      git config:   bash $DOTFILES_DIR/git_config/username_git_config.sh"
[ "$OS" = "Darwin" ] && echo "      brew bundle:  (in $DOTFILES_DIR — installs all dev tools)"
