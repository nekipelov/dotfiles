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

export PATH=$PATH:$HOME/.local/bin:$HOME/bin
export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
shopt -s histappend                       # append history file
export PROMPT_COMMAND="history -a"        # update histfile after every command
export HISTFILESIZE=500000
export HISTIGNORE="&:[ ]*:exit"

if [ -e /usr/share/terminfo/x/xterm-256color ]; then
    export TERM='xterm-256color'
else
    export TERM='xterm-color'
fi

alias rgrep='grep -R'
ulimit -c unlimited

transfer() { if [ $# -eq 0 ]; then echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi 
tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://t.bk.ru/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://t.bk.ru/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; } 


# git branch in prompt
# git clone git://github.com/jimeh/git-aware-prompt.git
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\${debian_chroot:+(\$debian_chroot)}\u@\h:\w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
