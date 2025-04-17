# Zgenom plugin manager
source "${HOME}/.zgenom/zgenom.zsh"
# Check for plugin and zgenom updates every 7 days
zgenom autoupdate


if ! zgenom saved; then
  zgenom load zsh-users/zsh-autosuggestions     # Auto suggestions like in fish
  zgenom load zsh-users/zsh-syntax-highlighting # Syntax highlighting like in fish
  clear                                         # So I don't see the mess
  zgenom compile .zshrc
fi


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
alias ls="eza -TF --group-directories-first -L 2 --icons --git"        # eza is better ls, tree view the file with depth level 2, file type indicator, files first, icons and git
alias lsa="eza -ATF --group-directories-first -L 2 --icons --git"      # allat above but almost all
alias ll="eza -hlbmTUF --group-directories-first -L 2 --icons --git"   # like below but not all
alias lla="eza -hlbmTUAF --group-directories-first -L 2 --icons --git" # shows heading, long display, file size, time of creation and modification, almost all files, add file type indicator, files first, icon and git compatible
alias c="clear;fastfetch;echo 'Arch is the best!'"                     # Make it easy and fast to clear, fastfetch, and say truth ;) https://wiki.archlinux.org/title/Arch_is_the_best
alias cl="clear"                                                       # The same as above, but just clears
alias gco="git status"                                                 # Not git checkout but gs is taken
alias gpo="git push origin"                                            # Git push
alias vpnstart="wg-quick up /etc/wireguard/ne.conf"                    # 
alias vpnstop="wg-quick down /etc/wireguard/ne.conf"                   # Vpn


# Run these at start
fastfetch
#!/bin/zsh -f
setopt extendedglob
print -- $(echoti setaf 2) ${$(<<<${${${(@j: :)${(@s:_:)${:-What_Linux_is_the_best?}}}/* (#b)([A-Z]i)/Arch $match[1]}} tr '?' '!')} $terminfo[sgr0] # https://wiki.archlinux.org/title/Arch_is_the_best

