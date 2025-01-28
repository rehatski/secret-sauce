#!/bin/bash

ZSHRC="$HOME/.zshrc"
OH_MY_ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    echo "Cloning Powerlevel10K"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$OH_MY_ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Oh My Zsh is already installed!"
fi

# Set Powerlevel10k as the default theme 
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$ZSHRC"

# Clone zsh-autosuggestions if not already installed
if [ ! -d "$OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
    echo "Cloning zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$OH_MY_ZSH_CUSTOM/plugins/zsh-autosuggestions"
else
    echo "zsh-autosuggestions is already installed. Skipping clone."
fi

# Add zsh-autosuggestions to plugins in .zshrc if not already present
if ! grep -q "zsh-autosuggestions" "$ZSHRC"; then
    echo "Adding zsh-autosuggestions to plugins in .zshrc..."
    sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' "$ZSHRC"
else
    echo "zsh-autosuggestions is already in the plugins list. Skipping."
fi

# Clone zsh-syntax-highlighting if not already installed
if [ ! -d "$OH_MY_ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
    echo "Cloning zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$OH_MY_ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
    echo "zsh-syntax-highlighting is already installed. Skipping clone."
fi

# Add zsh-syntax-highlighting to plugins in .zshrc if not already present
if ! grep -q "zsh-syntax-highlighting" "$ZSHRC"; then
    echo "Adding zsh-syntax-highlighting to plugins in .zshrc..."
    sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-syntax-highlighting)/' "$ZSHRC"
else
    echo "zsh-syntax-highlighting is already in the plugins list. Skipping."
fi

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
THEME_FILES="$BASEDIR/iterm-themes"

# Check if the folder exists
if [ -d "$THEME_FILES" ]; then
    echo "Opening all theme files for iTerm..."
    open "$THEME_FILES"/*
else
    echo "Error: Folder does not exist: $THEME_FILES"
fi
