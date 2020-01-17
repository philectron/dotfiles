prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    print -n "%{%k%F{${CURRENT_BG}}%}${SEGMENT_SEPARATOR}"
  else
    print -n "%{%k%}"
  fi

  print -n "%{%f%}"
  CURRENT_BG=''

  # Add the new line and $ as the start character
  printf "\n $"
}
