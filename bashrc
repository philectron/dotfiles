# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# otherwise, load the following
source ${HOME}/.shell/local_before.sh
source ${HOME}/.shell/settings.sh
source ${HOME}/.shell/environment.sh
source ${HOME}/.shell/private.sh
source ${HOME}/.shell/aliases.sh
source ${HOME}/.shell/prompt.sh
source ${HOME}/.shell/theme.sh
source ${HOME}/.shell/functions.sh
source ${HOME}/.shell/extras.sh
source ${HOME}/.shell/local_after.sh
