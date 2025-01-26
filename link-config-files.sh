#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
vscodeFolderPath="$HOME/Library/Application Support/Code/User"
nvimFolderPath="$HOME/.config/nvim"
nvimBackupPath="$HOME/.config/nvim_bk"
tmuxConfFile="$HOME/.tmux.conf"
tmuxBackupFile="$HOME/.tmux_bk.conf"

OH_MY_ZSH_RC="$HOME/.zshrc"
CUSTOM_ZSH_RC="$BASEDIR/zshrc"  # Path to your custom .zshrc
BACKUP_ZSH_RC="$HOME/.zshrc_oh_my_zsh_backup"

# Function to back up files if they are not symlinks
backup_file() {
  local target="$1"
  local backup="$2"
  if [ -f "$target" ] && [ ! -L "$target" ]; then
    mv "$target" "$backup"
    echo "Backed up $target to $backup"
  fi
}

# Function to create a symlink
create_symlink() {
  local source="$1"
  local destination="$2"

  ln -snf "$source" "$destination"
  echo "Linked $source to $destination"
}

echo "Linking your sauce dot files"

echo "Linking NVIM config"
backup_file "$nvimFolderPath" "$nvimBackupPath"
create_symlink "$BASEDIR/nvim" "$nvimFolderPath"

# echo "Linking VSCode settings"
# backup_file "$vscodeFolderPath/settings.json" "$vscodeFolderPath/settings_bk.json"
# create_symlink "$BASEDIR/vscode/settings.json" "$vscodeFolderPath/settings.json"

# backup_file "$vscodeFolderPath/keybindings.json" "$vscodeFolderPath/keybindings_bk.json"
# create_symlink "$BASEDIR/vscode/keybindings.json" "$vscodeFolderPath/keybindings.json"

echo "Linking TMUX config"
backup_file "$tmuxConfFile" "$tmuxBackupFile"
create_symlink "$BASEDIR/tmux.conf" "$tmuxConfFile"


echo "Merging custom zshrc with home zshrc"
if [ -f "$OH_MY_ZSH_RC" ]; then
    echo "Backing up Oh My Zsh .zshrc to $BACKUP_ZSH_RC..."
    cp "$OH_MY_ZSH_RC" "$BACKUP_ZSH_RC"
fi
if [ -f "$CUSTOM_ZSH_RC" ]; then
    echo "Merging custom .zshrc into Oh My Zsh .zshrc..."
    cat "$CUSTOM_ZSH_RC" >> "$OH_MY_ZSH_RC"
else
    echo "Custom .zshrc not found at $CUSTOM_ZSH_RC. Skipping merge."
fi

echo "Reloading .zshrc..."
source "$OH_MY_ZSH_RC"