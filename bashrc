# if not running interactively, don't do anything
[ -z "$PS1" ] && return

# otherwise, load the following
source ~/.bash/local_before.bash
source ~/.bash/settings.bash
source ~/.bash/environment.bash
source ~/.bash/aliases.bash
source ~/.bash/prompt.bash
source ~/.bash/theme.bash
source ~/.bash/functions.bash
source ~/.bash/extras.bash
source ~/.bash/local_after.bash
