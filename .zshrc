export ZSH=/home/andrei/.oh-my-zsh

source ~/.zsh/path.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/exports.zsh
#source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/secret-exports.zsh
#~/.zsh/macosx.sh

ZSH_THEME="theunraveler"

plugins=(git lein ruby wd colored-man-pages last-working-dir)
source $ZSH/oh-my-zsh.sh

source $ZSH_CUSTOM/plugins/up/up.plugin.zsh
source $ZSH_CUSTOM/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
