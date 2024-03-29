set fish_greeting ""

#set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
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
alias dlg='set -x GIT_DIR $HOME/.dotfiles/ && set -x GIT_WORK_TREE $HOME && lazygit && set -e GIT_DIR && set -e GIT_WORK_TREE'

alias nv='~/appimages/nvim.appimage'

starship init fish | source

# fzf
fzf_configure_bindings --directory=\cf --history=\cr --processes=\cp --variables=\cv
set fzf_fd_opts --hidden --exclude=.git

# direnv
direnv hook fish | source

# venv
source ~/.venv/bin/activate.fish
