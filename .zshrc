# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
 export ZSH=/home/a.nekipelov/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="kphoen"
ZSH_THEME="avit"
#ZSH_THEME="flazz"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
#DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
#HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(gitfast git-prompt vi-mode)
plugins=(vi-mode zsh-syntax-highlighting gitfast)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


HISTSIZE=500000
SAVEHIST=500000

## TODO
# https://github.com/clvv/fasd

alias rgrep='grep -R --colour=auto'
alias grep='grep --colour=auto'
alias df='df -k --print-type --human-readable' 
alias du='du -k --total --human-readable' 
alias ag='ag --color-line-number=35 --color-match="48;5;7" --color-path=31'
alias ls='ls --color=auto'
alias gg='git grep'


# color commands with grc
if type grc > /dev/null ;
then
    alias ping='grc --colour=auto ping'
    alias traceroute='grc --colour=auto traceroute'
    alias make='grc --colour=auto make'
    alias diff='grc --colour=auto diff'
    alias ps='grc --colour=auto ps'
    alias gcc='grc --colour=auto gcc'
    alias df='grc --colour=auto df'
    alias netstat='grc --colour=auto netstat'

    #  logs
#    alias cat="grc cat"
    alias tail='grc --colour=auto tail '
    alias head='grc --colour=auto head '
fi


# adds history
setopt APPEND_HISTORY
# adds history incrementally and share it across sessions
setopt INC_APPEND_HISTORY SHARE_HISTORY
# don't record dupes in history
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
# share history between sessions ???
setopt SHARE_HISTORY
# don't record "history" and "fc" commands
setopt HIST_NO_STORE

setopt AUTO_CD
setopt NOTIFY

# fix typos
setopt CORRECT_ALL
SPROMPT='zsh: Replace '\''%R'\'' на '\''%r'\'' ? [Yes/No/Abort/Edit] '


# escape url (example: &amp;, ?, ~ etc)
autoload -U url-quote-magic
zle -N self-insert url-quote-magic

# Brace expansion ({1-3} -> "1 2 3", {a-c} -> "a b c")
setopt BRACECCL


# home/end keys
bindkey "${terminfo[khome]}" beginning-of-line # home key
bindkey "${terminfo[kend]}" end-of-line  # end key
bindkey "${terminfo[kdch1]}" delete-char # delete key


# color terminal
export TERM='xterm-256color'

