
source ~/.zsh/aliases.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/zsh-path.zsh

ZSH_THEME="theunraveler"

export ZSH=/Users/andrei/.oh-my-zsh
plugins=(gitfast ruby wd colored-man-pages last-working-dir)
source $ZSH/oh-my-zsh.sh
source $ZSH/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
