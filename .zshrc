export ZSH=/Users/andrewzah/.oh-my-zsh

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/colors.zsh
source ~/.dotfiles/zsh/path-exports.zsh
source ~/.dotfiles/zsh/secret-exports.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/history.zsh
source ~/.dotfiles/zsh/setopt.zsh
source ~/.dotfiles/zsh/theme.zsh

autoload -U colors && colors
#export PS1="%{$fg_bold[magenta]%} λ %{$reset_color%}"

setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTFILE=~/Sync/personal/.shell_history
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
