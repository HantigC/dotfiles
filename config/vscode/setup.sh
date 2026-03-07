platform=$(uname -s 2>/dev/null || echo "$OS")

case "$platform" in
    Darwin)
        vscode_dir="${HOME}/Library/Application Support/Code/User"
        ;;
    Linux)
        vscode_dir="${HOME}/.config/Code/User"
        ;;
    MINGW* | MSYS* | CYGWIN* | Windows_NT)
        vscode_dir="${APPDATA}/Code/User"
        ;;
    *)
        echo "Unknown platform: $platform"
        exit 1
        ;;
esac

local_dir=$(dirname "$0")
echo "Platform: ${platform}, Location dir:${vscode_dir}"
echo "Linking settings for vscode..."
ln -s "${local_dir}/settings.json" "${vscode_dir}/settings.json"

echo "Linking keybindings for vscode..."
ln -s "${local_dir}/keybindings.json" "${vscode_dir}/keybindings.json"

echo "Installing extensions..."
install_extension() {
    echo "Installing extension '${1}'"
    code --install-extension "$1"
}
export -f install_extension
echo 
xargs -I {} bash -c 'install_extension "$@"' _ {} < "${local_dir}/extensions.txt"
