# LoveShip.io Installer — Windows PowerShell
# Supports: Claude Code, VS Code (Copilot), Cursor, Codex, OpenClaw

$ErrorActionPreference = "Stop"

# Resolve repo root from this script's location
$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$RepoDir = Split-Path -Parent $ScriptDir
$DataDir = "$env:USERPROFILE\.loveship"
$SkillDir = "$RepoDir\skills\loveship"
$Cwd = Get-Location

Write-Host ""
Write-Host "🚢 LoveShip.io Installer" -ForegroundColor Cyan
Write-Host "Your AI wingman for love" -ForegroundColor Cyan
Write-Host "Using repo at: $RepoDir" -ForegroundColor Cyan
Write-Host ""

# Create data directory
if (-not (Test-Path $DataDir)) {
    New-Item -ItemType Directory -Path $DataDir -Force | Out-Null
}

# Step 1: Ask which tool
Write-Host "Which tool do you use? (pick one or more, comma-separated)" -ForegroundColor White
Write-Host ""
Write-Host "  1. Claude Code"
Write-Host "  2. VS Code (GitHub Copilot)"
Write-Host "  3. Cursor"
Write-Host "  4. Codex"
Write-Host "  5. OpenClaw"
Write-Host "  6. All of the above"
Write-Host ""
$choice = Read-Host "Enter your choice (e.g., 1,3 or 6)"

# Step 2: Ask scope
Write-Host ""
Write-Host "Install scope:" -ForegroundColor White
Write-Host ""
Write-Host "  a. Personal — available in all your projects"
Write-Host "  b. Project  — only in this workspace/repo"
Write-Host ""
$scope = Read-Host "Choose (a/b, default: a)"
$scope = $scope.Trim().ToLower()
if ($scope -ne "b") { $scope = "a" }

# Copy full directory (SKILL.md + references/)
# Cleans up old references/ first to avoid stale files on reinstall
function Copy-SkillDir {
    param([string]$Target)
    New-Item -ItemType Directory -Path $Target -Force | Out-Null
    if (Test-Path "$Target\references") { Remove-Item "$Target\references" -Recurse -Force }
    Copy-Item "$SkillDir\SKILL.md" "$Target\SKILL.md" -Force
    Copy-Item "$SkillDir\references" "$Target\references" -Recurse -Force
}

function Install-Claude {
    Write-Host "→ Setting up Claude Code..." -ForegroundColor Yellow
    if ($scope -eq "b") {
        $target = "$Cwd\.claude\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Claude Code — installed to .claude\skills\loveship\" -ForegroundColor Green
    } else {
        $target = "$env:USERPROFILE\.claude\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Claude Code — installed to ~\.claude\skills\loveship\" -ForegroundColor Green
    }
}

function Install-VSCode {
    Write-Host "→ Setting up VS Code (GitHub Copilot)..." -ForegroundColor Yellow
    if ($scope -eq "b") {
        $target = "$Cwd\.github\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ VS Code — installed to .github\skills\loveship\" -ForegroundColor Green
    } else {
        $target = "$env:USERPROFILE\.copilot\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ VS Code — installed to ~\.copilot\skills\loveship\" -ForegroundColor Green
    }
}

function Install-Cursor {
    Write-Host "→ Setting up Cursor..." -ForegroundColor Yellow
    if ($scope -eq "b") {
        $target = "$Cwd\.cursor\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Cursor — installed to .cursor\skills\loveship\" -ForegroundColor Green
    } else {
        $target = "$env:USERPROFILE\.cursor\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Cursor — installed to ~\.cursor\skills\loveship\" -ForegroundColor Green
    }
}

function Install-Codex {
    Write-Host "→ Setting up Codex..." -ForegroundColor Yellow
    if ($scope -eq "b") {
        $target = "$Cwd\.agents\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Codex — installed to .agents\skills\loveship\" -ForegroundColor Green
    } else {
        $target = "$env:USERPROFILE\.agents\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ Codex — installed to ~\.agents\skills\loveship\" -ForegroundColor Green
    }
}

function Install-OpenClaw {
    Write-Host "→ Setting up OpenClaw..." -ForegroundColor Yellow
    if ($scope -eq "b") {
        $target = "$Cwd\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ OpenClaw — installed to skills\loveship\" -ForegroundColor Green
    } else {
        $target = "$env:USERPROFILE\.openclaw\skills\loveship"
        Copy-SkillDir -Target $target
        Write-Host "  ✅ OpenClaw — installed to ~\.openclaw\skills\loveship\" -ForegroundColor Green
    }
}

# Parse choices
$choices = $choice -split ',' | ForEach-Object { $_.Trim() }
foreach ($c in $choices) {
    switch ($c) {
        "1" { Install-Claude }
        "2" { Install-VSCode }
        "3" { Install-Cursor }
        "4" { Install-Codex }
        "5" { Install-OpenClaw }
        "6" { Install-Claude; Install-VSCode; Install-Cursor; Install-Codex; Install-OpenClaw }
        default { Write-Host "  ⚠ Unknown option: $c" -ForegroundColor Red }
    }
}

Write-Host ""
Write-Host "✅ LoveShip installed!" -ForegroundColor Green
Write-Host ""
Write-Host "Just talk naturally about your relationship — LoveShip figures out what you need."
Write-Host ""
Write-Host "To get started, tell your AI: `"set up LoveShip`""
Write-Host ""
