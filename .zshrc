# Basic Setopts and Unsetopts
setopt autocd               # Automatically change directory when only file path is given
setopt interactivecomments  # Allows comments in interactive shells 
setopt correct              # Enable correction
setopt correctall           # Same as above
unsetopt beep               # Disable beeping in errors


# Prompt
eval "$(starship init zsh)"


# Auto suggestion and highlighting like fish shell, see https://wiki.archlinux.org/title/Zsh#Fish-like_syntax_highlighting_and_autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh


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


# Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


# Run these at start
fastfetch
#!/bin/zsh -f
setopt extendedglob
print -- $(echoti setaf 2) ${$(<<<${${${(@j: :)${(@s:_:)${:-What_Linux_is_the_best?}}}/* (#b)([A-Z]i)/Arch $match[1]}} tr '?' '!')} $terminfo[sgr0] # https://wiki.archlinux.org/title/Arch_is_the_best
