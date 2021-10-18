#############################
### GENERAL SYSTEM CONFIG ###
#############################

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='nvim'
export VISUAL="$EDITOR"
export TERM='xterm-256color'

# This resolves issues install the mysql, postgres, and other gems with native non universal binary extensions
export ARCHFLAGS='-arch x86_64'

# fix gpg hanging on git commit
export GPG_TTY=$(tty)

export OPENSSL_CONF="/etc/ssl"

#######################
### PROGRAM CONFIGS ###
#######################

# less coloring
export LESS="--RAW-CONTROL-CHARS"
export LESSOPEN="| /usr/bin/highlight %s --out-format --line-numbers xterm256 --force"
[[ -f ~/.config/less/termcap ]] && . ~/.config/less/termcap

# vim fzf
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_DEFAULT_OPTS="--ansi"

# system coloring
[ -f "/etc/grc.zsh" ] && source "/etc/grc.zsh"

##########################
### PATH MODIFICATIONS ###
##########################

# andrew's random binaries, typically .AppImages
# currently: joplin, bitwarden, carla, cubiomes-viewer,
#   jetbrains, sauerbraten, slippi, winbox
export PATH="$HOME/opt/bin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"

# python binaries ?
export PATH="$HOME/.local/bin:$PATH"

# riscv sdk / compilation
export RISCV="$HOME/opt/riscv-tools"
export PATH="$RISCV/bin:$PATH"

# *nix programs
#export PATH="/home/andrew/.local/bin:$PATH"
#source ~/.nix-profile/etc/profile.d/nix.sh

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"

export NVM_DIR="$HOME/.nvm"

# rust/cargo
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

#############################
### BUG/COMPILATION FIXES ###
#############################

# ... mostly steam related on debian bullseye + xorg/i3
#   + nvidia 2070 super ftw3 gpu + nvidia drivers/libs installed manually

# steam runtime
#export PATH="/opt/steam-runtime/bin:$PATH"

# fix issue with steam and 32bit nvidia libs for manually installed drivers
#export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/lib32:$HOME/.steam/bin32"

## steam & ldd
#local ldd_path1="/home/andrew/.steam/debian-installation/ubuntu12_32/steam-runtime/lib/x86_64-linux-gnu"
#local ldd_path2="/home/andrew/.local/share/Steam/ubuntu12_32/steam-runtime/lib/i386-linux-gnu"

#export LD_LIBRARY_PATH="${ldd_path1}:${ldd_path2}:${LD_LIBRARY_PATH}"
