# extra and custom configurations
# ~/.bashrc source this file

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# disable Ctrl-S = hang terminal
stty -ixon

# set 755 as default permission (user: rwx, group: r-x, public: r-x)
umask 0022
