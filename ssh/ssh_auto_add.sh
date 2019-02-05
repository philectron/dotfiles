#!/bin/bash

# find all  .pub  files in  ~/.ssh  directory
SSH_PUBLIC_KEYS=($(find ~/.ssh -maxdepth 1 -type f -iname '*.pub' \
  -exec basename {} \; 2>/dev/null))

# only add keys to SSH agent if there are any such files
if [[ "${#SSH_PUBLIC_KEYS[@]}" -gt 0 ]]; then
  # start SSH agent
  eval "$(ssh-agent -s)"

  for public_key in "${SSH_PUBLIC_KEYS[@]}"; do
    # get the key's name without extension
    key_name="${public_key%.*}"

    # ensure there exists a readable private key with the same name
    if [[ -r ~/.ssh/"${key_name}" ]]; then
        ssh-add ~/.ssh/"${key_name}"
    fi
  done
fi
