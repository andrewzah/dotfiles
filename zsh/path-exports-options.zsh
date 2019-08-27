##### PROGRAMMING

# *nix programs
export PATH="/home/andrew/.local/bin:$PATH"

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust: Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# golang
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

# nix
source ~/.nix-profile/etc/profile.d/nix.sh

# taskwarrior
export TASKRC=~/.config/task/config

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

##### APPLICATIONS

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'
