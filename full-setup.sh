
ZSHRC="$HOME/.zshrc"
OH_MY_ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Install Powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$OH_MY_ZSH_CUSTOM/themes/powerlevel10k"
else
    echo "Oh My Zsh is already installed!"
fi



# Set Powerlevel10k as the default theme 
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install Meslo Nerd Font
brew tap homebrew/cask-fonts
brew install font-hack-nerd-font
brew install --cask font-meslo-lg-nerd-font


# Installing brew packages
brew bundle --file=Brewfile

# Installing tpm plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' "$ZSHRC" 




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

bash link-config-files.sh

defaults write -g KeyRepeat -int 2
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.swipescrolldirection -bool false

killall cfprefsd
killall Dock
killall Finder

# Source the .zshrc to apply changes
source ~/.zshrc