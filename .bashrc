# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

shopt -s globstar # **/*.ext
shopt -s extglob # Enable extended pattern matching

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# vi mode
set -o vi

# no duplicate entries
export HISTCONTROL=ignoreboth:erasedups
# append history file
shopt -s histappend
# update histfile after every command
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND$'\n'}history -a; history -c; history -r"
export HISTFILESIZE=500000
export HISTIGNORE="&:[ ]*:exit:ls:[bf]g"
export PROMPT_DIRTRIM=3  # trim path on prompt

export EDITOR=vi

export PATH=$HOME/.local/bin:$HOME/bin:$PATH

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
#else
#    export TERM='xterm-color'
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

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

alias rgrep='grep -R'
alias ag='ag --color-line-number=35 --color-match="48;5;7" --color-path=31'
alias ls='ls --color=auto'
alias gg='git grep'

ulimit -c unlimited

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://t.bk.ru/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://t.bk.ru/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

source ~/.bash/git-prompt.sh
export PS1='[\u@\h \w$(if declare -f __git_ps1 > /dev/null; then __git_ps1 " \[\033[1;31m\](%s)\[\033[0m\]"; fi)]\$ '

bind '"\C-x\C-e" edit-and-execute-command' # edit command on the editor

