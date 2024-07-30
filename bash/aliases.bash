# Shorthand Commands

# Set default options for original commands.
if [[ "$(ostype)" == 'Linux' ]]; then
  alias ls='ls -lg --classify --group-directories-first --human-readable --time-style=long-iso --color=auto'
  alias dir='dir --classify --color=auto'
  alias vdir='vdir --classify --color=auto'
elif [[ "$(ostype)" == 'MacOS' ]]; then
  alias ls='gls -lg --classify ---group-directories-first --color=auto'
  alias dir='gdir --classify --color=auto'
  alias vdir='gvdir --classify --color=auto'
fi

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'

# Set shorthands for Eza if using (https://eza.rocks).
if [[ -n "$(command -v eza)" ]]; then
  alias l='eza --long --header --group-directories-first --smart-group --time-style=long-iso --classify=auto --color=auto'
  alias lg='l --grid'      # as grid
  alias la='l --all'       # list all, including hidden and 'dot' files
  alias lga='la --grid'    # list all as grid
  alias ld='l --only-dirs' # directories only
  alias lt='l --tree'      # recurse into directories as a tree
  alias ldt='ld --tree'    # directory-only tree
else
  alias l='ls'
  alias la='l --almost-all'   # list all, including hidden and 'dot' files
  alias ld='l --directory */' # directories only
fi

alias c='clear'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'

# Use better ps format for processes ran by current user.
alias psme='ps -o ppid,pid,user,stat,%cpu,rss,args | head -n 1; ps -e -o ppid,pid,user,stat,%cpu,rss,args | grep ${USER}'
