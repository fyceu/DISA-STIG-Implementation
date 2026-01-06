<#
.SYNOPSIS
    This PowerShell script ensures that Server Message Block (SMB) v1 protocol is disabled on the system.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000160

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script with Administrative permissions in Command Prompt or PowerShell
    
    PS & '.\WN10-00-000160 - Remediation Script.ps1'
#>

## Check current state
$feature = Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Select-Object State

# if Status is Enabled, remediate
if ($feature.State -eq "Enabled") {
    Write-Host "$SMB1Protocol is $($feature.State) (Non-compliant)"
    Write-Host "Disabling SMB1Protocol..."

    Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol | Out-Null
    Write-Host "SMB1Protocol has been disabled. Please restart the system."
} else {
	Get-WindowsOptionalFeature -Online | Where FeatureName -eq SMB1Protocol
    Write-Host "SMB1Protocol is already set to disabled! (Compliant)"
}
