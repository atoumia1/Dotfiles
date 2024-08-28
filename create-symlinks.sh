#!/bin/bash

dotfiles_dir=~/dotfiles

# Create symlinks

ln -sf $dotfiles_dir/nvim ~/.config/nvim
ln -sf $dotfiles_dir/zsh ~/.config/zsh
ln -sf $dotfiles_dir/.zshenv ~/.zshenv
