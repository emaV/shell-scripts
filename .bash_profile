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
# PS1='\[\e[1;32m\][\u \w]\$\[\e[0m\] '
PS1="[\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w\[\033[00m\]]\$ "
export PS1
export SUDO_PS1="\[\e[33;1;41m\][\u]\w\$\[\e[0m\] "
