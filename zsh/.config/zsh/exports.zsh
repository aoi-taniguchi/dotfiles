#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export VISUAL=vim
export EDITOR="$VISUAL"

export FZF_DEFAULT_OPTS="
    --height 90% --reverse --border
    --prompt='➜  ' --margin=0,1 --inline-info
    --tiebreak=index --filepath-word
"

export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude .git"
export FZF_CTRL_T_OPTS="
    --select-1 --exit-0
    --preview 'bat -r :100 --color=always --style=header,grid,numbers {}'"
