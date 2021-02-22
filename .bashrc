## dotfiles sync
# https://www.atlassian.com/git/tutorials/dotfiles
# https://news.ycombinator.com/item?id=11071754
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

## Liquid Prompt
[[ $- = *i* ]] && source /usr/bin/liquidprompt

## PATH
export PATH=$PATH:/home/alex/.cargo/bin

## Bash functionality
export HISTCONTROL=ignoreboth:erasedups
export EDITOR=nvim

## Modified commands
alias ls='ls -h --color=auto'
alias diff='colordiff'
alias grep='grep --color=auto'
alias df='df -h'
alias du='du -ch'
alias mkdir='mkdir -p'
alias dmesg='dmesg -HL'
alias wget='wget -c'

## New commands
alias la='ls -al'
alias rot13='tr "A-Za-z" "N-ZA-Mn-za-m"'

## Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
