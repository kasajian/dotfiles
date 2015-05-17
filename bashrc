# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

if [ -f ~/.bash_private ]; then
        . ~/.bash_private
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
bind '"\eOA": history-search-backward'
bind '"\eOB": history-search-forward'

export PATH="/usr/local/sbin:$PATH"
export EDITOR='vim';
stty -ixon

NODE_REPL_HISTORY_FILE=~/.node_history;
NODE_REPL_HISTORY_SIZE='32768';
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
export HISTCONTROL='ignoreboth';
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';
export LESS_TERMCAP_md="${yellow}";
export GREP_OPTIONS='--color=auto';

