prompt_git() {
  local s=''
  local branch=''

  # check if the current directory is in a Git repository
  if [[ $(git rev-parse --is-inside-work-tree &>/dev/null; \
     echo "$?") == '0' ]]; then
    # check if the current directory is in .git before running git checks
    if [[ "$(git rev-parse --is-inside-git-dir 2>/dev/null)" == 'false' ]]; then
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
    branch="$(git symbolic-ref --quiet --short HEAD 2>/dev/null \
      || git rev-parse --short HEAD 2>/dev/null \
      || echo '(unknown)')"

    [[ -n "${s}" ]] && s=" [${s}]"

    echo -e "${1}${branch}${2}${s}"
  else
    return
  fi
}

# customize PS1 to 'User at Host in Directory'
PS1=''
PS1+="${BPE_BOLD_RED}\u"  # user
PS1+="${BPE_RESET} "
PS1+="${BPE_WHITE}at"
PS1+="${BPE_RESET} "
PS1+="${BPE_BOLD_GREEN}\h"   # host
PS1+="${BPE_RESET} "
PS1+="${BPE_WHITE}in"
PS1+="${BPE_RESET} "
PS1+="${BPE_BOLD_YELLOW}\w"  # directory

# this Git prompt function doesn't work on Windows Git Bash
if [[ "${OSTYPE}" == 'linux-gnu' ]]; then
  # if in a git repository, append ' on Branch [Status]' to the prompt
  ps1_git="${BPE_RESET} ${BPE_WHITE}on${BPE_RESET} ${BPE_BOLD_MAGENTA}"
  PS1+="\$(prompt_git \"${ps1_git}\")"
fi

# put command prompt on the next line
PS1+="${BPE_RESET}\n"
PS1+="${BPE_BLUE}(づ｡◕‿‿◕｡)づ"
PS1+="${BPE_RESET} "

# trim long directory paths to '...'
PROMPT_DIRTRIM=5

# prepend an 'X' symbol to PS1 if previous command returns non-zero, and
# remove the symbol if previous command returns zero
ps1_full="${PS1}"  # keep track of the latest PS1 to revert it on zero return
ps1_err="${BPE_BOLD_RED}✗${BPE_RESET} ${PS1}"
PROMPT_COMMAND='[[ "$(echo $?)" -ne 0 ]] && PS1="${ps1_err}" || PS1="${ps1_full}"'

# customize PS2
PS2=''
PS2+="${BPE_YELLOW}(☞ﾟヮﾟ)☞"
PS2+="${BPE_RESET} "

# customize PS3
PS3=''
PS3+="${MAGENTA}Select an option:"
PS3+="${RESET} "

# customize PS4
PS4=''
PS4+="${BPE_CYAN}\$0"
PS4+="${BPE_RESET}:"
PS4+="${BPE_GREEN}\${LINENO}"
PS4+="${BPE_RESET}: "

export PS1
export PS2
export PS3
export PS4
