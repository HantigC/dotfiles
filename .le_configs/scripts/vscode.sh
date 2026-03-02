platform=$(uname -s)

if [ "$platform" = "Darwin" ]; then
    ln -s "${HOME}/.config/dotfiles/.le_configs/vscode/keybindings.json" "${HOME}/Library/Application Support/Code/User/keybindings.json"
    ln -s "${HOME}/.config/dotfiles/.le_configs/vscode/settings.json" "${HOME}/Library/Application Support/Code/User/settings.json"
else
    echo "Unknown platform: $platform"
fi