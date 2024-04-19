#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
echo ${BASEDIR}
vscodeFolderPath="Library/Application Support/Code/User"
userPath=~

echo "Linking your sauce dot files"

echo "Linking NVIM config"
nvimFolderPath=".config/nvim"
nvimBackUpFolderPath=".config/nvim_bk"

# backing up existing nvim config folder
if [ -d "$userPath/$nvimFolderPath" ]; then
	mv "$userPath/$nvimFolderPath" "$userPath/$nvimBackUpFolderPath"
	echo "Moved original nvim folder to nvim_bk"
fi

ln -s ${BASEDIR}/nvim ~/.config/

echo "Linking VSCode settings"
settingsJSON="settings.json"
backupSettingsJSON="settings_bk.json"

# backing up existing settings.json file
if [ -f "$userPath/$vscodeFolderPath/$settingsJSON" ]; then
	mv "$userPath/$vscodeFolderPath/$settingsJSON" "$userPath/$vscodeFolderPath/$backupSettingsJSON"
	echo "Moved original settings.json to settings_bk.json"
fi

ln -s ${BASEDIR}/vscode/settings.json ~/"${vscodeFolderPath}/$settingsJSON"


echo "Linking VSCode keybindings"
keybindingsJSON="keybindings.json"
backupKeybindingsJSON="keybindings_bk.json"

# backing up existing keybindings.json file
if [ -f "$userPath/$vscodeFolderPath/$keybindingsJSON" ]; then
	mv "$userPath/$vscodeFolderPath/$keybindingsJSON" "$userPath/$vscodeFolderPath/$backupKeybindingsJSON"
	echo "Moved original keybindings.json to keybindings_bk.json"
fi

ln -s ${BASEDIR}/vscode/"$keybindings.json" ~/"${vscodeFolderPath}/$keybindingsJSON"
