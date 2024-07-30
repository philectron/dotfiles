# Extra Settings

# Auto-launch SSH Agent.
ssh_agent_env="${HOME}/.ssh/agent.env"

agent_load_env() {
  [[ -f "${ssh_agent_env}" ]] && source "${ssh_agent_env}" >| /dev/null
}

agent_start() {
  (umask 077; ssh-agent >| "${ssh_agent_env}")
  source "${ssh_agent_env}" >| /dev/null
}

# Add KEY and KEY.pub pairs to agent.
agent_add_keys() {
  # Find all .pub files in SSH directory.
  local public_keys=()
  while read -r line; do
    line="${line##*/}"
    line="${line%.*}"
    public_keys+=( "${line}" )
  done < <("ls" "${HOME}"/.ssh/*.pub)

  for key in "${public_keys[@]}"; do
    # Ensure there exists a readable private key with the same name.
    if [[ -f "${HOME}"/.ssh/"${key}" ]]; then
      ssh-add "${HOME}"/.ssh/"${key}" 2> /dev/null
    fi
  done
}

agent_load_env

# agent_run_state: 0=agent running w/ key; 1=agent w/o key; 2=agent not running
agent_run_state="$(ssh-add -l >| /dev/null 2>&1; echo $?)"

if [[ -z "${SSH_AUTH_SOCK}" ]] || [[ ${agent_run_state} -eq 2 ]]; then
  agent_start && agent_add_keys
elif [[ -n "${SSH_AUTH_SOCK}" ]] && [[ ${agent_run_state} -eq 1 ]]; then
  agent_add_keys
fi

unset ssh_agent_env
