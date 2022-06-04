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
alias nv='~/appimages/nvim.appimage'

# peco
set fish_plugins theme peco

## bind peco history to Ctrl+r
function fish_user_key_bindings
  bind \cr peco_select_history
end

starship init fish | source
