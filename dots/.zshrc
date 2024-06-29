# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/qwikk/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

lfcd () {
  z "$(command lf -print-last-dir "$@")"
}

eval "$(zoxide init zsh)"
