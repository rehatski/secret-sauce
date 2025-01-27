#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
vscodeFolderPath="$HOME/Library/Application Support/Code/User"
nvimFolderPath="$HOME/.config/nvim"
nvimBackupPath="$HOME/.config/nvim_bk"
tmuxConfFile="$HOME/.tmux.conf"
tmuxBackupFile="$HOME/.tmux_bk.conf"

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


OH_MY_ZSH_RC="$HOME/.zshrc"
BACKUP_ZSH_RC="$HOME/.zshrc_oh_my_zsh_backup"
CUSTOM_ZSH="zsh_custom"
OH_MY_ZSH_RC="$HOME/.zshrc"

create_symlink "$BASEDIR/$CUSTOM_ZSH" "$HOME/.$CUSTOM_ZSH"
# Link custom config if not already sourced
if ! grep -q "source \"$CUSTOM_ZSH\"" "$OH_MY_ZSH_RC"; then
    echo "Linking custom Zsh configuration in .zshrc..."
    echo -e "\nif [ -f \"$HOME/.$CUSTOM_ZSH\" ]; then\n    source \"$HOME/.$CUSTOM_ZSH\"\nfi" >> "$OH_MY_ZSH_RC"
else
    echo "Custom Zsh configuration already linked in .zshrc. Skipping."
fi

# NVM configuration block
NVM_CONFIG='
# Load nvm
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
'

# Check if the NVM configuration is already in .zshrc
if ! grep -q "export NVM_DIR=" "$ZSHRC"; then
    echo "Adding NVM configuration to .zshrc..."
    echo "$NVM_CONFIG" >> "$OH_MY_ZSH_RC"
else
    echo "NVM configuration already exists in .zshrc. Skipping."
fi


echo "Reloading .zshrc..."
source "$OH_MY_ZSH_RC"