# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

if [[ -r ~/.bashrc ]]; then
  # inherit from .bashrc
  source ~/.bashrc

  # # clear screen
  # clear
fi

# stuff for login shell
