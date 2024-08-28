#!/bin/bash

dotfiles_dir=$HOME/dotfiles

# Array of files/folders to link
declare -A links
links=(
    ["$dotfiles_dir/nvim"]="$HOME/.config/nvim"
    ["$dotfiles_dir/zsh"]="$HOME/.config/zsh"
    ["$dotfiles_dir/.zshenv"]="$HOME/.zshenv"
)

# Function to create symlinks
create_link() {
    echo "Creating symlink: $2 -> $1"
    ln -sf "$1" "$2"
    if [ $? -eq 0 ]; then
        echo "Successfully created symlink: $2 -> $1"
    else
        echo "Failed to create symlink: $2"
    fi
    echo
}

# Function to delete symlinks
delete_link() {
    if [ -L "$2" ]; then
        echo "Deleting symlink: $2"
        rm -f "$2"
        if [ $? -eq 0 ]; then
            echo "Successfully deleted symlink: $2"
        else
            echo "Failed to delete symlink: $2"
        fi
    else
        echo "No symlink found at: $2"
    fi
    echo
}

# Prompt the user to create or delete links
echo "What would you like to do?"
echo "1) Create symlinks"
echo "2) Delete symlinks"
read -p "Choose an option (1 or 2): " option
echo

# Handle user choice
if [ "$option" == "1" ]; then
    # Creating the symlinks
    for src in "${!links[@]}"; do
        dest="${links[$src]}"
        create_link "$src" "$dest"
    done
elif [ "$option" == "2" ]; then
    # Deleting the symlinks
    for src in "${!links[@]}"; do
        dest="${links[$src]}"
        delete_link "$src" "$dest"
    done
else
    echo "Invalid option. Exiting."
    exit 1
fi
