# Customize the Agnoster prompt
prompt_end_previous_segment() {
  if [[ -n "${CURRENT_BG}" ]]; then
    print -n "%{%k%F{${CURRENT_BG}}%}${SEGMENT_SEPARATOR}"
  else
    print -n "%{%k%}"
  fi
  print -n "%{%f%}"
  CURRENT_BG=''
}

# Function name must be prompt_end() to override Agnoster's prompt_end()
prompt_end() {
  prompt_end_previous_segment
  printf "\n "
  prompt_segment 'blue' 'black' '$'
  prompt_end_previous_segment
}
