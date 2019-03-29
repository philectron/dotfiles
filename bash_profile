# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

if [[ -f ~/.bashrc ]]; then
  # inherit from .bashrc
  source ~/.bashrc
fi

# stuff for login shell
