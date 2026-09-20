. "$PSScriptRoot\..\..\lib.ps1"

$zedDir = Join-Path $env:APPDATA 'Zed'

Write-Host 'Linking settings for zed...'
New-DotfileLink "$PSScriptRoot\settings.json" (Join-Path $zedDir 'settings.json')

Write-Host 'Linking keymap for zed...'
New-DotfileLink "$PSScriptRoot\keymap.json" (Join-Path $zedDir 'keymap.json')

# Unlike VS Code, Zed has no CLI extension-install flag. Extensions listed
# under "auto_install_extensions" in settings.json are installed/kept in
# sync automatically the next time Zed launches, so there's no install loop
# to run here. Fonts (JetBrains Mono / JetBrainsMono Nerd Font) aren't
# installed by this script on Windows; install them separately.
