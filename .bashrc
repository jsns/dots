# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

if [ -f ~/.school_aliases ]; then
	. ~/.school_aliases
fi

if [ -f ~/.bash_paths ]; then
	. ~/.bash_paths
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
export PS1="\[\e[32;0m\][\u@\h \W]\\$ \[\e[0m\]"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
