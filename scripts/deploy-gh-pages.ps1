param(
  [string]$Message = ""
)

$ErrorActionPreference = "Stop"

function Invoke-Step {
  param(
    [string]$Label,
    [scriptblock]$Action
  )
  Write-Host "==> $Label" -ForegroundColor Cyan
  & $Action
}

$repoRoot = Resolve-Path (Join-Path $PSScriptRoot "..")
Set-Location $repoRoot

Invoke-Step "Checking git status" {
  $dirty = git status --porcelain
  if ($dirty) {
    throw "Working tree is not clean. Please commit or stash changes before deploy."
  }
}

Invoke-Step "Building project" {
  & npm run build
}

if (-not (Test-Path (Join-Path $repoRoot "dist"))) {
  throw "Build output 'dist' was not found."
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
if ([string]::IsNullOrWhiteSpace($Message)) {
  $Message = "deploy: $timestamp"
}

$worktreePath = Join-Path $env:TEMP ("memory-eqa-gh-pages-" + [guid]::NewGuid().ToString("N"))

try {
  Invoke-Step "Preparing gh-pages worktree" {
    git worktree add --force $worktreePath gh-pages | Out-Host
  }

  Invoke-Step "Updating gh-pages files" {
    Get-ChildItem -LiteralPath $worktreePath -Force |
      Where-Object { $_.Name -ne ".git" } |
      Remove-Item -Recurse -Force

    Copy-Item -Path (Join-Path $repoRoot "dist\*") -Destination $worktreePath -Recurse -Force
  }

  Invoke-Step "Committing changes" {
    Set-Location $worktreePath
    git add -A

    $hasChanges = git diff --cached --name-only
    if (-not $hasChanges) {
      Write-Host "No changes to deploy. gh-pages is already up to date." -ForegroundColor Yellow
      return
    }

    git commit -m $Message | Out-Host
    git push origin gh-pages | Out-Host
  }
}
finally {
  Set-Location $repoRoot
  if (Test-Path $worktreePath) {
    git worktree remove $worktreePath --force | Out-Null
  }
}

Write-Host "Deployment complete." -ForegroundColor Green
