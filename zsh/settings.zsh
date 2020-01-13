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

# Plugins:
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup
plugins=(git)

# Manually set the language environment
export LANG='en_US.UTF-8'
export LESS='QMcdR'
export MORE='-c'
export PAGER='less'

# Preferred editor for local and remote sessions
if [ -n ${SSH_CONNECTION} ]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# zsh_history configuration
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY
HISTFILE="${HOME}/.zsh_history"
HISTORY_IGNORE="(ls|bg|fg|clear|history)"
HISTSIZE=1000000
HIST_STAMPS='%F %T'  # yyyy-mm-dd HH:MM:SS
SAVEHIST=1000000

# Highlight section titles in man page
export LESS_TERMCAP_md="${yellow}"

# Don't clear the screen after quiting a man page
export MANPAGER='less -X'

# Must load Oh-My-Zsh last
source ${ZSH}/oh-my-zsh.sh
