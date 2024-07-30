# Shell Prompt Settings

# Customize Git prompt with vanilla Bash.
prompt_git() {
  local s=''
  local branch=''

  # Check if the current directory is in a Git repository.
  if [[ "$(git rev-parse --is-inside-work-tree &>/dev/null && echo "$?")" == '0' ]]; then
    # Check if the current directory is in .git before running git checks.
    if [[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]]; then
      # Ensure the index is up to date.
      git update-index --really-refresh -q &>/dev/null

      # Check for uncommitted changes in the index.
      if ! $(git diff --quiet --ignore-submodules --cached); then
        s+='+'
      fi

      # Check for unstaged changes.
      if ! $(git diff-files --quiet --ignore-submodules --); then
        s+='!'
      fi

      # Check for untracked files.
      if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
        s+='?'
      fi

      # Check for stashed files.
      if $(git rev-parse --verify refs/stash &>/dev/null); then
        s+='$'
      fi
    fi

    # Get the short symbolic ref.
    # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit.
    # Otherwise, just give up.
    branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null ||
      git rev-parse --short HEAD 2>/dev/null ||
      echo '(unknown)')"

    [[ -n "${s}" ]] && s=" [${s}]"

    echo -e "${1}${branch}${2}${s}"
  else
    return
  fi
}

PS1=''
PS1+="${BPE_BOLD_RED}\u${BPE_RESET}" # user
PS1+="${BPE_WHITE}@${BPE_RESET}"
PS1+="${BPE_BOLD_GREEN}\h${BPE_RESET}" # host
PS1+=" ${BPE_WHITE}|${BPE_RESET}"
PS1+=" ${BPE_BOLD_YELLOW}\w${BPE_RESET}" # directory

# If in a git repository, append branch and status to the prompt.
ps1_git=" ${BPE_WHITE}|${BPE_RESET} ${BPE_BOLD_MAGENTA}"
PS1+="\$(prompt_git \"${ps1_git}\")"

# Put command prompt on the next line.
PS1+="${BPE_RESET}\n"
PS1+="${BPE_BLUE}\$${BPE_RESET} "

# Trim long directory paths to '...'.
PROMPT_DIRTRIM=7

# Prepend an 'X' symbol to PS1 if previous command returns non-zero, and remove the symbol if previous command returns zero.
ps1_full="${PS1}" # keep track of the latest PS1 to revert it on zero return
ps1_err="${BPE_BOLD_RED}✗${BPE_RESET} ${PS1}"
PROMPT_COMMAND='[[ "$(echo $?)" -ne 0 ]] && PS1="${ps1_err}" || PS1="${ps1_full}"'

# Customize PS2.
PS2=''
PS2+="${BPE_YELLOW}>${BPE_RESET} "

# Customize PS3.
PS3=''
PS3+="${MAGENTA}Select an option:${RESET} "

# Customize PS4.
PS4=''
PS4+="${BPE_CYAN}\$0"
PS4+="${BPE_RESET}:${BPE_GREEN}\${LINENO}${BPE_RESET}: "

export PS1
export PS2
export PS3
export PS4
