# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

### Aliases
alias ls='ls --color=auto'
alias ll='ls -ahlF --group-directories-first'
alias grep='grep --color=auto'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

### Bindings
## Bash history autocompletion bindings.
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

### Functions
function get_container_ip {
  hostname -I | cut -d ' ' -f1
}

function get_container_service {
  echo $SERVICE_NAME
}

### Custom PS1 from container ENV variable
export PS1=$CONTAINER_PS1
