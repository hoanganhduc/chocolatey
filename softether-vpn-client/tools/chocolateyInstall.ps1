$ErrorActionPreference = 'Stop'

$packageName = 'softether-vpn-client'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$tempRoot = Join-Path $env:TEMP 'chocolatey-softether-vpn-client'
$extractDir = Join-Path $tempRoot 'extract'

$zipName = 'vpngate-client-2026.04.18-build-9807.164492.zip'
$zipUrl = "https://download.vpngate.jp/common/cd.aspx/$zipName"
$zipFile = Join-Path $tempRoot $zipName
$ahkLogFile = Join-Path $tempRoot 'softether-vpn-client-install.ahk.log'

$installerName = 'vpngate-client-v4.44-9807-rtm-2025.04.16.exe'
$installerChecksum = 'ab006331f1f646bc319585088239d55bc54ecde5c269009268e9598307da7a44'
$installerPath = Join-Path $extractDir $installerName

function Write-AutoHotkeyLog {
  param([string] $Path)

  Write-Warning "AutoHotkey log path: $Path"

  if (-not (Test-Path $Path -PathType Leaf)) {
    Write-Warning 'AutoHotkey log was not created.'
    return
  }

  Write-Warning 'AutoHotkey log follows:'
  Get-Content -LiteralPath $Path -ErrorAction SilentlyContinue |
    ForEach-Object { Write-Warning "AHK: $_" }
  Write-Warning 'End AutoHotkey log.'
}

function Stop-ProcessTree {
  param(
    [int] $ProcessId,
    [switch] $SkipRoot
  )

  Get-CimInstance Win32_Process -Filter "ParentProcessId = $ProcessId" -ErrorAction SilentlyContinue |
    ForEach-Object { Stop-ProcessTree -ProcessId $_.ProcessId }

  if (-not $SkipRoot) {
    Stop-Process -Id $ProcessId -Force -ErrorAction SilentlyContinue
  }
}

function Stop-InstallerAttempt {
  param(
    [System.Diagnostics.Process] $InstallerProcess,
    [System.Diagnostics.Process] $AutoHotkeyProcess
  )

  if ($InstallerProcess) {
    $InstallerProcess.Refresh()
    Stop-ProcessTree -ProcessId $InstallerProcess.Id -SkipRoot:$InstallerProcess.HasExited
  }

  if ($AutoHotkeyProcess) {
    $AutoHotkeyProcess.Refresh()
    if (-not $AutoHotkeyProcess.HasExited) {
      Stop-Process -Id $AutoHotkeyProcess.Id -Force -ErrorAction SilentlyContinue
    }
  }
}

function Invoke-InstallerWithWatchdog {
  param(
    [hashtable] $PackageArgs,
    [System.Diagnostics.Process] $AutoHotkeyProcess,
    [string] $AutoHotkeyLogPath,
    [int[]] $ValidExitCodes,
    [int] $TimeoutSeconds,
    [int] $PollSeconds
  )

  $installerFile = $PackageArgs.file
  $startArgs = @{
    FilePath         = $installerFile
    WorkingDirectory = Split-Path -Parent $installerFile
    PassThru         = $true
  }

  if (-not [string]::IsNullOrWhiteSpace($PackageArgs.silentArgs)) {
    $startArgs.ArgumentList = $PackageArgs.silentArgs
  }

  Write-Host "Installing $($PackageArgs.packageName)..."
  $installerProcess = Start-Process @startArgs
  Write-Debug "Installer process ID:`t$($installerProcess.Id)"

  $deadline = (Get-Date).AddSeconds($TimeoutSeconds)

  while ($true) {
    $installerProcess.Refresh()
    $AutoHotkeyProcess.Refresh()

    $installerDone = $installerProcess.HasExited
    $autoHotkeyDone = $AutoHotkeyProcess.HasExited

    if ($autoHotkeyDone -and $AutoHotkeyProcess.ExitCode -ne 0) {
      Write-AutoHotkeyLog -Path $AutoHotkeyLogPath
      Stop-InstallerAttempt -InstallerProcess $installerProcess -AutoHotkeyProcess $AutoHotkeyProcess
      throw "AutoHotkey helper exited with code $($AutoHotkeyProcess.ExitCode)."
    }

    if ($installerDone -and ($ValidExitCodes -notcontains $installerProcess.ExitCode)) {
      Write-AutoHotkeyLog -Path $AutoHotkeyLogPath
      Stop-InstallerAttempt -InstallerProcess $installerProcess -AutoHotkeyProcess $AutoHotkeyProcess
      throw "Installer exited with code $($installerProcess.ExitCode)."
    }

    if ($installerDone -and $autoHotkeyDone) {
      break
    }

    if ((Get-Date) -ge $deadline) {
      Write-Warning "Installer watchdog timed out after $TimeoutSeconds seconds."
      Write-AutoHotkeyLog -Path $AutoHotkeyLogPath
      Stop-InstallerAttempt -InstallerProcess $installerProcess -AutoHotkeyProcess $AutoHotkeyProcess
      throw "Installer did not complete before the package watchdog timeout."
    }

    Start-Sleep -Seconds $PollSeconds
  }

  if ($installerProcess.ExitCode -ne 0) {
    Set-PowerShellExitCode $installerProcess.ExitCode
  }

  Write-Host "$($PackageArgs.packageName) install exited with $($installerProcess.ExitCode)."
}

