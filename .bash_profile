# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# set autocomplete for ssh
complete -W "$(echo $(grep '^ssh ' .bash_history | sort -u | sed 's/^ssh //'))" ssh

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

# set prompt
export PS1="\e[0;32m[\u]\w\$ \e[m"
export SUDO_PS1="\[\e[33;1;41m\][\u]\w\$\[\e[0m\] "
