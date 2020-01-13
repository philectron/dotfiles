# extra and custom configurations

# make less more friendly for non-text input files, see lesspipe(1)
[ -x '/usr/bin/lesspipe' ] && eval "$(SHELL=/bin/sh lesspipe)"

# disable Ctrl-S = hang terminal
stty -ixon

# set 755 as default permission (user: rwx, group: r-x, public: r-x)
umask 0022

########################################
# Auto start SSH Agent and add keys
########################################

SSH_ENV=${HOME}/.ssh/agent.env

agent_load_env() {
  test -f "${SSH_ENV}" && . "${SSH_ENV}" > /dev/null
}

agent_start() {
  ssh-agent > "${SSH_ENV}" && chmod 700 "${SSH_ENV}"
  . "${SSH_ENV}" > /dev/null
}

# for now only works for  KEY  and  KEY.pub  pairs
agent_add_keys() {
  # find all  .pub  files in  ~/.ssh  directory
  local public_keys=($(find ${HOME}/.ssh -maxdepth 1 -type f -iname "*.pub" -exec basename {} \;))

  for key in ${public_keys[@]}; do
    # get the key's name without extension
    local key_name="${key%.*}"

    # ensure there exists a readable private key with the same name
    if [ -f ${HOME}/.ssh/"${key_name}" ]; then
      ssh-add ${HOME}/.ssh/"${key_name}" 2> /dev/null
    fi
  done
}

agent_load_env

# 0 = running with keys, 1 = running without keys, 2 = not running
agent_run_state=$(ssh-add -l > /dev/null 2>&1; echo $?)

if [ ! "${SSH_AUTH_SOCK}" ] || [ "${agent_run_state}" -eq 2 ]; then
  agent_start && agent_add_keys
else
  agent_add_keys
fi

unset SSH_ENV
unset agent_run_state
