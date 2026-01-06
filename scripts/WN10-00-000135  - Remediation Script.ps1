<#
.SYNOPSIS
    This PowerShell script ensures that all Windows Firewall Profiles are enabled on the system.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-00-000135

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script with Administrative permissions in Command Prompt or PowerShell
    PS C:\> & '.\WN10-00-000135  - Remediation Script.ps1'
#>

## check firewall profiles
$firewallProfiles = Get-NetFirewallProfile

## get disabled profiles
$disabledProfiles = $firewallProfiles | Where-Object {$_.Enabled -ne $true} 

## Remediate any disabled profiles
if ($disabledProfiles) {
    Write-Host "The following Windows Defender Firewall profiles are disabled:"
    $disabledProfiles | ForEach-Object { Write-Host "- $($_.Name): Enabled = $($_.Enabled)" }

    Write-Host "Enabling Windows Defender Firewall for all profiles..."
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled True
    
    Write-Host "Windows Defender Firewall enabled for Domain, Private, and Public (Compliant)."
} else {
    Write-Host "Windows Defender Firewall is already enabled for all profiles (Compliant)."
}
