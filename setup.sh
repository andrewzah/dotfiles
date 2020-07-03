#!/usr/bin/env bash

set -e
set -x

DOTFILES_DIR=$HOME/.dotfiles
CONFIG_DIR=$HOME/.config

# for nvidia:
# curl latest unix driver from here: https://www.nvidia.com/en-us/drivers/unix/
# i.e. curl http://us.download.nvidia.com/XFree86/Linux-x86_64/440.100/NVIDIA-Linux-x86_64-440.100.run
# then run it NOT while Xorg is running, and uninstall any nvidia-drivers packages from apt

sudo apt install -y \
  apt-transport-https \
  ca-certificates \
  cmake \
  curl \
  dnsutils \
  exa \
  fcitx \
  fcitx-hangul \
  feh \
  firefox-esr \
  fontconfig \
  fonts-nanum \
  fonts-nanum-coding \
  fzf \
  git \
  gnupg \
  gnupg-agent \
  htop \
  i3 \
  i3lock \
  imagemagick \
  libexpat1-dev \
  libfontconfig1-dev \
  libfreetype6-dev \
  libx11-xcb-dev \
  libxcb-render0-dev \
  libxcb-shape0-dev \
  libxcb-xfixes0-dev \
  neofetch \
  neovim \
  pavucontrol \
  peek \
  pkg-config \
  psmisc \
  pulseaudio \
  pulseaudio-module-jack \
  qjackctl \
  ripgrep \
  rsync \
  scrot \
  software-properties-common \
  sxiv \
  thunar \
  thunderbird \
  unzip \
  xautolock \
  xorg

grep -qF "buster-backports" /etc/apt/sources.list \
  || echo 'deb http://deb.debian.org/debian buster-backports main contrib non-free' | sudo tee -a "/etc/apt/sources.list" \
    && sudo apt update

sudo apt -t buster-backports install -y polybar

grep -qF \
    "load-module module-loopback source=jack_in sink=alsa_output.usb-Schiit_Audio_Modi_Multibit-00.analog-stereo channels=2" \
    "/etc/pulse/default.pa" \
  || cat "$DOTFILES_DIR/pulse-audio-mods" | sudo tee -a "/etc/pulse/default.pa"


mkdir -p "$HOME/programming"
mkdir -p "$HOME/work"
mkdir -p "$HOME/sync/general/personal"

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

if [ ! -f "$HOME/.gemrc" ]; then
  ln -s "$DOTFILES_DIR/.gemrc" "$HOME/.gemrc"
fi

mkdir -p "$CONFIG_DIR/alacritty"
mkdir -p "$CONFIG_DIR/i3"
mkdir -p "$CONFIG_DIR/nvim"
mkdir -p "$CONFIG_DIR/polybar"

if [ ! -f "$CONFIG_DIR/alacritty/alacritty.yml" ]; then
  ln -s "$DOTFILES_DIR/config/alacritty/alacritty.yml" "$CONFIG_DIR/alacritty/alacritty.yml"
fi

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

THOUGHTS_DIR="$HOME/sync/general/thoughts"
mkdir -p "$THOUGHTS_DIR/data"
mkdir -p "$THOUGHTS_DIR/dnd"
mkdir -p "$THOUGHTS_DIR/korean"
mkdir -p "$THOUGHTS_DIR/programming"
mkdir -p "$THOUGHTS_DIR/tools"
mkdir -p "$THOUGHTS_DIR/work"

if [ ! -f "$CONFIG_DIR/nvim/init.vim" ]; then
  ln -s "$DOTFILES_DIR/config/nvim/init.vim" "$CONFIG_DIR/nvim/init.vim"
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  nvim -c ":Silent ':PlugInstall'"
fi

###### install programs

if [ ! -f "/usr/local/bin/lock" ]; then
  sudo ln -s "$DOTFILES_DIR/scripts/lock" "/usr/local/bin/lock"
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
  sudo mv ./target/release/alacritty /usr/local/bin/alacritty
fi

if [ ! -d "/usr/local/go" ]; then
  if [ ! -d "$HOME/.go" ]; then
    mkdir -p "$HOME/.go/src/github.com/azah" 
  fi

  go_ver="1.14"
  curl -L "https://dl.google.com/go/go${go_ver}.linux-amd64.tar.gz" -o /tmp/go.tar.gz
  sudo tar xvfz /tmp/go.tar.gz -C /usr/local
fi

if [ ! -f "/usr/bin/docker" ]; then
  curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
   sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) \
    stable"

   sudo apt update
   sudo apt install -y docker-ce docker-ce-cli containerd.io
   sudo usermod -aG docker andrew
   sudo docker run hello-world
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

if [ ! -f "/usr/games/steam" ]; then
  sudo dpkg --add-architecture i386
  sudo apt update
  sudo apt install -y steam
fi

if [ ! -f "/usr/bin/riot-desktop" ]; then
  sudo wget -O /usr/share/keyrings/riot-im-archive-keyring.gpg https://packages.riot.im/debian/riot-im-archive-keyring.gpg
  echo "deb [signed-by=/usr/share/keyrings/riot-im-archive-keyring.gpg] https://packages.riot.im/debian/ default main" |
    sudo tee /etc/apt/sources.list.d/riot-im.list
  sudo apt update
  sudo apt install -y riot-desktop
fi
