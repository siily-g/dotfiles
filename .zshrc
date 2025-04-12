# Basic Setopts and Unsetopts
setopt autocd               # Automatically change directory when only file path is given
setopt interactivecomments  # Allows comments in interactive shells 
unsetopt beep               # Disable beeping in errors

# History
setopt appendhistory        # Multiple terminal sessions append to one zsh command history
setopt histignoredups       # Ignores duplicate in history
setopt extendedhistory      # Explains more in history
HISTFILE=~/.histfile
HISTSIZE=100000      
SAVEHIST=100000

# Variables
export BROWSER="librewolf"
export EDITOR="nvim"

# Autocompletion
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select # Open completion menu when tab is pressed twice

# Keybindings
bindkey -v          # Vi(m) keybinding
export KEYTIMEOUT=5 # Faster esc key for vi(m) keybindings

typeset -g -A key

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
alias ls="ls -GFw30 --color=auto"                               # Instead it ignores groups, add file type indicator, and columns it.
alias lsa="ls -GFaw30 --color=auto"                             # The same as above, but list everything
alias c="clear;fastfetch;echo 'Arch is the best!'"              # Make it easy and fast to clear, fastfetch, and say truth ;) https://wiki.archlinux.org/title/Arch_is_the_best
alias cl="clear"                                                # The same as above, but just clears
alias v=$EDITOR                                                 # Opens editor
alias b=$BROWSER                                                # Opens browser

# Run these at start
fastfetch
echo "Arch is the best!" # https://wiki.archlinux.org/title/Arch_is_the_best
