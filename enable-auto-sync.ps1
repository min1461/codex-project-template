[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [string]$CodexHome = (Join-Path $env:USERPROFILE '.codex')
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$repoRoot = (& git -C $PSScriptRoot rev-parse --show-toplevel).Trim()
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($repoRoot)) {
    throw "The script must be run from a Git checkout."
}

$normalizedRepoRoot = [System.IO.Path]::GetFullPath($repoRoot).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
$normalizedScriptRoot = [System.IO.Path]::GetFullPath($PSScriptRoot).TrimEnd([System.IO.Path]::DirectorySeparatorChar)
if ($normalizedRepoRoot -ne $normalizedScriptRoot) {
    throw "The script must be located at the Git checkout root: $repoRoot"
}

$hook = Join-Path $repoRoot '.githooks\post-merge'
$syncScript = Join-Path $repoRoot 'sync-skills.ps1'
if (-not (Test-Path -LiteralPath $hook -PathType Leaf)) {
    throw "The post-merge hook was not found: $hook"
}
if (-not (Test-Path -LiteralPath $syncScript -PathType Leaf)) {
    throw "The skill sync script was not found: $syncScript"
}

if ($PSCmdlet.ShouldProcess($repoRoot, 'Configure this checkout to use the tracked post-merge hook')) {
    & git -C $repoRoot config --local core.hooksPath .githooks
    if ($LASTEXITCODE -ne 0) {
        throw 'Failed to configure the local Git hooks path.'
    }
}

if ($PSCmdlet.ShouldProcess($CodexHome, 'Synchronize CPT skills now')) {
    & $syncScript -CodexHome $CodexHome
}

[PSCustomObject]@{
    Repository = $repoRoot
    HooksPath  = '.githooks'
    Hook       = $hook
    CodexHome  = $CodexHome
    Mode       = if ($WhatIfPreference) { 'WhatIf' } else { 'Enabled' }
}

