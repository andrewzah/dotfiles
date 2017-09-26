# PATH
export PATH=/usr/local/bin:$PATH~/bin:/usr/local/sbin:~/bin

# ZSH 
export ZSH=/Users/andrew/.oh-my-zsh
export UPDATE_ZSH_DAYS=1

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Custom
########

export TERM=xterm-256color

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

# export MANPATH="/usr/local/man:$MANPATH"
export GPG_TTY=$(tty)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
 export EDITOR='nvim'
else
 export EDITOR='nvim'
fi
