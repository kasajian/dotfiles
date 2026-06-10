# Dotfiles

Cross-platform development environment setup. Works on macOS, Linux, Windows, WSL (Ubuntu), and Termux (Android).

---

## Prerequisites

You need **vim**, **git**, and **curl** installed.

```bash
# Check
vim --version
git --version
curl --version
```

---

## Setup

### macOS

```bash
cd ~
git clone https://github.com/kasajian/dotfiles.git
cd dotfiles
bash ./makesymlinks.sh
```

The script symlinks:
- `~/.vimrc` -> `~/dotfiles/.vimrc`
- `~/.bashrc` -> `~/dotfiles/bashrc_macos`

> **Note:** Stock macOS ships Bash 3.2 (last GPLv2 version). Some features (like `globstar`)
> require Bash 4+. Install it and other dev tools via the included Brewfile:
> 
> ```bash
> brew bundle
> ```
> This installs bash, git, vim, fzf, ripgrep, nvm, and more in one command.

Then make sure your `~/.bash_profile` sources `~/.bashrc`:

```bash
echo 'source ~/.bashrc' >> ~/.bash_profile
source ~/.bashrc
```

Bash completions are auto-configured via Homebrew's `bash-completion@2`
(included in the Brewfile). They load automatically.

### Linux (Ubuntu / Debian)

```bash
cd ~
git clone https://github.com/kasajian/dotfiles.git
cd dotfiles
bash ./makesymlinks.sh
```

The script symlinks:
- `~/.vimrc` -> `~/dotfiles/.vimrc`
- `~/.bashrc` -> `~/dotfiles/bashrc_linux`

> **Note:** Native Linux `pbcopy`/`pbpaste` aliases require `xclip`:
> `sudo apt install xclip`.

Open a new terminal or run `source ~/.bashrc`.

Bash completions load automatically via Ubuntu's `/etc/bash.bashrc`.
If not already installed: `sudo apt install bash-completion`.

### Windows Subsystem for Linux (WSL)

Same as Linux above. The `bashrc_linux` auto-detects WSL and sets up `BROWSER=wslview` and `alias open='explorer.exe'`.

> **Prerequisites:** Install `wslu` for browser support and `bash-completion` for tab completions:
> ```bash
> sudo apt install wslu bash-completion
> ```

### Termux (Android)

```bash
cd ~
git clone https://github.com/kasajian/dotfiles.git
cd dotfiles
bash ./makesymlinks.sh
```

Termux-specific notes:
- The scripts use `#!/usr/bin/env bash` for Termux compatibility
- `bashrc_linux` auto-detects Termux and sets up `termux-open` / `termux-open-url`
- Install required packages: `pkg install git curl vim`

### Windows

**Run as Administrator** (required for `mklink`):
```cmd
cd /d %USERPROFILE%
git clone https://github.com/kasajian/dotfiles.git
cd dotfiles
makesymlinks.bat
```

The script symlinks:
- `%USERPROFILE%\.vimrc` -> `%USERPROFILE%\dotfiles\.vimrc`

---

## What's Included

| Area | Description |
|---|---|
| **Vim** | `.vimrc` with sensible defaults, sensible plugin, NetRW file explorer |
| **Bash (shared)** | `bashrc` — universal aliases, history, colors, NVM, git shortcuts, bash completions |
| **Bash (macOS)** | `bashrc_macos` — Homebrew, macOS paths, sources shared bashrc |
| **Bash (Linux)** | `bashrc_linux` — WSL detection, Termux detection, sources shared bashrc |
| **macOS Brewfile** | `Brewfile` — one-command install of all macOS dev tools via Homebrew |
| **Git** | Modular config scripts in `git_config/` for aliases, diff tools, colors |

### Bash Config Structure

```
bashrc          ← shared settings (aliases, history, colors, NVM, etc.)
  ↑
bashrc_macos    ← macOS entry point (Homebrew, sources bashrc)
bashrc_linux    ← Linux/WSL/Termux entry point (OS detection, sources bashrc)
```

---

## Git Config

After setup, run these manually from the `dotfiles` directory:

```bash
bash git_config/core.sh              # colors, aliases, line endings, rebase, etc.
bash git_config/diff_win_config.sh   # Windows diff/merge tools (WinMerge, KDiff3)
bash git_config/username_git_config.sh  # set global user.name / user.email
bash git_config/edit_exe.sh          # set core.editor (Microsoft edit)
```

Review each script before running — they apply `--global` settings.

---

## License

GNU GPL v2 — see [LICENSE](LICENSE).
