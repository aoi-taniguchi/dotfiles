#!/bin/sh

alias e='exa --icons'
alias l=e
alias ls=e
alias ea='exa -a --icons'
alias la=ea
alias ee='exa -aal --icons'
alias ll=ee
alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
alias lt=et
alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'

alias g='git'
alias dg='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias lg='lazygit'
alias dlg='export GIT_DIR=$HOME/.dotfiles/ && export GIT_WORK_TREE=$HOME && lazygit && unset GIT_DIR && unset GIT_WORK_TREE'

alias nv='~/appimages/nvim.appimage'
