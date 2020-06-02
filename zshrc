# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# otherwise, load the following, mostly inheriting from bash
source ${HOME}/.zsh/settings.zsh
source ${HOME}/.bash/environment.bash
source ${HOME}/.bash/theme.bash
source ${HOME}/.zsh/prompt.zsh
source ${HOME}/.bash/aliases.bash
source ${HOME}/.bash/functions.bash
source ${HOME}/.bash/extras.bash

# if there's a private zsh script, source it
if [[ -f "${HOME}/.zsh/private.zsh" ]]; then source ${HOME}/.zsh/private.zsh; fi
