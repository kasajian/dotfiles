# Dotfiles

One-command dev environment setup. macOS, Linux, WSL, Termux, Windows.

## macOS / Linux / WSL / Termux

```bash
git clone https://github.com/kasajian/dotfiles.git ~/dotfiles && bash ~/dotfiles/bootstrap.sh
```

## Windows (PowerShell as Administrator)

```powershell
# Run PowerShell as Administrator first, then:
git clone https://github.com/kasajian/dotfiles.git $env:USERPROFILE\dotfiles; & $env:USERPROFILE\dotfiles\bootstrap.bat
```

---

<details>
<summary>What's inside?</summary>

| Area | File |
|---|---|
| Vim | `.vimrc`, vim-sensible plugin |
| Bash (shared) | `bashrc` — aliases, history, colors, NVM, fzf, git completions |
| Bash (macOS) | `bashrc_macos` — Homebrew + bash-completion@2 |
| Bash (Linux) | `bashrc_linux` — WSL/Termux detection |
| macOS Brewfile | `Brewfile` — one-shot dev tool install |
| Git config | `git_config/` — `core.sh`, `diff_win_config.sh`, `edit_exe.sh`, `username_git_config.sh` |

</details>

## License

GNU GPL v2 — see [LICENSE](LICENSE).
