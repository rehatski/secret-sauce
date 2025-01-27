#!/bin/bash

# Stop script if any command fails
set -e

print_message() {
    echo -e "\n\033[1;32m$1\033[0m\n"
}

# Install Xcode Command Line Tools
print_message "Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    print_message "Please complete the installation and re-run this script!"
    exit 1
fi

# Install Homebrew
print_message "Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to .zprofile for future sessions
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$HOME/.zprofile"
    print_message "Homebrew added to .zprofile"
  
		# Ensure the Homebrew path is available in the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    print_message "Homebrew is already installed!"
fi

# Install Git and GitHub CLI
print_message "Installing Git and GitHub CLI..."
brew install git # gh

# 4. Authenticate GitHub CLI 
# print_message "Authenticating GitHub CLI..."
# if ! gh auth status &>/dev/null; then
#     gh auth login
# fi

# Clone secret-sauce repo
REPO_URL="https://github.com/rehatski/secret-sauce.git"
REPO_DIR="$HOME/repos/secret-sauce"

print_message "Cloning secret-sauce repo..."
if [ -d "$REPO_DIR" ]; then
    print_message "Repo already cloned at $REPO_DIR/secret-sauce. Skipping clone."
else
    git clone "$REPO_URL" "$REPO_DIR"
fi

# Run the full setup script
# TODO: maybe create an interactive shell app
print_message "Running full-setup script..."
cd "$REPO_DIR"
bash full-setup.sh

print_message "Bootstrap completed!"

