<#
.SYNOPSIS
    This PowerShell script ensures that Windows PowerShell v2.0 feature is disabled on the system.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000155

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Run the script with Administrative permissions in Command Prompt or PowerShell
  PS & '.\WN10-00-000155 - Remediation Script.ps1' 
#>

 ## create array for PowerShellV2 features
 $features = @(
    "MicrosoftWindowsPowerShellV2",
    "MicrosoftWindowsPowerShellV2Root"
)

## check current state
$options = foreach ($value in $features) {
    Get-WindowsOptionalFeature -Online -FeatureName $value | Select-Object FeatureName, State
}

## If either value = Enabled, remediate
$enabled = $options | Where-Object { $_.State -eq "Enabled" }

if ($enabled) {
    Write-Host "Non-compliant: PowerShell 2.0 feature is enabled:"
    $enabled | ForEach-Object { Write-Host " - $($_.FeatureName): $($_.State)" }
    
    Write-Host "`nDisabling WindowsPowerShellV2Root..."
    Disable-WindowsOptionalFeature -Online -FeatureName MicrosoftWindowsPowerShellV2Root
} else {
    Write-Host "PowerShell v2.0 features are already disabled (compliant)."
}
