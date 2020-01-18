# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

if [[ -f "${HOME}/.bashrc" ]]; then
  source ${HOME}/.zsh/settings.zsh
  source ${HOME}/.shell/environment.sh
  source ${HOME}/.zsh/private.zsh
  source ${HOME}/.zsh/prompt.zsh
  source ${HOME}/.shell/aliases.sh
  source ${HOME}/.shell/theme.sh
  source ${HOME}/.shell/functions.sh
  source ${HOME}/.shell/extras.sh
fi
