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

# use Zsh's version of prompt escape sequences to make prompt colors
# reference: (http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html)

# customize PS2
PS2=''
PS2+="%{%F{yellow}%}(☞ﾟヮﾟ)☞"
PS2+="%{%f%} "

# for PS3 and PS4, use Zsh's escape sequences as well, even though PS3 (used in
# select) and PS4 (used in execution trace) are mostly used in scripts that use
# Bash as their shell
# if PS3 and PS4 isn't escaped properly when running a script, the script most
# likely uses Bash as the shell, so use `bash ./script` to use the Bash version
# of PS3 and PS4

# customize PS3
PS3=''
PS3+="%{%F{magenta}%}Select an option:"
PS3+="%{%f%} "

# customize PS4
PS4=''
PS4+="%{%F{cyan}%}%N"
PS4+="%{%f%}:"
PS4+="%{%F{green}%}%i"
PS4+="%{%f%}: "

export PS2
export PS3
export PS4
