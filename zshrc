# Path to oh-my-zsh installation
export ZSH="${HOME}/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='agnoster'

# Use case-sensitive completion if true
CASE_SENSITIVE='false'

# Use hyphen-insensitive completion if true
# Case-sensitive completion must be off. _ and - will be interchangeable
HYPHEN_INSENSITIVE='false'

# Disable bi-weekly auto-update checks if true
DISABLE_AUTO_UPDATE='false'

# Automatically update without prompting if true
DISABLE_UPDATE_PROMPT='false'

# How often to auto-update (in days), default 13
export UPDATE_ZSH_DAYS=13

# Set to true if pasting URLs and other text is messed up
DISABLE_MAGIC_FUNCTIONS=false

# Disable colors in ls if true
DISABLE_LS_COLORS='false'

# Disable auto-setting terminal title if true
DISABLE_AUTO_TITLE='false'

# Enable command auto-correction if true
ENABLE_CORRECTION='true'

# Display red dots whilst waiting for completion if true
COMPLETION_WAITING_DOTS='true'

# Set to true if you want to disable marking untracked files under VCS as dirty
# this makes repository status check for large repositories much, much faster
DISABLE_UNTRACKED_FILES_DIRTY='true'

# Shange the command execution time stamp shown in the history command output
# Optional three formats:
#     'mm/dd/yyyy'|'dd.mm.yyyy'|'yyyy-mm-dd'
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details
HIST_STAMPS='%F %T'  # yyyy-mm-dd HH:MM:SS

# Use another custom folder than $ZSH/custom
# ZSH_CUSTOM=/path/to/new-custom-folder

# Plugins:
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup
plugins=(git)

source ${ZSH}/oh-my-zsh.sh

# User configuration

# export MANPATH='/usr/local/man:$MANPATH'

# Manually set the language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [ -n ${SSH_CONNECTION} ]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Aliases

# shorthand
alias l='ls -F'
alias la='ls -AF'
alias ld='ls -d */'  # directories only
alias lf="ls -AF | grep -v '^d'"  # files only
# alias z='suspend'  # not using this
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# default option for original command
alias ls='ls -l -g --sort=time --group-directories-first --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# ps processes ran by ${USER}
alias psme="ps -o ppid,pid,euser,stat,%cpu,rss,args | head -n 1; \
  ps -eH -o ppid,pid,euser,stat,%cpu,rss,args | grep ${USER}"
stty erase '^?'

# add an "alert" alias for long running commands.
# use like so: sleep 10; alert
alias alert='notify-send --urgency=low -i \
  "$([ $? = 0 ] && echo terminal || echo error)" \
  "$(history | tail -n1 | sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# shorthand for a more detailed leak check valgrind
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all \
  --track-origins=yes'

# mount OSU Flip server to ~/flip/ quickly
alias flip_mount='mkdir -p ~/flip/ \
  && sshfs -o allow_other \
  luuph@flip.engr.oregonstate.edu:/nfs/stak/users/luuph/ ~/flip/'
alias flip_umount='sudo umount ~/flip/ && rm -rf ~/flip/'

# ssh to OSU OS1 server quickly
alias os1='ssh -A -t onid ssh -A os1'

# shorthand for re-attaching IRC client
alias irc='ssh onid -t tmux a -t weechat'
