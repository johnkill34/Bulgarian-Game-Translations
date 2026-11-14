$ErrorActionPreference = "Stop"
try {
  Write-Host "FM27 Bulgarian Translation | johnkill34" -ForegroundColor Cyan
  $root = Split-Path $PSScriptRoot -Parent
  $source = Join-Path $root "Bulgarian.ltf"
  if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
    throw "Bulgarian.ltf is missing. Extract the whole release ZIP, then run Installer\Install_BG.bat."
  }
  $docs = [Environment]::GetFolderPath("MyDocuments")
  if ([string]::IsNullOrWhiteSpace($docs)) { throw "Windows Documents folder was not found." }
  $target = Join-Path $docs "Sports Interactive\Football Manager 27\languages"
  $dest = Join-Path $target "Bulgarian.ltf"
  Write-Host ""
  Write-Host "Source: $source"
  Write-Host "Destination: $dest"
  Write-Host ""
  Write-Warning "Close Football Manager 27 before continuing."
  $choice = Read-Host "Type YES to install; anything else cancels"
  if ($choice -cne "YES") { Write-Host "Cancelled."; exit 0 }
  New-Item -Path $target -ItemType Directory -Force | Out-Null
  if (Test-Path -LiteralPath $dest) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $backup = "$dest.$timestamp.bak"
    Copy-Item -LiteralPath $dest -Destination $backup -ErrorAction Stop
    Write-Host "Backup created: $backup"
  }
  Copy-Item -LiteralPath $source -Destination $dest -Force -ErrorAction Stop
  $a = (Get-FileHash -LiteralPath $source -Algorithm SHA256).Hash
  $b = (Get-FileHash -LiteralPath $dest -Algorithm SHA256).Hash
  if ($a -ne $b) { throw "SHA256 verification failed. Check the installed file." }
  Write-Host ""
  Write-Host "Successfully installed Bulgarian.ltf" -ForegroundColor Green
  Write-Host "Restart FM27, then select Bulgarian in Preferences > Region > Language."
} catch {
  Write-Host "[ERROR] $($_.Exception.Message)" -ForegroundColor Red
  exit 1
}
