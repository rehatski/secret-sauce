

# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed!"
fi

# Installing brew packages
brew bundle --file=Brewfile

# Installing tpm plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

bash link-config-files.sh
