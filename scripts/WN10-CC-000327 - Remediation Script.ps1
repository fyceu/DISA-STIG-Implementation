<#
.SYNOPSIS
    This PowerShell script ensures that PowerShell Transcription is enabled on the system.
.NOTES
    Author          : Fasi Sika
    LinkedIn        : linkedin.com/in/fasisika
    GitHub          : github.com/fyceu
    Date Created    : 2025-01-04
    Last Modified   : 2025-01-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-CC-000327

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Run the script with Administrative permissions in Command Prompt or PowerShell
    
    PS & '.\WN10-CC-000327 - Remediation Script.ps1'
#>

$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription"
$valueName = "EnableTranscripting"
$valueData = 1

## secure location for Trasncript Outputs 
$outputDirectory = "C:\ProgramData\PowerShellTranscripts"
$outputName = "OutputDirectory"

## check if registry path exists, if not create it
if (-not (Test-Path $registryPath)) {
    Write-Host "'$registryPath' not found, creating new registry path..."
    New-Item -Path $registryPath -Force
}

## check if transcript output directory exists, if not create it
if (-not (Test-Path $outputDirectory)) {
    Write-Host "'$outputDirectory' not found, creating transcript output directory..."
    New-Item -Path $outputDirectory -ItemType Directory -Force | Out-Null
}

## enable transcripting
New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWord -Value $valueData -Force | Out-Null
Write-Host "Registry Value '$valueName' set to '$valueData' at '$registryPath'"

## set transcription output directory
New-ItemProperty -Path $registryPath -Name $outputName -PropertyType String -Value $outputDirectory -Force | Out-Null
Write-Host "OutputDirectory set to: $outputDirectory"
