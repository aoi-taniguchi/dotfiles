# Setup fzf
# ---------
if [[ ! "$PATH" == */home/aoi-taniguchi/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/aoi-taniguchi/.fzf/bin"
fi

eval "$(fzf --bash)"
