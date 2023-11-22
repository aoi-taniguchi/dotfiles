#!/bin/sh

# history
HISTFILE=~/.zsh_history

# source
source "$HOME/.config/zsh/aliases.zsh"
source "$HOME/.config/zsh/exports.zsh"

# plugins
source ~/.zplug/init.zsh
# zplug "esc/conda-zsh-completion"
zplug "zsh-users/zsh-autosuggestions"
# plug "hlissner/zsh-autopair"
# plug "zap-zsh/supercharge"
# plug "zap-zsh/vim"
# zplug "spaceship-prompt/spaceship-prompt"
# plug "zap-zsh/atmachine-prompt"
# zplug "zap-zsh/zap-prompt"
zplug "zap-zsh/fzf"
# zplug "zap-zsh/exa"
zplug "zsh-users/zsh-syntax-highlighting"
#
eval "$(starship init zsh)"

# plug "spaceship-prompt/spaceship-prompt"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# keybinds
# bindkey '^ ' autosuggest-accept

export PATH="$HOME/.local/bin":$PATH

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\""
  alias catt="bat --theme \"Visual Studio Dark+\""
fi

export VISUAL=vim
export EDITOR="$VISUAL"

# zoxide
eval "$(zoxide init zsh)"

# fd
export PATH="$HOME/.local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# venv
source ~/.venv/bin/activate

# nix
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi

# direnv
eval "$(direnv hook zsh)"
