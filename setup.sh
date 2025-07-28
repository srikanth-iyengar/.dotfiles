#!/bin/bash

# sudo apt-get update
# sudo apt install stow

stow -v zsh
stow -v tmux
stow -v git
#stow -v nvim
mkdir -p ~/.config/nvim && stow -v -t $HOME/.config/nvim nvim
mkdir -p ~/.config/wofi && stow -v -t $HOME/.config/wofi wofi
mkdir -p ~/.config/hypr && stow -v -t $HOME/.config/hypr hypr


