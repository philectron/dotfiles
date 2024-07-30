# If not running interactively, don't do anything.
[[ -z "${PS1}" ]] && return

# Otherwise, load .bashrc if it exists.
[[ -f ${HOME}/.bashrc ]] && source ${HOME}/.bashrc

# Stuff for login shell below.
