# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# set autocomplete for ssh
complete -W "$(echo $((grep '^Host'  ~/.ssh/config; grep '^ssh ' ~/.bash_history) |cut -d ' ' -f2 |sort -u))" ssh

# User specific environment and startup programs
PATH=$PATH:$HOME/bin
export PATH

# set prompt
PS1='\[\e[1;32m\][\u \w]\$\[\e[0m\] '
export PS1
export SUDO_PS1="\[\e[33;1;41m\][\u]\w\$\[\e[0m\] "
