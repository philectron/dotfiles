#!/usr/bin/env bash

# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# A big thanks to \amethyst on Freenode

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] \
  && infocmp gnome-256color >/dev/null 2>&1; then
  TERM=gnome-256color
fi

# use the list of 256 Xterm colors. For reference:
# https://jonasjacek.github.io/colors/
# tput colors approximated from Tomorrow Night theme at
# https://github.com/chriskempson/tomorrow-theme#tomorrow-night
if tput setaf 1 &> /dev/null; then
  tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    MAGENTA=$(tput setaf 167)
    ORANGE=$(tput setaf 173)
    GREEN=$(tput setaf 143)
    PURPLE=$(tput setaf 139)
    WHITE=$(tput setaf 15)
    BLUE=$(tput setaf 110)
    CYAN=$(tput setaf 109)
    YELLOW=$(tput setaf 222)
    RED=$(tput setaf 167)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

prompt_git() {
  local s=''
  local branchName=''

  # check if the current directory is in a Git repository
  if [ $(git rev-parse --is-inside-work-tree &>/dev/null; \
     echo "${?}") == '0' ]; then
    # check if the current directory is in .git before running git checks
    if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == 'false' ]; then
      # ensure the index is up to date
      git update-index --really-refresh -q &>/dev/null

      # check for uncommitted changes in the index
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi

      # check for unstaged changes
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi

      # check for untracked files
      if [ -n "$(git ls-files --others --exclude-standard)" ]; then
        s+='?'
      fi

      # check for stashed files
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi
    fi

    # get the short symbolic ref.
    # if HEAD isn’t a symbolic ref, get the short SHA for the latest commit
    # otherwise, just give up.
    branchName="$(git symbolic-ref --quiet --short HEAD 2> /dev/null \
      || git rev-parse --short HEAD 2> /dev/null \
      || echo '(unknown)')"

    [ -n "${s}" ] && s=" [${s}]"

    echo -e "${1}${branchName}${2}${s}"
  else
    return
  fi
}

# basic prompt: 'User at Host in Directory'
PS1="\[${BOLD}${MAGENTA}\]\u "
PS1+="\[$WHITE\]at "
PS1+="\[${BOLD}${GREEN}\]\h "
PS1+="\[$WHITE\]in "
PS1+="\[${BOLD}${YELLOW}\]\w"

# if in a git repository, concatenate ' on Branch [Status]' into the prompt
PS1+="\$(prompt_git \"\[${WHITE}\] on \[${BOLD}${PURPLE}\]\")"

# put '$' on the next line, use '...' for long Directory path, and export
PS1+="\[$WHITE\]\n\$ "
PS1+="\[$RESET\]"
PROMPT_DIRTRIM=5
export PS1

PS2="\[${BOLD}${YELLOW}\]→ \[${RESET}\]"
export PS2
