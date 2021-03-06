# if not running interactively, don't do anything
[[ -z "${PS1}" ]] && return

# otherwise, load the following
source ${HOME}/.bash/settings.bash
source ${HOME}/.bash/environment.bash
source ${HOME}/.bash/aliases.bash
source ${HOME}/.bash/theme.bash
source ${HOME}/.bash/prompt.bash
source ${HOME}/.bash/functions.bash
source ${HOME}/.bash/extras.bash

# if there's a private bash script, source it
if [[ -f "${HOME}/.bash/private.bash" ]]; then source ${HOME}/.bash/private.bash; fi
