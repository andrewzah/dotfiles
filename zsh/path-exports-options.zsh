export PATH="/opt:$PATH"

##### PROGRAMMING

# *nix programs
#export PATH="/home/andrew/.local/bin:$PATH"
#source ~/.nix-profile/etc/profile.d/nix.sh

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Rust: Cargo
export PATH="$HOME/.cargo/bin:$PATH"

# golang
export GOROOT="/usr/local/go"
export GOPATH="$HOME/.go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

# java 12
#export PATH=/usr/lib/jdk/12/bin:$PATH
#export JAVA_HOME=/usr/lib/jdk/12/bin
# java 8
#export PATH=/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH

# anaconda
#export PATH=/home/andrew/anaconda3/bin:$PATH

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
