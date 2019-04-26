source ~/.zsh/aliases.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/secret-exports.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history.zsh
source ~/.zsh/setopt.zsh
source ~/.zsh/zsh-path.zsh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
source ~/.iterm2_shell_integration.zsh
#plugins=(gitfast ruby wd colored-man-pages last-working-dir)
#source ~/.oh-my-zsh/custom/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
