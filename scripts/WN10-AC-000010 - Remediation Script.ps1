<#
.SYNOPSIS
    This PowerShell script ensures that the maximum threshold for account lockout from bad login attempts is set to 3. 

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2026-01-03
    Last Modified   : 2026-01-03
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000010

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Set the maxmimum threshold in $desiredThreshold that is compliant to your company's policies
    
    Run the script with Administrative permissions in Command Prompt or PowerShell
    PS & '.\WN10-AC-000010 - Remediation Script.ps1'
#>

$desiredThreshold = 3

## check current lockout threshold
$output = cmd /c "net accounts"
$lockoutThreshold = $output | Where-Object {$_ -match 'Lockout threshold:'} | Select-Object -First 1

## parse value returned and convert to integer
if ($lockoutThreshold -match '(\d+)') {
    $number = [int]$matches[1]
}

## lockoutThreshold not found
if (-not $lockoutThreshold) {
    Write-Host "Could not determine current lockout threshold (net accounts output missing expected line)."
}

## adjust lockout period to $desiredThreshold
if ($number -gt $desiredThreshold) {
    Write-Host "Current lockout threshold is $number (non-compliant)."
    Write-Host "Setting lockout threshold to $desiredThreshold..."
    cmd /c "net accounts /lockoutthreshold:$desiredThreshold" | Out-Null
    Write-Host "Lockout threshold successfully changed to $desiredThreshold."
} else {
    Write-Host "Current lockout threshold is $currentThreshold (already compliant)."
}
