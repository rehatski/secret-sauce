#!/bin/bash

ZSHRC="$HOME/.zshrc"

# NVM configuration block
NVM_CONFIG='
# Load nvm
export NVM_DIR="$HOME/.nvm"
export NVM_SYMLINK_CURRENT=true
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
'

# Check if the NVM configuration is already in .zshrc
if ! grep -q "export NVM_SYMLINK_CURRENT=true" "$ZSHRC"; then
    echo "Adding NVM configuration to .zshrc..."
    echo "$NVM_CONFIG" >> "$ZSHRC"
else
    echo "NVM configuration already exists in .zshrc. Skipping."
fi

npm i -g tsx
