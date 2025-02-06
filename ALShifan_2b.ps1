# Function to recursively list registry keys and values
function Get-RegistryValues {
    param (
        [string]$RegPath,
        [string]$Hive
    )

    try {
        # Open the registry key
        $key = Get-Item -Path $RegPath -ErrorAction Stop
        Write-Host "`n[+] Listing values in: $RegPath"

        # List values inside the key
        $key.GetValueNames() | ForEach-Object {
            $value = $key.GetValue($_)
            Write-Host "    $_ : $value"
        }

        # List subkeys recursively
        $key.GetSubKeyNames() | ForEach-Object {
            Get-RegistryValues -RegPath "$RegPath\$_" -Hive $Hive
        }
    }
    catch {
        Write-Host "[-] Could not access: $RegPath"
    }
}

# Define registry paths to scan
$registryKeys = @(
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
    "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run",
    "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"
)

Write-Host "[*] Scanning Windows startup registry keys..."

# Iterate through the registry keys
foreach ($key in $registryKeys) {
    Get-RegistryValues -RegPath $key -Hive (if ($key -like "HKLM*") {"HKLM"} else {"HKCU"})
}

Write-Host "`n[*] Script execution completed."
