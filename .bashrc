# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias dotfiles='/usr/bin/git --git-dir=/home/voidlinux/.dotfiles/ --work-tree=/home/voidlinux'
