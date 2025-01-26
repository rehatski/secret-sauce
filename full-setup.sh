

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Install Powerlevel10k theme
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
else
    echo "Oh My Zsh is already installed!"
fi



# Set Powerlevel10k as the default theme 
sed -i '' 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# Install Meslo Nerd Font
brew tap homebrew/cask-fonts
brew install --cask font-meslo-lg-nerd-font


# Installing brew packages
brew bundle --file=Brewfile

# Installing tpm plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
sed -i '' 's/^plugins=(\(.*\))/plugins=(\1 zsh-autosuggestions)/' ~/.zshrc

bash link-config-files.sh

defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15
defaults write -g com.apple.swipescrolldirection -bool false

killall cfprefsd
killall Dock
killall Finder




# Source the .zshrc to apply changes
source ~/.zshrc