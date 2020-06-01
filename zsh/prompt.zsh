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
PS2=''
PS2+="\[${YELLOW}\](☞ﾟヮﾟ)☞"
PS2+="\[${RESET}\] "

# customize PS3
PS3=''
PS3+="\[${MAGENTA}\]Select an option:"
PS3+="\[${RESET}\] "

# customize PS4
PS4=''
PS4+="\[${CYAN}\]\$0"
PS4+="\[${RESET}\]:"
PS4+="\[${GREEN}\]\${LINENO}"
PS4+="\[${RESET}\]: "

export PS2
export PS3
export PS4
