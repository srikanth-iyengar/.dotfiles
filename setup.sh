#!/bin/bash

stow -v zsh
stow -v tmux
stow -v git

mkdir -p ~/.config/nvim && stow -v -t $HOME/.config/nvim nvim
mkdir -p ~/.config/wofi && stow -v -t $HOME/.config/wofi wofi
mkdir -p ~/.config/hypr && stow -v -t $HOME/.config/hypr hypr
mkdir -p ~/.config/eww  && stow -v -t $HOME/.config/eww  eww

