<#
.SYNOPSIS
    This PowerShell script ensures that the system must be configured to audit Account Logon - Credential Validation failures.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000005

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script with Administrative permissions in Command Prompt or PowerShell
    
    PS & '.\WN10-AU-000005  - Remediation Script.ps1'
#>

## get subcategory Credential Validation
$current = cmd /c 'auditpol /get /subcategory:"Credential Validation"' | Out-String

## if credential validation is not set to 'Failure' OR 'Success AND Failure', remedaite
if ($current -notmatch '\bFailure\b') {
    Write-Host "Non-compliant: Credential Validation Failure auditing is disabled."
    Write-Host "Enabling Credential Validation Failure auditing..."

    cmd /c 'auditpol /set /subcategory:"Credential Validation" /failure:enable' | Out-Null

    Write-Host "Remediation applied."
} else {
    Write-Host "Compliant: Credential Validation Failure auditing is enabled."
}
