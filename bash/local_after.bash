# local config loaded after main config

########################################
# Auto start SSH Agent and add keys
########################################

SSH_ENV=~/.ssh/agent.env

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
  local public_keys=("$(find ~/.ssh -maxdepth 1 -type f -iname "*.pub" \
    -exec basename {} \;)")

  for key in ${public_keys[@]}; do
    # get the key's name without extension
    local key_name="${key%.*}"

    # ensure there exists a readable private key with the same name
    if [[ -f ~/.ssh/"${key_name}" ]]; then
      ssh-add ~/.ssh/"${key_name}" 2> /dev/null
    fi
  done
}

agent_load_env

# 0 = running with keys, 1 = running without keys, 2 = not running
agent_run_state=$(ssh-add -l > /dev/null 2>&1; echo $?)

if [[ ! "${SSH_AUTH_SOCK}" ]] || [[ "${agent_run_state}" -eq 2 ]]; then
  agent_start && agent_add_keys
else
  agent_add_keys
fi

unset SSH_ENV
unset agent_run_state
