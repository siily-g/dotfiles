autoload -Uz compinit # Autoload completions
setopt autocd # Auto cd when only file path is given
bindkey -v # Vi(m) keybinding

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Autocompletion
zstyle ':completion:*' menu select
compinit 
