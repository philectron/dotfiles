# Sexy Bash Prompt, inspired by "Extravagant Zsh Prompt"
# a big thanks to \amethyst on Freenode
if [[ ${COLORTERM} = gnome-* && ${TERM} = xterm ]] \
  && infocmp gnome-256color >/dev/null 2>&1; then
  TERM=gnome-256color
fi

# use the list of 256 Xterm colors. For reference:
# https://jonasjacek.github.io/colors/
# tput colors approximated from Tomorrow Night theme at
# https://github.com/chriskempson/tomorrow-theme#tomorrow-night
if tput setaf 1 &>/dev/null; then
  tput sgr0

  BLACK="$(tput setaf 0)"
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  MAGENTA="$(tput setaf 5)"
  CYAN="$(tput setaf 6)"
  WHITE="$(tput setaf 15)"

  # ANSI escapes can't concatenate 'bold' and 'color', so
  # define the bold colors here in case tput isn't available
  BOLD="$(tput bold)"
  BOLD_BLACK="${BOLD}${BLACK}"
  BOLD_RED="${BOLD}${RED}"
  BOLD_GREEN="${BOLD}${GREEN}"
  BOLD_YELLOW="${BOLD}${YELLOW}"
  BOLD_BLUE="${BOLD}${BLUE}"
  BOLD_MAGENTA="${BOLD}${MAGENTA}"
  BOLD_CYAN="${BOLD}${CYAN}"
  BOLD_WHITE="${BOLD}${WHITE}"

  RESET="$(tput sgr0)"
else
  BLACK="\033[0;30m"
  RED="\033[0;31m"
  GREEN="\033[0;32m"
  YELLOW="\033[0;33m"
  BLUE="\033[0;34m"
  MAGENTA="\033[0;35m"
  CYAN="\033[0;36m"
  WHITE="\033[0;37m"

  BOLD="\033[1m"
  BOLD_BLACK="\033[1;30m"
  BOLD_RED="\033[1;31m"
  BOLD_GREEN="\033[1;32m"
  BOLD_YELLOW="\033[1;33m"
  BOLD_BLUE="\033[1;34m"
  BOLD_MAGENTA="\033[1;35m"
  BOLD_CYAN="\033[1;36m"
  BOLD_WHITE="\033[1;37m"

  RESET="\033[0m"
fi

# base16-shell from https://github.com/chriskempson/base16-shell
# also generate ~/.vimrc_background for .vimrc to load
BASE16_SHELL="${HOME}/.bash/base16-shell/"

[[ -n "${PS1}" ]] && [[ -s "${BASE16_SHELL}/profile_helper.sh" ]] && \
  eval "$("${BASE16_SHELL}/profile_helper.sh")"

# apply the theme if it has been previously applied
[[ -f "${HOME}/.base16_theme" ]] && source "${HOME}/.base16_theme"
