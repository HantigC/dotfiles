set -x
platform=$(uname -s 2>/dev/null || echo "$OS")

case "$platform" in
    Darwin | Linux)
        # Zed intentionally uses the same XDG-style config path on macOS and
        # Linux (unlike VS Code's per-platform "Application Support" dirs).
        zed_dir="${HOME}/.config/zed"
        ;;
    MINGW* | MSYS* | CYGWIN* | Windows_NT)
        zed_dir="${APPDATA}/Zed"
        ;;
    *)
        echo "Unknown platform: $platform"
        exit 1
        ;;
esac

mkdir -p "${zed_dir}"

local_dir="$(pwd)/$(dirname "$0")"
echo "Linking settings for zed..."
ln -s "${local_dir}/settings.json" "${zed_dir}/settings.json"

echo "Linking keymap for zed..."
ln -s "${local_dir}/keymap.json" "${zed_dir}/keymap.json"

echo "Installing font-fira-code"
brew install font-fira-code

# Unlike VS Code, Zed has no CLI extension-install flag. Extensions listed
# under "auto_install_extensions" in settings.json are installed/kept in
# sync automatically the next time Zed launches, so there's no install loop
# to run here.
