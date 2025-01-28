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


# List of extensions to install
extensions=(
  dbaeumer.vscode-eslint
  donjayamanne.githistory
  dracula-theme.theme-dracula
  dsznajder.es7-react-js-snippets
  eamodio.gitlens
  enkia.tokyo-night
  esbenp.prettier-vscode
  formulahendry.auto-rename-tag
  github.github-vscode-theme
  github.vscode-github-actions
  gruntfuggly.todo-tree
  jdinhlife.gruvbox
  kamikillerto.vscode-colorize
  mhutchie.git-graph
  pkief.material-icon-theme
  pranaygp.vscode-css-peek
  standard.vscode-standard
  streetsidesoftware.code-spell-checker
  vadimcn.vscode-lldb
  vscode-icons-team.vscode-icons
  vscodevim.vim
  wayou.vscode-todo-highlight
  wix.glean
)

echo "Installing VS Code extensions..."
for extension in "${extensions[@]}"; do
    echo "Installing $extension..."
    code --install-extension "$extension"
done

echo "All extensions installed!"
