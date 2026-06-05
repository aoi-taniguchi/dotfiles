#!/bin/sh

alias tmux="tmux -f ~/.config/tmux/tmux.conf"

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
alias lta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'

alias g='git'
alias lg='lazygit'

# sudo ln -s ~/appimages/nvim.appimage ~/.local/bin/nv
alias vim=nv

alias ob='~/appimages/Obsidian-1.12.7.AppImage --no-sanbox'
