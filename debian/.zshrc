source ~/.dotfiles/debian/zsh/aliases.zsh
source ~/.dotfiles/debian/zsh/config.zsh
source ~/.dotfiles/debian/zsh/functions.zsh
source ~/.dotfiles/debian/zsh/path-exports-options.zsh
source ~/.dotfiles/debian/zsh/secret-exports.zsh
source ~/.dotfiles/debian/zsh/zsh-configuration.zsh
source ~/.dotfiles/debian/zsh/theme.zsh

autoload -U colors && colors
export PROMPT_COMMAND="history -p $HISTFILE"

bindkey -v
bindkey -e

autoload -U edit-command-line
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search

zle -N edit-command-line
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down
bindkey '\C-x\C-e' edit-command-line

[ -f "/etc/grc.zsh" ] && source "/etc/grc.zsh"

precmd() {
  eval "$PROMPT_COMMAND";
  case $TERM in
    xterm*)
      precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
  esac
}
