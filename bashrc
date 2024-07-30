# If not running interactively, don't do anything.
[[ -z "${PS1}" ]] && return

# Otherwise, load the following in order.
source ${HOME}/.bash/core.bash
source ${HOME}/.bash/functions.bash
source ${HOME}/.bash/theme.bash
source ${HOME}/.bash/prompt.bash
source ${HOME}/.bash/aliases.bash
source ${HOME}/.bash/environment.bash
source ${HOME}/.bash/extras.bash
