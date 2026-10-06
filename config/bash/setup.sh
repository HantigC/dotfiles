set -x
platform=$(uname -s 2>/dev/null || echo "$OS")

case "$platform" in
    Darwin)
        # macOS terminals start bash as a login shell, which reads
        # ~/.bash_profile and skips ~/.bashrc.
        bash_rc_file="${HOME}/.bash_profile"
        ;;
    Linux)
        # Linux terminals start bash as an interactive non-login shell,
        # which reads ~/.bashrc.
        bash_rc_file="${HOME}/.bashrc"
        ;;
    *)
        echo "Unknown platform: $platform"
        exit 1
        ;;
esac

# zsh reads ~/.zshrc for every interactive shell on both macOS and Linux.
zsh_rc_file="${HOME}/.zshrc"

local_dir="$(pwd)/$(dirname "$0")"
local_bash_settings="${local_dir}/.bash_settings"
source_line="source \"${local_bash_settings}\""

for rc_file in "${bash_rc_file}" "${zsh_rc_file}"; do
    echo "Sourcing settings from ${rc_file}..."
    touch "${rc_file}"
    if ! grep -qxF "${source_line}" "${rc_file}"; then
        # If the file doesn't end with a newline, add one so the source line
        # lands on its own line instead of being glued to the last one.
        [ -n "$(tail -c1 "${rc_file}")" ] && echo >> "${rc_file}"
        echo "${source_line}" >> "${rc_file}"
    fi
done
