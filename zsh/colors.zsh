ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=yellow,bold"
zstyle ':completion:*' list-colors "${(@s.:.)LS_COLORS}"
autoload -Uz compinit
compinit
