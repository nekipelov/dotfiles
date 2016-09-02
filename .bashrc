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

export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
shopt -s histappend                       # append history file
export PROMPT_COMMAND="history -a"        # update histfile after every command
export HISTFILESIZE=500000
export HISTIGNORE="&:[ ]*:exit:ls:[bf]g"
export PROMPT_DIRTRIM=3  # trim path on prompt

export PATH=$HOME/.local/bin:$HOME/bin:$PATH

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
#else
#    export TERM='xterm-color'
#fi

alias rgrep='grep -R'
alias ag='ag --color-line-number=35 --color-match="48;5;7" --color-path=31'

ulimit -c unlimited

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://t.bk.ru/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://t.bk.ru/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

source ~/.bash/git-prompt.sh
export PS1='[\u@\h \w$(__git_ps1 " \[\033[1;31m\](%s)\[\033[0m\]") ]\$ '
