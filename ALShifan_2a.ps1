# Define registry path and value
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
$valueName = "Alice_alshifan_TestProgram"
$valueData = "C:\Windows\System32\notepad.exe"  # Notepad as a the program starts

# Check if running as administrator
$adminCheck = [System.Security.Principal.WindowsPrincipal] [System.Security.Principal.WindowsIdentity]::GetCurrent()
if (-not $adminCheck.IsInRole([System.Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Error: This script must be run as Administrator."
    exit
}

# Add registry entry
New-ItemProperty -Path $regPath -Name $valueName -Value $valueData -PropertyType String -Force
Write-Host "Registry entry added: $valueName -> $valueData"
