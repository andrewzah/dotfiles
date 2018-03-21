alias ls="ls -la"
alias exa="exa -l"

# Clojure
alias lr="lein repl"


# https://github.com/holman/dotfiles/blob/b943fe169f372c6ee0057c8ff698e1709719a6ba/git/aliases.zsh
# Git. Remove `+` and `-` from start of diff lines; just rely upon color.
alias gd='git diff --color | sed "s/^\([^-+ ]*\)[-+ ]/\\1/" | less -r'

# https://github.com/holman/dotfiles/blob/b943fe169f372c6ee0057c8ff698e1709719a6ba/docker/aliases.zsh
# Docker
alias d='docker $*'
alias d-c='docker-compose $*'

alias dcu="docker-compose up"
alias dcd="docker-compose down"
alias dcb="docker-compose build"
