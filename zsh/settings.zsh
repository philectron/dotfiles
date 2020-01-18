#
# Zsh main settings
#

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

# Change the command execution time stamp shown in the history command output
HIST_STAMPS='%F %T'  # yyyy-mm-dd HH:MM:SS

# Define the storing location of Zsh history
HISTFILE="${HOME}/.zsh_history"

# Ignore the following commands in history
HISTORY_IGNORE="(ls|bg|fg|clear|history)"

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY

# Set a custom size of the history
HISTSIZE=1000000
SAVEHIST=1000000

# Plugins:
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup
plugins=(git)

# Must load Oh-My-Zsh here
source ${ZSH}/oh-my-zsh.sh

export EDITOR='vim'
export LANG='en_US.UTF-8'
export LESS='QMcdR'
export MORE='-c'
export PAGER='less'

# Don't clear the screen after quiting a man page
export MANPAGER='less -X'
