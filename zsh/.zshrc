# The following lines were added by compinstall
zstyle :compinstall filename '/home/violeta/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=50000
setopt autocd notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install

alias vi='nvim --clean'
alias vim='nvim'
alias neovim='nvim'
alias nvim-conf='nvim ~/.config/nvim/init.lua'

alias pacman='sudo pacman'

alias ls='ls -A --color=auto'
alias grep='grep --color=auto'

PS1='%1~ > '

export GCM_CREDENTIAL_STORE=cache
