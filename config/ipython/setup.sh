set -x
local_dir="$(pwd)/$(dirname "$0")"
ipython_dir="${HOME}/.ipython/profile_default"

mkdir -p "${ipython_dir}"

mkdir -p "${ipython_dir}/startup"

echo "Linking startup files..."
for f in "${local_dir}/profile_default/startup"/*; do
    ln -sf "${f}" "${ipython_dir}/startup/$(basename "${f}")"
done
