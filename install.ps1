# Windows counterpart to `make setup` / `make <tool>` (no make or bash needed).
#
#   .\install.ps1            # install every config that has a setup.ps1
#   .\install.ps1 zed vscode # install only the named configs
#   .\install.ps1 -List      # show what would be installed
#
# Symlinks need an elevated PowerShell or Developer Mode enabled.
param(
    [switch]$List,
    [Parameter(ValueFromRemainingArguments)][string[]]$Configs
)

$ErrorActionPreference = 'Stop'

$available = Get-ChildItem "$PSScriptRoot\config" -Directory |
    Where-Object { Test-Path (Join-Path $_.FullName 'setup.ps1') } |
    ForEach-Object Name

if ($List) {
    $available
    return
}

if (-not $Configs) { $Configs = $available }

foreach ($name in $Configs) {
    if ($name -notin $available) {
        throw "No config/$name/setup.ps1 found. Available: $($available -join ', ')"
    }
    Write-Host "==> $name"
    & "$PSScriptRoot\config\$name\setup.ps1"
}
