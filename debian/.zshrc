################
### sourcing ###
################

ZSH_SCRIPTS_DIR="$HOME/.dotfiles/debian/zsh"

source "$ZSH_SCRIPTS_DIR/aliases.zsh"
source "$ZSH_SCRIPTS_DIR/functions.zsh"
source "$ZSH_SCRIPTS_DIR/path-exports-options.zsh"
source "$ZSH_SCRIPTS_DIR/zsh-configuration.zsh"
source "$ZSH_SCRIPTS_DIR/theme.zsh"
source "$ZSH_SCRIPTS_DIR/secret-exports.zsh"

#################
### autoloads ###
#################

autoload -U colors && colors

#####################################
### sync prompts across terminals ###
### todo: make this actually work ###
#####################################

export PROMPT_COMMAND="history -p $HISTFILE"

precmd() {
  eval "$PROMPT_COMMAND";
  case $TERM in
    xterm*)
      precmd () {print -Pn "\e]0;%n@%m: %~\a"}
    ;;
  esac
}

#####################################
### set up some hotkeys from bash ###
#####################################

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
