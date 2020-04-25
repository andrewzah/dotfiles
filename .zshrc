source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/path-exports-options.zsh
source ~/.dotfiles/zsh/secret-exports.zsh
source ~/.dotfiles/zsh/zsh-configuration.zsh
source ~/.dotfiles/zsh/theme.zsh

autoload -U colors && colors
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

bindkey -v
bindkey -e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
