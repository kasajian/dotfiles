if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

if [ -f ~/.bash_private ]; then
        . ~/.bash_private
fi

export PATH="/usr/local/sbin:$PATH"
