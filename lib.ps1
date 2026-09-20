# Shared helpers for the Windows (PowerShell) setup scripts. Dot-source it:
#   . "$PSScriptRoot\..\..\lib.ps1"

$ErrorActionPreference = 'Stop'

# Symlink $Target -> $Source, creating the target's parent directory first.
# Like the `ln -s` in the setup.sh scripts, this errors on a conflicting
# existing file rather than clobbering it; a link that already points at
# $Source is left alone so re-running is safe.
#
# Creating symlinks on Windows needs either an elevated shell or Developer
# Mode (Settings > System > For developers).
function New-DotfileLink {
    param(
        [Parameter(Mandatory)][string]$Source,
        [Parameter(Mandatory)][string]$Target
    )

    New-Item -ItemType Directory -Force -Path (Split-Path -Parent $Target) | Out-Null

    $existing = Get-Item -LiteralPath $Target -Force -ErrorAction SilentlyContinue
    if ($existing) {
        if ($existing.LinkType -eq 'SymbolicLink' -and @($existing.Target) -contains $Source) {
            Write-Host "Already linked: $Target"
            return
        }
        throw "Refusing to overwrite existing '$Target'. Move or delete it and re-run."
    }

    Write-Host "Linking $Target -> $Source"
    New-Item -ItemType SymbolicLink -Path $Target -Target $Source | Out-Null
}
