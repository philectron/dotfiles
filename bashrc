# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# otherwise, load the following
source ${HOME}/.bash/local_before.bash
source ${HOME}/.bash/settings.bash
source ${HOME}/.shell/environment.sh
source ${HOME}/.bash/private.bash
source ${HOME}/.shell/aliases.sh
source ${HOME}/.bash/prompt.bash
source ${HOME}/.shell/theme.sh
source ${HOME}/.shell/functions.sh
source ${HOME}/.shell/extras.sh
source ${HOME}/.bash/local_after.bash