if (Test-Path $tempRoot -PathType Container) {
  Remove-Item $tempRoot -Recurse -Force -ErrorAction SilentlyContinue
}

New-Item -ItemType Directory -Path $extractDir -Force | Out-Null

# VPN Gate's cd.aspx endpoint mutates the wrapper ZIP while keeping the embedded
# installer stable. Download the ZIP directly and validate the extracted payload.
Get-WebFile -Url $zipUrl -FileName $zipFile
Get-ChocolateyUnzip -PackageName $packageName -FileFullPath $zipFile -Destination $extractDir

$requiredFiles = @(
  $installerName,
  'VpnGatePlugin_x86.dll',
  'VpnGatePlugin_x64.dll',
  'xmlrpc.config',
  'VPNGate.db',
  'VPNGate.dat'
)

$missingFiles = $requiredFiles |
  Where-Object { -not (Test-Path (Join-Path $extractDir $_) -PathType Leaf) }

if ($missingFiles.Count -gt 0) {
  throw "Expected files not found after extraction: $($missingFiles -join ', '). Upstream archive layout may have changed."
}

Get-ChecksumValid -File $installerPath -Checksum $installerChecksum -ChecksumType 'sha256' -OriginalUrl $zipUrl

$validExitCodes = @(0, 3010, 1641)
$installerTimeoutSeconds = 900
$watchdogPollSeconds = 5

$packageArgs = @{
  packageName    = $packageName
  softwareName   = 'SoftEther VPN Client*'
  fileType       = 'exe'
  file           = $installerPath
  silentArgs     = ''
  validExitCodes = $validExitCodes
}

try {
  Get-Process -Name 'AutoHotKey', 'AutoHotkey', 'AutoHotkeyU32', 'AutoHotkeyU64' -ErrorAction SilentlyContinue |
    Stop-Process -Force -ErrorAction SilentlyContinue
} catch {
  Write-Warning "Could not terminate existing AutoHotkey processes: $_"
}

$ahkExe = Join-Path $env:ChocolateyInstall 'lib\autohotkey.portable\tools\AutoHotkey.exe'
$ahkExe = if (Test-Path $ahkExe -PathType Leaf) { $ahkExe } else { (Get-Command AutoHotKey).Path }
$ahkFile = Join-Path $toolsDir 'softether-vpn-clientInstall.ahk'
$ahkProc = Start-Process -FilePath $ahkExe -ArgumentList @($ahkFile, $ahkLogFile) -PassThru

Write-Debug "$ahkExe start time:`t$($ahkProc.StartTime.ToShortTimeString())"
Write-Debug "Process ID:`t$($ahkProc.Id)"
Write-Debug "AutoHotkey log:`t$ahkLogFile"

Invoke-InstallerWithWatchdog `
  -PackageArgs $packageArgs `
  -AutoHotkeyProcess $ahkProc `
  -AutoHotkeyLogPath $ahkLogFile `
  -ValidExitCodes $validExitCodes `
  -TimeoutSeconds $installerTimeoutSeconds `
  -PollSeconds $watchdogPollSeconds
