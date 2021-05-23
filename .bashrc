## dotfiles sync
# https://www.atlassian.com/git/tutorials/dotfiles
# https://news.ycombinator.com/item?id=11071754
alias dots='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'

## Liquid Prompt
[[ $- = *i* ]] && source /usr/bin/liquidprompt

## PATH
export PATH=$PATH:/home/alex/.cargo/bin

## Bash functionality
export HISTCONTROL=ignoreboth:erasedups
export EDITOR=nvim

## SSH agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 4h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

## Modified commands
alias df='df -h'
alias diff='colordiff'
alias dmesg='dmesg -HL'
alias du='du -ch'
alias free='free -h'
alias grep='grep --color=auto'
alias ls='ls -h --color=auto'
alias mkdir='mkdir -p'
alias ssh='TERM=xterm-256color ssh'
alias wget='wget -c'

## New commands
alias la='ls -al'
alias rot13='tr "A-Za-z" "N-ZA-Mn-za-m"'

## Safety features
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -I'
alias ln='ln -i'
