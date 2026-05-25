param(
  [string]$NvimExe = $(if (Get-Command nvim.exe -ErrorAction SilentlyContinue) { (Get-Command nvim.exe).Source } else { 'C:\Program Files\Neovim\bin\nvim.exe' }),
  [switch]$Uninstall
)

$keys = @(
  'Registry::HKEY_CURRENT_USER\Software\Classes\*\shell\OpenWithNeovim',
  'Registry::HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithNeovim',
  'Registry::HKEY_CURRENT_USER\Software\Classes\Folder\shell\OpenWithNeovim',
  'Registry::HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithNeovim'
)

if ($Uninstall) {
  foreach ($k in $keys) {
    if (Test-Path $k) { Remove-Item -Path $k -Recurse -Force }
  }
  Write-Host 'Neovim context menu removed.'
  return
}

if (-not (Test-Path $NvimExe)) {
  throw "nvim.exe not found at: $NvimExe"
}

function Set-Verb {
  param(
    [string]$Key,
    [string]$Label,
    [string]$Command
  )
  New-Item -Path "$Key\command" -Force | Out-Null
  Set-Item -Path $Key -Value $Label
  Set-Item -Path "$Key\command" -Value $Command
}

$fileCmd   = "`\"$NvimExe`\" `\"%1`\""
$folderCmd = "`\"$NvimExe`\" `\"%V`\""
$bgCmd     = if (Get-Command wt.exe -ErrorAction SilentlyContinue) {
  'wt.exe -d "%V" nvim .'
} else {
  'cmd.exe /s /k pushd "%V" && "' + $NvimExe + '" .'
}

Set-Verb 'Registry::HKEY_CURRENT_USER\Software\Classes\*\shell\OpenWithNeovim'                    'Open with Neovim'         $fileCmd
Set-Verb 'Registry::HKEY_CURRENT_USER\Software\Classes\Directory\shell\OpenWithNeovim'            'Open Folder with Neovim'  $folderCmd
Set-Verb 'Registry::HKEY_CURRENT_USER\Software\Classes\Folder\shell\OpenWithNeovim'               'Open Folder with Neovim'  $folderCmd
Set-Verb 'Registry::HKEY_CURRENT_USER\Software\Classes\Directory\Background\shell\OpenWithNeovim' 'Open Neovim Here'         $bgCmd

Write-Host 'Neovim context menu installed. Restart Explorer if needed.'
