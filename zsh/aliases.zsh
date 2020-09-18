# copy/paste
alias copy='xclip -selection c'
alias paste='xclip -selection p'

# rbenv
alias rbenve='eval "$(rbenv init -)"'

# color
alias grep='grep --color=auto'
alias diff='diff --color=auto'

# assign ls or exa
if [[ $(type exa) ]]; then
  alias ll='exa -la'
  alias ls="exa"
else
  alias ls='ls --color=auto'
  alias ll='ls -la'
fi

# git
alias gp="git push"
alias gpo="git push origin"
alias gpom='git push origin master'
alias gpomr='git pull origin master --rebase'
alias gcm="git checkout master"

# pubkey
alias pubkey="cat ~/.ssh/id_ed25519.pub|copy"

# common
alias g="go build"
alias k="kubectl"

# gron
alias norg="gron --ungron"
alias ungron="gron --ungron"

# ruby
alias rbi='eval "$(rbenv init -)"'
alias bi='bundle install'
alias bu='bundle update'
alias gi='gem install'

# local system
alias cda='cd ~/work/afml'
alias cdp='cd ~/programming'
alias cds='cd ~/Website'
alias cdw='cd ~/work'
alias cdwp='cd ~/work/platform'

alias screenshot-clipboard="maim -s | xclip -selection clipboard -t image/png"
