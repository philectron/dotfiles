# Core Settings

export EDITOR='vim'
export LESS='QMcdR'
export MORE='-c'
export PAGER='less'

# Configure Bash history.
shopt -s histappend
export HISTFILE="${HOME}/.bash_history"
export HISTTIMEFORMAT="%F %T: " # 33916  2017-12-30 17:12:20 echo foo
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls:bg:fg:clear:history"
export HISTSIZE=1000000 # 10^6
export HISTFILESIZE=${HISTSIZE}
# Make multi-line commands as one-line command in ${HISTFILE}.
shopt -s cmdhist

# Append to history file right a command is executed.
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"

# Ctrl-Backspace = erase 1 character
stty erase '^?'

# Disable Ctrl-S = hang terminal
stty -ixon

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# # Don't clear the screen after quiting a man page.
# export MANPAGER='less -X'

# Update the values of LINES and COLUMNS after each command.
shopt -s checkwinsize

# Auto-correct typo in path when using 'cd'.
shopt -s cdspell

# Enable bash_completion.
if ! shopt -oq posix; then
  if [[ -f '/usr/share/bash-completion/bash_completion' ]]; then
    source /usr/share/bash-completion/bash_completion
  elif [[ -f '/etc/bash_completion' ]]; then
    source /etc/bash_completion
  fi
fi
