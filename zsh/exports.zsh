# ZSH 
export ZSH=/Users/andrew/.oh-my-zsh
export UPDATE_ZSH_DAYS=1

# Rust: Cargo
export PATH=$HOME/.cargo/bin:$PATH

### MYSQL
export PATH="/usr/local/mysql/bin:$PATH"

# Custom
########

export TERM=xterm-256color

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'

# Lang and Locale
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/usr/local/Cellar/openssl/1.0.2e_1/lib
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"

#export LDFLAGS=-L/usr/local/opt/libxml2/lib
#export CPPFLAGS=-I/usr/local/opt/libxml2/include
#export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig

#########
# Apps
#########

# taskwarrior
export TASKRC=~/.config/task/config

export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Vim FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'

# GOLANG

#export GOPATH="${HOME}/.go"
#export GOROOT="$(brew --prefix golang)/libexec"
#export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#test -d "${GOPATH}" || mkdir "${GOPATH}"
#test -d "${GOPATH}/src/github.com" || mkdir -p "${GOPATH}/src/github.com"
