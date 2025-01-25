#!/bin/bash

# Stop script if any command fails
set -e

# Function to print messages
print_message() {
    echo -e "\n\033[1;32m$1\033[0m\n"
}

# 1. Install Xcode Command Line Tools
print_message "Installing Xcode Command Line Tools..."
if ! xcode-select -p &>/dev/null; then
    xcode-select --install
    print_message "Please complete the installation and re-run this script!"
    exit 1
fi

# 2. Install Homebrew
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

# 3. Install Git and GitHub CLI
print_message "Installing Git and GitHub CLI..."
brew install git gh

# 4. Authenticate GitHub CLI (optional, but recommended)
print_message "Authenticating GitHub CLI..."
if ! gh auth status &>/dev/null; then
    gh auth login
fi

# 5. Clone the Setup Repository
REPO_URL="https://github.com/rehatski/secret-sauce.git"  # Replace with your repo URL
REPO_DIR="$HOME/repos"

print_message "Cloning setup repository..."
if [ -d "$REPO_DIR" ]; then
    print_message "Repository already exists at $REPO_DIR. Skipping clone."
else
    git clone "$REPO_URL" "$REPO_DIR"
fi

# 6. Run the Setup Script
print_message "Running setup script..."
cd "$REPO_DIR"
bash full-setup.sh

print_message "Bootstrap completed! Your Mac is now set up."

