# fix issue with steam and 32bit nvidia libs for manually installed drivers
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib32:$HOME/.steam/bin32"

# less coloring
export LESS="--RAW-CONTROL-CHARS"
export LESSOPEN="| /usr/bin/highlight %s --out-format --line-numbers xterm256 --force"
[[ -f ~/.config/less/termcap ]] && . ~/.config/less/termcap

export PATH="$HOME/opt/bin:$PATH"

export RISCV="$HOME/opt/riscv-tools"
export PATH="$RISCV/bin:$PATH"

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

# deno
export DENO_INSTALL="/home/andrew/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# please
export PATH="$HOME/.please/:$PATH"

# maven
export PATH="$HOME/opt/maven/apache-maven-3.6.3/bin:$PATH"

# steam runtime
#export PATH="/opt/steam-runtime/bin:$PATH"

# java 12
#export PATH=/usr/lib/jdk/12/bin:$PATH
#export JAVA_HOME=/usr/lib/jdk/12/bin
# java 8
#export PATH=/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH
#export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH

# anaconda
#export PATH=/home/andrew/anaconda3/bin:$PATH

# Vim FZF
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/home/andrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
    #eval "$__conda_setup"
#else
    #if [ -f "/home/andrew/anaconda3/etc/profile.d/conda.sh" ]; then
        #. "/home/andrew/anaconda3/etc/profile.d/conda.sh"
    #else
        #export PATH="/home/andrew/anaconda3/bin:$PATH"
    #fi
#fi
#unset __conda_setup
# <<< conda initialize <<<


## steam & ldd
#local ldd_path1="/home/andrew/.steam/debian-installation/ubuntu12_32/steam-runtime/lib/x86_64-linux-gnu"
#local ldd_path2="/home/andrew/.local/share/Steam/ubuntu12_32/steam-runtime/lib/i386-linux-gnu"

#export LD_LIBRARY_PATH="${ldd_path1}:${ldd_path2}:${LD_LIBRARY_PATH}"
