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
  "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# shorthand for a more detailed leak check valgrind
alias valgrind='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'

# mount OSU Flip server to ~/flip/ quickly
alias flip_mount='mkdir -p ~/flip/ \
  && sshfs -o allow_other \
  luuph@flip.engr.oregonstate.edu:/nfs/stak/users/luuph/ ~/flip/'
alias flip_umount='sudo umount ~/flip/ && rm -rf ~/flip/'

# ssh to OSU OS1 server quickly
alias os1='ssh -A -t flip ssh -A os1'
