###########################
##### System Settings #####
###########################

export TERM=xterm-256color

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

########################
##### Applications #####
########################

# ZSH 
export UPDATE_ZSH_DAYS=1

# Rust: Cargo
export PATH=$HOME/.cargo/bin:$PATH


# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
#export PATH="$HOME/.rbenv/bin:$PATH"

# openssl compatibility issues
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
# RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl" rbenv install 2.3.8

# go
export GOPATH="$HOME/.go"

# python
#export PATH=/usr/local/share/python:$PATH

# anaconda
export PATH=/usr/local/anaconda3/bin:$PATH

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# sdl2
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/lib"
