# ============================================================
# Shared bashrc — sourced by platform-specific rc files
# Works on: macOS, Linux, WSL (Ubuntu), Termux
# ============================================================

# --- Shell Options ---
shopt -s histappend              # Append to history, don't overwrite
shopt -s checkwinsize            # Update LINES/COLUMNS after each command
shopt -s cdspell                 # Auto-correct minor typos in cd
shopt -s globstar 2>/dev/null    # Enable ** recursive globbing (bash 4+)

# --- History ---
export HISTSIZE=32768
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'  # Ignore duplicates and lines starting with space
export HISTTIMEFORMAT='%Y-%m-%d %H:%M:%S  '

# --- Editor ---
export EDITOR='vim'
export VISUAL='vim'

# --- PATH ---
export PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# --- Fix Ctrl-S (XON/XOFF flow control) ---
stty -ixon 2>/dev/null

# --- History Search with Arrow Keys ---
bind '"\e[A": history-search-backward' 2>/dev/null
bind '"\e[B": history-search-forward'  2>/dev/null
bind '"\eOA": history-search-backward' 2>/dev/null
bind '"\eOB": history-search-forward'  2>/dev/null

# --- Language / Locale ---
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8' 2>/dev/null || export LC_ALL='C.UTF-8'

# --- Color Support ---
if [ -x /usr/bin/dircolors ] || [ -x /bin/dircolors ]; then
    eval "$(dircolors -b)"
fi
export CLICOLOR=1
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'

# --- ls Aliases (universal) ---
alias ls='ls --color=auto 2>/dev/null || ls -G'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'

# --- grep Aliases ---
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# --- Git Aliases ---
alias gs='git status'
alias gl='git log --oneline --graph --all'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'
alias gp='git pull'

# --- Less Colors ---
export LESS='-R'
export LESS_TERMCAP_mb=$'\e[1;31m'
export LESS_TERMCAP_md=$'\e[1;33m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[1;44;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;32m'

# --- Node.js ---
export NODE_REPL_HISTORY_FILE="$HOME/.node_history"
export NODE_REPL_HISTORY_SIZE='32768'

# --- NVM (Node Version Manager) ---
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# --- Source private/local overrides (secrets, machine-specific) ---
if [ -f ~/.bash_private ]; then
    . ~/.bash_private
fi
