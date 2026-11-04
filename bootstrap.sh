#!/usr/bin/env bash
# ============================================================
# bootstrap.sh — One-command dotfiles setup
# Detects OS, checks prerequisites, links .vimrc, wires ~/.bashrc to source dotfiles
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
elif [ "$OS" = "Linux" ] && [ -z "${TERMUX_VERSION:-}" ] && command -v apt-get >/dev/null 2>&1; then
    APT_PKGS=(git curl wget vim jq ripgrep gh unzip bash-completion)
    if grep -qi microsoft /proc/version 2>/dev/null; then
        APT_PKGS+=(wslu)
    fi
    MISSING_APT=()
    for pkg in "${APT_PKGS[@]}"; do
        if ! dpkg -s "$pkg" >/dev/null 2>&1; then
            MISSING_APT+=("$pkg")
        fi
    done
    if [ "${#MISSING_APT[@]}" -gt 0 ]; then
        echo "    Installing Linux base packages: ${MISSING_APT[*]}..."
        sudo apt-get update -y
        sudo apt-get install -y "${MISSING_APT[@]}"
    fi
    if ! locale -a 2>/dev/null | grep -qi '^en_US\.utf-\?8$' && command -v locale-gen >/dev/null 2>&1; then
        echo "    Generating en_US.UTF-8 locale..."
        sudo locale-gen en_US.UTF-8
    fi
fi

if [ "${MISSING:-0}" = 1 ]; then
    echo "    Install missing packages above, then re-run: bash $DOTFILES_DIR/bootstrap.sh"
    exit 1
fi

# --- Node.js >= 24 via NVM (Linux / macOS when node >= 24 is not already present) ---
if [ -z "${TERMUX_VERSION:-}" ] && { [ "$OS" = "Linux" ] || [ "$OS" = "Darwin" ]; }; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    NODE_MAJOR=0
    if command -v node >/dev/null 2>&1; then
        NODE_MAJOR="$(node -p 'process.versions.node.split(".")[0]' 2>/dev/null || echo 0)"
    fi
    if [ "${NODE_MAJOR:-0}" -lt 24 ]; then
        echo "    Installing NVM and Node.js 24..."
        if [ ! -s "$NVM_DIR/nvm.sh" ]; then
            PROFILE=/dev/null bash -c 'curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash'
        fi
        \. "$NVM_DIR/nvm.sh"
        nvm install 24
        nvm alias default 24
    fi
    if command -v node >/dev/null 2>&1; then
        NODE_BIN_DIR="$(dirname "$(command -v node)")"
        mkdir -p "$HOME/.local/bin"
        for bin_name in node npm npx corepack; do
            if [ -x "$NODE_BIN_DIR/$bin_name" ]; then
                ln -sf "$NODE_BIN_DIR/$bin_name" "$HOME/.local/bin/$bin_name"
            fi
        done
    fi
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

# --- Local ~/.bashrc / ~/.zshrc (real files, never symlinks) ---
# ~/.bashrc and ~/.zshrc are machine-local. They only need to source the dotfiles entry point.
# Existing local content is preserved; the source line is added once.
ensure_local_rc_sources_dotfiles() {
    local rc_file="$1"
    local entry_name="$2"
    if [ -L "$rc_file" ]; then
        rm -f "$rc_file"
    fi
    if ! grep -qs "dotfiles/$entry_name" "$rc_file" 2>/dev/null; then
        {
            echo "# Shared dotfiles (machine-specific settings go below this line)"
            echo "[ -f ~/dotfiles/$entry_name ] && . ~/dotfiles/$entry_name"
            echo ""
        } > "${rc_file}.new"
        [ -f "$rc_file" ] && cat "$rc_file" >> "${rc_file}.new"
        mv "${rc_file}.new" "$rc_file"
    fi
}

if [ "$OS" = "Darwin" ]; then
    BASHRC_NAME="bashrc_macos"
    ensure_local_rc_sources_dotfiles "$HOME/.bashrc" "$BASHRC_NAME"
    ensure_local_rc_sources_dotfiles "$HOME/.zshrc" "$BASHRC_NAME"
elif [ "$OS" = "Linux" ]; then
    BASHRC_NAME="bashrc_linux"
    ensure_local_rc_sources_dotfiles "$HOME/.bashrc" "$BASHRC_NAME"
fi

# --- Git config ---
if [ -f "$DOTFILES_DIR/git_config/core.sh" ]; then
    echo "    Applying git_config/core.sh..."
    bash "$DOTFILES_DIR/git_config/core.sh"
fi
if [ -f "$DOTFILES_DIR/git_config/username_git_config.sh" ] && [ -z "$(git config --global user.name 2>/dev/null || true)" ]; then
    echo "    Applying git_config/username_git_config.sh..."
    bash "$DOTFILES_DIR/git_config/username_git_config.sh"
fi

# --- Summary ---
echo ""
echo "==> Done: ~/.vimrc, ~/.bashrc, vim-sensible, git config"
if [ "$OS" = "Darwin" ]; then
    echo "    Reload: source ~/.zshrc   (or: source ~/.bashrc)"
else
    echo "    Reload: source ~/.bashrc"
fi
[ "$OS" = "Darwin" ] && echo "    Tip: run 'brew bundle' in $DOTFILES_DIR to install all dev tools" || true
