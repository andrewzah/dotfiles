export ZSH=/Users/andrewzah/.oh-my-zsh

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/colors.zsh
source ~/.dotfiles/zsh/path-exports.zsh
source ~/.dotfiles/zsh/secret-exports.zsh
source ~/.dotfiles/zsh/functions.zsh
source ~/.dotfiles/zsh/history.zsh
source ~/.dotfiles/zsh/setopt.zsh

ZSH_THEME="zah"
source $ZSH/oh-my-zsh.sh

#plugins=(gitfast ruby wd colored-man-pages last-working-dir)
#source ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
