# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

if [[ -f ${HOME}/.bashrc ]]; then
  # inherit from .bashrc
  source ${HOME}/.bashrc
fi

# stuff for login shell
