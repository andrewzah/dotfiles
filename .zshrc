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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/andrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/andrew/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/andrew/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/andrew/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

