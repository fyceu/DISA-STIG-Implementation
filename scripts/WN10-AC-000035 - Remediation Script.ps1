<#
.SYNOPSIS
    This PowerShell script ensures that sets the minimum Password length 

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AC-000035

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Adjsut the $desiuredMinLength variable that complies to your company's policy
    
    Run the script with Administrative permissions in Command Prompt or PowerShell
    PS & '.\WN10-AC-000035 - Remediation Script'
#>

## set desired minimum password length
$desiredMinLength = 14

## check for current minimum length
$output = cmd /c "net accounts"

## parse current minimum password length
$currentLength = $output | Where-Object {$_ -match "Minimum password length:"} | Select-Object -First 1

## converts $currentLength into an integer
if ($currentLength -match '(\d+)') {
    $value = [int]$matches[1]
} else {
   Write-Host "Could not parse minimum password length from: $currentLength"
}

## minimum password length not found 
if (-not $currentLength) {
    Write-Host "Could not determine Minimum Password Length (net accounts output missing expected line)."
}

## Adjust minimum password length to $desiredLength
if ($value -lt $desiredMinLength) {
    Write-Host "Minimum password Length: $value (Non-Compliant)"
    Write-Host "Adjusting password minimum length..."

    cmd /c "net accounts /minpwlen:$desiredMinLength" | Out-Null
    Write-Host "Minimum password length set to $desiredMinLength (Compliant)"
} else {
    Write-Host "Minimum password length is currently: $value (Compliant)"
}
