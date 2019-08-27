#!/bin/zsh

rm ~/.zshrc
ln $HOME/.dotfiles/.zshrc $HOME/.zshrc

rm ~/.skhdrc
ln $HOME/.dotfiles/.skhdrc $HOME/.skhdrc

rm ~/.chunkwmrc
ln $HOME/.dotfiles/.chunkwmrc $HOME/.chunkwmrc

rm ~/.gemrc
ln $HOME/.dotfiles/.gemrc $HOME/.gemrc

rm ~/.gitconfig
ln $HOME/.dotfiles/.gitconfig $HOME/.gitconfig

rm -rf ~/.config/alacritty
mkdir ~/.config/alacritty
ln $HOME/.dotfiles/config/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
