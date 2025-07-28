#!/bin/bash

stow -D tmux
stow -D zsh
stow -D git
stow -D -v -t $HOME/.config/nvim nvim
stow -D -v -t $HOME/.config/wofi wofi
stow -D -v -t $HOME/.config/hypr hypr
