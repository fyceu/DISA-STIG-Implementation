<#
.SYNOPSIS
    This PowerShell script ensures that Windows Installer Always install with elevated privileges is disabled.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000315

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script with Administrative permissions in Command Prompt or PowerShell
    
    PS & '.\WN10-CC-000315 - Remediation Script.ps1'
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Installer"
$valueName = "AlwaysInstallElevated"
$valueData = 0

## create registry path if it does not exist
if (-not (Test-Path $registryPath)) {
    Write-Host "Registry Path: $registrypath not found. Creating registry path..."
    New-Item -Path $registryPath -Force | Out-Null
} 

## get current value
$current = Get-ItemProperty -Path $registryPath -Name $valueName

## if non-compliant, remediate
if ($current.$valueName -ne $valueData) {
    Write-Host "AlwaysInstallElevated is not set to $valueData (Non-Compliant)"
    Write-Host "Disabling Always install with elevated privileges..."

    New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null
    Write-Host "Remediation applied: AlwaysInstallElevated set to $valueData. (Compliant)"
} else {
    Write-Host "AlwaysInstallElevated is already set to $valueData (Compliant)."
}
