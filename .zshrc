export ZSH=$HOME/.oh-my-zsh

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/path-exports-options.zsh
source ~/.dotfiles/zsh/secret-exports.zsh
source ~/.dotfiles/zsh/zsh-configuration.zsh

ZSH_THEME="zah"
source $ZSH/oh-my-zsh.sh

plugins=(gitfast)

PATH=$(printf "%s" "$PATH" | awk -v RS=':' '!a[$1]++ { if (NR > 1) printf RS; printf $1 }')

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
