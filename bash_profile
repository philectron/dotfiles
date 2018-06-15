# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# inherit from .bashrc
if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# stuff for login shell
