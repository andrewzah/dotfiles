#!/usr/bin/env bash

set -e
set -x

DOTFILES_DIR=$HOME/.dotfiles
CONFIG_DIR=$HOME/.config

# for nvidia:
# curl latest unix driver from here: https://www.nvidia.com/en-us/drivers/unix/
# i.e. curl http://us.download.nvidia.com/XFree86/Linux-x86_64/440.100/NVIDIA-Linux-x86_64-440.100.run
# then run it NOT while Xorg is running, and uninstall any nvidia-drivers packages from apt

# not included programs:
# * youtube-dl (can't update itself if installed via apt)
# * pipewire (needs to be built from latest source currently)
doas apt install -y \
  a2jmidid \
  acpi \
  anki \
  apt-transport-https \
  bc \
  bison \
  build-essential \
  ca-certificates \
  chromium \
  chromium-sandbox \
  clang \
  cmake \
  curl \
  dbus-x11 \
  default-jdk \
  default-libmysqlclient-dev \
  dnsutils \
  exa \
  fcitx \
  fcitx-hangul \
  feh \
  ffmpeg \
  firefox-esr \
  flex \
  fontconfig \
  fonts-nanum \
  fonts-nanum-coding \
  git \
  git-lfs \
  gmtp \
  gnupg \
  gnupg-agent \
  htop \
  i3 \
  i3lock \
  imagemagick \
  jq \
  libexpat1-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libpam0g-dev \
  libpq-dev \
  libreadline-dev \
  libsqlite3-dev \
  libssl-dev \
  libx11-xcb-dev \
  libxcb-render0-dev \
  libxcb-shape0-dev \
  libxcb-xfixes0-dev \
  lld \
  llvm \
  lm-sensors \
  make \
  mediainfo \
  neofetch \
  neovim \
  pavucontrol \
  peek \
  pkg-config \
  polybar \
  psmisc \
  pulseaudio \
  pulseaudio-module-jack \
  qjackctl \
  ripgrep \
  rsync \
  scrot \
  software-properties-common \
  sqlite3 \
  sxiv \
  telegram-desktop \
  thunar \
  thunderbird \
  tmux \
  unzip \
  xautolock \
  xorg \
  yamllint \
  zsh

mkdir -p "$HOME/programming"
mkdir -p "$HOME/work"
mkdir -p "$HOME/sync/general/personal"
mkdir -p "$HOME/opt/debs"
mkdir -p "$HOME/opt/bin"

if [ ! -d $DOTFILES_DIR ]; then
  git clone 'https://git.sr.ht/~andrewzah/dotfiles' "$DOTFILES_DIR"
  touch $DOTFILES_DIR/zsh/secret-exports.zsh

  touch "$HOME/sync/general/personal/.shell-history.debian-desktop"

  cd $DOTFILES_DIR \
    && git remote remove origin \
    && git remote add origin 'git@github.com:azah/dotfiles.git'
fi

if [ ! -f "$HOME/.zshrc" ]; then
  ln -s "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
fi

if [ ! -f "$HOME/.gitconfig" ]; then
  ln -s "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
fi

if [ ! -f "$HOME/.xinitrc" ]; then
  ln -s "$DOTFILES_DIR/.xinitrc" "$HOME/.xinitrc"
fi

if [ ! -f "$HOME/.Xresources" ]; then
  ln -s "$DOTFILES_DIR/.Xresources" "$HOME/.Xresources"
  xrdb "$HOME/.Xresources"
fi

if [ ! -f "$HOME/.gemrc" ]; then
  ln -s "$DOTFILES_DIR/.gemrc" "$HOME/.gemrc"
fi

mkdir -p "$CONFIG_DIR/i3"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/polybar"

if [ -f "$CONFIG_DIR/i3/config" ]; then
  rm "$CONFIG_DIR/i3/config"
fi
ln -s "$DOTFILES_DIR/config/i3/config" "$CONFIG_DIR/i3/config"

if [ ! -f "$CONFIG_DIR/i3/polybar.sh" ]; then
  ln -s "$DOTFILES_DIR/config/i3/polybar.sh" "$CONFIG_DIR/i3/polybar.sh"
fi

if [ ! -f "$CONFIG_DIR/polybar/config" ]; then
  ln -s "$DOTFILES_DIR/config/polybar/config" "$CONFIG_DIR/polybar/config"
fi


if [ ! -f "$CONFIG_DIR/nvim/init.vim" ]; then
  ln -s "$DOTFILES_DIR/config/nvim/init.vim" "$CONFIG_DIR/nvim/init.vim"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim -c ":Silent ':PlugInstall'"
fi

###### install programs

if [ ! -f "/usr/local/bin/lock" ]; then
  doas ln -s "$DOTFILES_DIR/scripts/lock" "/usr/local/bin/lock"
fi

if [ ! -f "$HOME/.cargo/bin/rustc" ]; then
  curl https://sh.rustup.rs -sSf | sh -s -- -y
fi
export PATH="$HOME/.cargo/bin:$PATH"

if [ ! -f "/usr/local/bin/alacritty" ]; then
  alacritty_dir="$HOME/programming/rust/alacritty"
  if [ ! -d "$alacritty_dir" ]; then
    git clone https://github.com/alacritty/alacritty.git "$alacritty_dir"
  fi

  cd "$alacritty_dir"
  cargo build --release
  doas mv ./target/release/alacritty /usr/local/bin/alacritty
fi

if [ ! -d "/usr/local/go" ]; then
  if [ ! -d "$HOME/.go" ]; then
    mkdir -p "$HOME/.go/src/github.com/azah" 
  fi

  go_ver="1.14"
  curl -L "https://dl.google.com/go/go${go_ver}.linux-amd64.tar.gz" -o /tmp/go.tar.gz
  doas tar xvfz /tmp/go.tar.gz -C /usr/local
fi

if [ ! -f "/usr/bin/docker" ]; then
  curl -fsSL https://download.docker.com/linux/debian/gpg | doas apt-key add -
   doas add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

   doas apt update
   doas apt install -y docker-ce docker-ce-cli containerd.io
   doas usermod -aG docker andrew
   doas docker run hello-world
fi

if [ ! -f "/usr/local/bin/docker-compose" ]; then
  doas curl -L "https://github.com/docker/compose/releases/download/1.23.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
fi

if [ ! -d "$HOME/.nvm" ]; then
  git clone 'https://github.com/nvm-sh/nvm.git' "$HOME/.nvm"
  source "$HOME/.nvm/nvm.sh" && nvm install --latest-npm
fi

if [ ! -d "$HOME/.rbenv" ]; then
  git clone 'https://github.com/rbenv/rbenv.git' "$HOME/.rbenv"

  mkdir -p "$HOME/.rbenv/plugins"
  git clone 'https://github.com/rbenv/ruby-build.git' "$HOME/.rbenv/plugins/ruby-build"
fi

if [ ! -f "/usr/bin/mongo" ]; then
  wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | doas apt-key add -
  echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.2 main" | doas tee /etc/apt/sources.list.d/mongodb-org-4.2.list
  doas apt update
  doas apt install -y mongodb-org
fi

if [ ! -f "$HOME/.cargo/bin/as-tree" ]; then
  cargo install -f --git https://github.com/jez/as-tree
fi

if [ ! -f "/usr/local/bin/steam" ]; then
  grep -q "non-free" /etc/apt/sources.list
  doas dpkg --add-architecture i386
  doas apt update
  doas apt install steam
fi

echo "complete!"
