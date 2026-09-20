. "$PSScriptRoot\..\..\lib.ps1"

$ipythonDir = Join-Path $env:USERPROFILE '.ipython\profile_default'

Write-Host 'Linking startup files...'
Get-ChildItem "$PSScriptRoot\profile_default\startup" -File | ForEach-Object {
    New-DotfileLink $_.FullName (Join-Path $ipythonDir "startup\$($_.Name)")
}
