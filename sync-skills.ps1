[CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
param(
    [string]$CodexHome = (Join-Path $env:USERPROFILE '.codex'),
    [string[]]$Skills
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

$sourceRoot = Join-Path $PSScriptRoot 'skills'
$destinationRoot = Join-Path $CodexHome 'skills'

if (-not (Test-Path -LiteralPath $sourceRoot -PathType Container)) {
    throw "Template skill source folder was not found: $sourceRoot"
}

$skillFolders = @(
    Get-ChildItem -LiteralPath $sourceRoot -Directory -Force |
        Where-Object { Test-Path -LiteralPath (Join-Path $_.FullName 'SKILL.md') -PathType Leaf }
)

if ($skillFolders.Count -eq 0) {
    throw "No skill folders containing SKILL.md were found in: $sourceRoot"
}

$availableSkillNames = @($skillFolders.Name)
if ($PSBoundParameters.ContainsKey('Skills')) {
    $selectedSkillNames = @($Skills | Where-Object { -not [string]::IsNullOrWhiteSpace($_) } | ForEach-Object { $_.Trim() } | Select-Object -Unique)
}
else {
    $configuredSkills = (& git -C $PSScriptRoot config --local --get codex-template.skills 2>$null)
    $selectedSkillNames = if ([string]::IsNullOrWhiteSpace($configuredSkills)) {
        $availableSkillNames
    }
    else {
        @($configuredSkills -split ',' | ForEach-Object { $_.Trim() } | Where-Object { $_ })
    }
}

$unknownSkillNames = @($selectedSkillNames | Where-Object { $_ -notin $availableSkillNames })
if ($unknownSkillNames.Count -gt 0) {
    throw "Unknown skill name(s): $($unknownSkillNames -join ', '). Available skills: $($availableSkillNames -join ', ')"
}

$skillFolders = @($skillFolders | Where-Object { $_.Name -in $selectedSkillNames })

if (-not (Test-Path -LiteralPath $destinationRoot -PathType Container)) {
    if ($PSCmdlet.ShouldProcess($destinationRoot, 'Create Codex skill folder')) {
        New-Item -ItemType Directory -Path $destinationRoot -Force | Out-Null
    }
}

$syncedSkills = New-Object System.Collections.Generic.List[string]

foreach ($skillFolder in $skillFolders) {
    $sourceSkill = $skillFolder.FullName
    $destinationSkill = Join-Path $destinationRoot $skillFolder.Name

    if (-not $PSCmdlet.ShouldProcess($destinationSkill, "Sync skill '$($skillFolder.Name)'")) {
        continue
    }

    if (-not (Test-Path -LiteralPath $destinationSkill -PathType Container)) {
        New-Item -ItemType Directory -Path $destinationSkill -Force | Out-Null
    }

    foreach ($sourceItem in Get-ChildItem -LiteralPath $sourceSkill -Force) {
        Copy-Item -LiteralPath $sourceItem.FullName -Destination $destinationSkill -Recurse -Force
    }

    $syncedSkills.Add($skillFolder.Name)
}

[PSCustomObject]@{
    Source      = $sourceRoot
    Destination = $destinationRoot
    Skills      = $syncedSkills -join ', '
    Mode        = if ($WhatIfPreference) { 'WhatIf' } else { 'Synced' }
}
