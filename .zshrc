# Zgenom plugin manager
source "${HOME}/.zgenom/zgenom.zsh"
# Check for plugin and zgenom updates every 7 days
zgenom autoupdate


zgenom load zsh-users/zsh-autosuggestions          # Auto suggestions like in fish
zgenom load zsh-users/zsh-syntax-highlighting      # Syntax highlighting like in fish
zgenom load zsh-users/zsh-history-substring-search # History search like in fish

zgenom compile .zshrc
clear

# Basic Setopts and Unsetopts
setopt autocd               # Automatically change directory when only file path is given
setopt interactivecomments  # Allows comments in interactive shells 
setopt correct              # Enable correction
setopt correctall           # Same as above
unsetopt beep               # Disable beeping in errors


# Prompt
eval "$(starship init zsh)"


# History
setopt appendhistory        # Multiple terminal sessions append to one zsh command history
setopt histignoredups       # Ignores duplicate in history
setopt extendedhistory      # Explains more in history
HISTFILE=~/.histfile
HISTSIZE=100000      
SAVEHIST=100000


# Variables
export EDITOR="emacsclient -c"


# Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # Open completion menu when tab is pressed twice


# Keybindings 

bindkey -e          # Vi(m) keybinding
export KEYTIMEOUT=5 # Faster esc key for vi(m) keybindings typeset -g -A key
typeset -g -A key   # Dont know what this do but if I don't have it it breaks

key[Home]="${terminfo[khome]}"    # Sets Home key
key[End]="${terminfo[kend]}"      # Sets End key
key[Backspace]="${terminfo[kbs]}" # Sets Backspace key
key[Up]="${terminfo[kcuu1]}"      # Sets Up key
key[Down]="${terminfo[kcud1]}"    # Sets Down key
key[Left]="${terminfo[kcub1]}"    # Sets Left key
key[Right]="${terminfo[kcuf1]}"   # Sets Right key
key[PageUp]="${terminfo[kpp]}"    # Sets Pg Up key
key[PageDown]="${terminfo[knp]}"  # Sets Pg Dn key
key[Shift-Tab]="${terminfo[cbt]}" # Sets <Shift-Tab> key combination


# Binds the key
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  menu-complete                  # For completion menu


# Aliases

# Basic commands
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias c="clear;fastfetch;echo 'Arch is the best!'"
alias cl="clear"

# Git
alias gts="git status"
alias gtc="git commit -m '"
alias gtca="git commit -am '"
alias gtp="git push origin"
alias gta="git add"
alias gtr="git rm"

# Run these at start




