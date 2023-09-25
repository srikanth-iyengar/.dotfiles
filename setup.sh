#!/bin/bash

sudo apt-get update
sudo apt install stow

stow -v zsh
stow -v tmux
mkdir -p ~/.config/nvim && stow -v -t $HOME/.config/nvim nvim
