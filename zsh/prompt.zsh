# customize the Agnoster prompt
prompt_end_previous_segment() {
  if [[ -n "${CURRENT_BG}" ]]; then
    print -n "%{%k%F{${CURRENT_BG}}%}${SEGMENT_SEPARATOR}"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

# function name must be prompt_end() to override Agnoster's prompt_end()
prompt_end() {
  prompt_end_previous_segment
  printf "\n"
  prompt_segment 'blue' 'black' '(づ｡◕‿‿◕｡)づ'
  prompt_end_previous_segment
}

# customize PS2
# use Zsh's version of prompt escape sequences to make prompt colors
# reference: (http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)
PS2=''
PS2+="%{%F{yellow}%}(☞ﾟヮﾟ)☞"
PS2+="%{%f%} "

# customize PS3
# use tput/ansi to be compatible with Bash scripts
# PS3's value is not expanded like PS1, PS2, and PS4, so no escape wrap
# reference: https://unix.stackexchange.com/a/439523
PS3=''
PS3+="${MAGENTA}Select an option:"
PS3+="${RESET} "

# customize PS4
# use tput/ansi to be compatible with Bash scripts
PS4=''
PS4+="${BPE_CYAN}\$0"
PS4+="${BPE_RESET}:"
PS4+="${BPE_GREEN}\${LINENO}"
PS4+="${BPE_RESET}: "

export PS2
export PS3
export PS4
