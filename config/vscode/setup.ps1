. "$PSScriptRoot\..\..\lib.ps1"

$vscodeDir = Join-Path $env:APPDATA 'Code\User'

Write-Host 'Linking settings for vscode...'
New-DotfileLink "$PSScriptRoot\settings.json" (Join-Path $vscodeDir 'settings.json')

Write-Host 'Linking keybindings for vscode...'
New-DotfileLink "$PSScriptRoot\keybindings.json" (Join-Path $vscodeDir 'keybindings.json')

Write-Host 'Installing extensions...'
Get-Content "$PSScriptRoot\extensions.txt" |
    ForEach-Object { $_.Trim() } |
    Where-Object { $_ } |
    ForEach-Object {
        Write-Host "Installing extension '$_'"
        code --install-extension $_
    }
