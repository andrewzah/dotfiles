# Cargo / Rust
export PATH="$HOME/.cargo/bin:$PATH"

# nvm
#export NVM_DIR=~/.nvm
#source $(brew --prefix nvm)/nvm.sh

# python
export PATH=/usr/local/share/python:$PATH

# if rbenv is present, configure it for use
if which rbenv &> /dev/null; then
    # Put the rbenv entry at the front of the line
    export PATH="$HOME/.rbenv/bin:$PATH"
# rbenv
eval "$(rbenv init -)"

# nvm
source /usr/share/nvm/init-nvm.sh
