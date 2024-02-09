#!/bin/sh

# history
HISTFILE=~/.zsh_history

# source
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"

# plugins
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\""
  alias catt="bat --theme \"Visual Studio Dark+\""
fi

# fd, zoxide
export PATH="$HOME/.local/bin:$PATH"

# starship
eval "$(starship init zsh)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
if [ -e $HOME/.config/fzf/completion.zsh ]; then . $HOME/.config/fzf/completion.zsh; fi
if [ -e $HOME/.config/fzf/key-bindings.zsh ]; then . $HOME/.config/fzf/key-bindings.zsh; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# venv
source ~/.venv/bin/activate

# lf
function lfcd() {
  cd $(lf -print-last-dir "$@")
  zle reset-prompt
}
zle -N lfcd
bindkey '^E' lfcd

# direnv
eval "$(direnv hook zsh)"

# flutter
export PATH="$HOME/work/flutter/bin:$PATH"

# rustup
source "$HOME/.cargo/env"

# nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

