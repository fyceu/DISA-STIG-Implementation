<#
.SYNOPSIS
    This PowerShell script ensures that Command line data must be included in process creation events.

.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000066

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Adjsut the $desiredMaxDays variable that complies to your company's policy
    Run the script with Administrative permissions in Command Prompt or PowerShell
    
    PS & '.\WN10-CC-000066 - Remediation Script.ps1'
#>

$registryPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit"
$valueName = "ProcessCreationIncludeCmdLine_Enabled"
$valueData = 1

## check if registry path exists. If not, create it
if (-not (Test-Path $registryPath)){ 
    Write-Host "'$registryPath' not found, creating new registry path..."
    New-Item -Path $registryPath -Force
}

## enable/set value 
New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force | out-Null
Write-Host "Registry Value '$valueName' set to '$valueData' at '$registryPath"
