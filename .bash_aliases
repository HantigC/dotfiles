alias eba="$EDITOR ~/.bash_aliases"
alias ebr="$EDITOR ~/.bashrc"
alias sbr="source $HOME/.bashrc"
alias la='ls -lah'
alias ll='ls -lh'
alias l='la -lah'
alias lg='la -lAh | grep'
#############################################
#############################################
#############################################
#############################################
# open confi files
#############################################
#############################################
# edit
alias ebr="$EDITOR ~/.bashrc"
alias eir="$EDITOR ~/.inputrc"
alias ebp="$EDITOR ~/.bash_profile"
alias eal="$EDITOR ~/.bash_aliases"
alias evr="$EDITOR ~/.vimrc"
alias envr="$EDITOR ~/.config/nvim/init.vim"
# source
alias sbr=". ~/.bashrc"
alias sir=". ~/.inputrc"
alias sbp='. ~/.bash_profile'
alias sal='. ~/.bash_aliases'
alias svr='. ~/.vimrc'
#############################################
#############################################
# Shorcuts
## docker 
# image
alias did='docker images --filter "dangling=true"'
alias dil='docker image ls'
alias dilg='docker image ls | grep'
alias dila='docker image ls -a'
alias dilag='docker image ls -a | grep'
alias dirm='docker image rm'
alias dib='docker image build'
alias dibt='docker image build -t'
alias dip='docker image prun'
# container
alias dcl='docker container ls'
alias dclg='docker container ls | grep'
alias dcla='docker container ls -a'
alias dclag='docker container ls -a | grep'
alias dcrm='docker container rm'
## tmux
alias tl='tmux ls'
alias tnn='tmux newm -s'
alias ta='tmux a -t'
alias trm='tmux kill-session -t'
## git
alias gg='git log --graph --all --decorate'
alias ggo='git log --graph --all --decorate --oneline'
alias gb='git blame'
## commands
alias w1='watch -n 1'
alias w1n='watch -n 1 nvidia-smi'
#############################################
#############################################
alias edr="$EDITOR ."
alias par='cd ..'
alias pre='cd -'
alias rr='rm -rf'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cdnv='cd ~/.config/nvim'
#############################################
#############################################
# Commands
#############################################
#############################################
alias w1='watch -n 1'
alias w1n='watch -n 1 nvidia-smi'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
source $HOME/.move_aliases

