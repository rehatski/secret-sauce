#!/bin/bash


bash brew-install-setup.sh
bash iterm-shell-setup.sh
bash js-dev-env-setup.sh
bash mac-preference-setup.sh

# Installing tpm plugin manager for tmux
git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

bash link-config-files.sh

