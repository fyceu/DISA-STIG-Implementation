# DISA STIG Implementation

<p align="center">
  <img width="900" height="450" alt="DSIA STIG RMEDIATION LAB" src="https://github.com/user-attachments/assets/5acfdd73-daaf-4985-9f81-1b6c6ffa0e87" />
</p>

## Objective 

The objective of this project was to intentionally deploy an insecure Windows 10 virtual machine and remediate identified security misconfigurations using **DISA STIG ([Windows 10 v3r1](https://stigaview.com/products/win10/v3r1))** guidance. 

The goal was to strengthen hands-on experience with:
- Writing and troubleshooting **PowerShell** remediation scripts 
- Parsing system output using regular expressions (**REGE**X)
- Understanding **policy enforcement mechanisms**, including **Group Policy Objects (GPO)** and **registry-based controls**
- Validating security posture improvements through post-remediation vulnerability scans
- Reinforcing how misconfigurations and insecure default settings can increase organizational risk

PowerShell scripts used for remediation can be viewed [here]()

## Tech Stack
<img width="50" height="50" alt="tenable-svgrepo-com" src="https://github.com/user-attachments/assets/48f74213-3554-4f6a-b873-ab985d2061ab" /> 
<img width="50" height="50" alt="azure" src="https://github.com/user-attachments/assets/fd2866b6-d2fa-4e61-bf55-0b20d63fca5e" /> 
<img width="50" height="50" alt="windows logo" src="https://github.com/user-attachments/assets/5b714048-8f2e-4753-b68a-7aa699b5ef38" /> 
<img width="50" height="50" alt="DISA-Logo-Mid-Blue" src="https://github.com/user-attachments/assets/1745c0fb-23fc-4eb5-b756-5bf85afb7403" />
<img width="50" height="50" alt="PowerShell_5 0_icon" src="https://github.com/user-attachments/assets/0a93be65-1cd8-47aa-9047-d37edd059ccc" />
<img width="50" height="50" alt="image" src="https://github.com/user-attachments/assets/ccf0f0ea-5f1b-4b81-8c80-699d2a16ed4c" />

- Tenable Nessus
- Microsoft Azure
  - Windows 10 VM
- DISA STIG ([Windows 10 v3r1](https://stigaview.com/products/win10/v3r1/))
- PowerShell
- REGEX

## Vulnerabilities Remediated

| STIG ID                                                                     | Description                                                                            |
| --------------------------------------------------------------------------- | -------------------------------------------------------------------------------------- |
| [WN10-AC-000010](https://stigaview.com/products/win10/v3r1/WN10-AC-000010/) | The number of allowed bad logon attempts must be configured to 3 or less.              |
| [WN10-CC-000327](https://stigaview.com/products/win10/v3r1/WN10-CC-000327/) | PowerShell Transcription must be enabled on Windows 10.                                |
| [WN10-CC-000066](https://stigaview.com/products/win10/v3r1/WN10-CC-000066/) | Command line data must be included in process creation events.                         |
| [WN10-00-000090](https://stigaview.com/products/win10/v3r1/WN10-00-000090/) | Accounts must be configured to require password expiration.                            |
| [WN10-00-000155](https://stigaview.com/products/win10/v3r1/WN10-00-000155/) | The Windows PowerShell 2.0 feature must be disabled on the system.                     |
| [WN10-00-000160](https://stigaview.com/products/win10/v3r1/WN10-00-000160/) | The Server Message Block (SMB) v1 protocol must be disabled on the system.             |
| [WN10-AC-000035](https://stigaview.com/products/win10/v3r1/WN10-AC-000035/) | Passwords must, at a minimum, be 14 characters.                                        |
| [WN10-AU-000005](https://stigaview.com/products/win10/v3r1/WN10-AU-000005/) | The system must be configured to audit Account Logon - Credential Validation failures. |
| [WN10-CC-000315](https://stigaview.com/products/win10/v3r1/WN10-CC-000315/) | The Windows Installer Always install with elevated privileges must be disabled.        |
| [WN10-00-000135](https://stigaview.com/products/win10/v3r1/WN10-00-000135/) | A host-based firewall must be installed and enabled on the system.                     |
