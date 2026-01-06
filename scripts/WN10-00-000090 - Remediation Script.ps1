<#
.SYNOPSIS
    This PowerShell script ensures that accounts must be configured to require password expiration.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : [linkedin.com/in/fasisika](linkedin.com/in/fasisika)
    GitHub          : [github.com/fyceu](github.com/fyceu)
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
  Adjsut the $desiredMaxDays variable that complies to your company's policy
  
  Run the script with Administrative permissions in Command Prompt or PowerShell
  PS & '.\WN10-00-000090 - Remediation Script.ps1'
#>

# set desired maximum days based on company's compliance policy
$desiredMaxDays = 90

## get current max age policy 
$output = cmd /c "net accounts"
$maxDaysOutput = $output | Where-Object {$_ -match "Maximum password age"} | Select-Object -First 1

if (-not $maxDaysOutput) {
    Write-Host "Unable to determine current Maximum password age."
    exit 1
}

## parse value of Maximum password age 
if ($maxDaysOutput -match "Maximum password age.*?:\s*(\d+)") {
	## converts value to integer
    $currentMaxAge = [int]$matches[1]
} elseif ($maxDaysOutput -match "Maximum password age.*?:\s*Never") {
    ## if Never, convert  to null
    $currentMaxAge = $null
} else {
    Write-Host "Unrecognized format: $maxDaysOutput"
    exit 1
}

## set Maximum Password Age
if ($null -eq $currentMaxAge) {
    Write-Host "Current Max Password Age: $currentMaxAge (non-compliant)"
    Write-host "Setting Max Password Age to $desiredMaxDays days..."
    cmd /c "net accounts /maxpwage:$desiredMaxDays" | Out-Null
    Write-Host "Maximum Password Age set to $desiredMaxDays"
} elseif ($currentMaxAge -gt $desiredMaxDays) {
    Write-Host "Current Max Password Age: $currentMaxAge (non-compliant)"
    Write-host "Setting Max Password Age to $desiredMaxDays days..."
    cmd /c "net accounts /maxpwage:$desiredMaxDays" | Out-Null
    Write-Host "Maximum Password Age set to $desiredMaxDays"
} else {
    Write-Host "Current Maximum password age: $currentMaxAge days (compliant)."
}
