import winreg

def list_registry_keys(hive, subkey):
    """Recursively prints registry values for a given key."""
    try:
        with winreg.OpenKey(hive, subkey, 0, winreg.KEY_READ) as key:
            print(f"\n[+] Listing values in: {subkey}")

            # List values in the key
            index = 0
            while True:
                try:
                    name, value, _ = winreg.EnumValue(key, index)
                    print(f"    {name}: {value}")
                    index += 1
                except OSError:
                    break

            # List subkeys recursively
            index = 0
            while True:
                try:
                    subkey_name = winreg.EnumKey(key, index)
                    list_registry_keys(hive, f"{subkey}\\{subkey_name}")
                    index += 1
                except OSError:
                    break
    except FileNotFoundError:
        print(f"[-] Key not found: {subkey}")

def listRegistryStartedPrograms():
    """Lists startup programs from the Run and RunOnce keys."""
    print("[*] Scanning Windows startup registry keys...\n")

    # Define registry keys to check
    registry_keys = [
        (winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Windows\CurrentVersion\Run"),
        (winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce"),
        (winreg.HKEY_CURRENT_USER, r"SOFTWARE\Microsoft\Windows\CurrentVersion\Run"),
        (winreg.HKEY_CURRENT_USER, r"SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce")
    ]

    # Iterate through registry keys and print their values
    for hive, subkey in registry_keys:
        list_registry_keys(hive, subkey)

if __name__ == "__main__":
    listRegistryStartedPrograms()
