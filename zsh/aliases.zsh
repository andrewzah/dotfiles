## shorthand
alias c="cd"
alias g="go build"
alias j="just"
alias k="kubectl"
alias l="ls"

## remaps (gnu tools -> new/rust ones)
alias fd='fdfind'

# assign ls or exa
if [[ $(type exa) ]]; then
  alias ll='exa -la'
  alias ls="exa"
else
  alias ls='ls --color=auto'
  alias ll='ls -la'
fi

# system helpers
## copy/paste
alias copy='xclip -selection c'
alias paste='xclip -selection p'

## tmux
alias ta='tmux attach'

# programming shortcuts
## images
alias fehs='feh --scale-down --auto-zoom'

# docker
alias deit='docker exec -it'
alias dps='docker ps'
alias drri='docker run --rm -it'
alias dil='docker image ls'

# docker-compose
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcr='docker-compose run'
alias dcs='docker-compose stop'

alias optic='api'

# rbenv
alias rbenve='eval "$(rbenv init -)"'

# colorize
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# git
alias gbc='git branch -v |& cat'

# git
alias gp="git push"
alias gpo="git push origin"
alias gpom='git push origin master'
alias gpomr='git pull origin master --rebase'
alias gcm="git checkout master"

# pubkey
alias pubkey="cat ~/.ssh/id_ed25519.pub|copy"

# gron
alias norg="gron --ungron"
alias ungron="gron --ungron"

# ruby
alias rbi='eval "$(rbenv init -)"'
alias bi='bundle install'
alias bu='bundle update'
alias gi='gem install'

# local system
alias cdw='cd ~/work'
alias cdwp='cd ~/work/platform'

alias screenshot-clipboard="maim -s | xclip -selection clipboard -t image/png"
alias curlj='curl -H "Content-Type: application/json"'
