### README - Registry and File Permission Scripts

## **Overview**
This repository contains four scripts for managing Windows registry keys and file permissions in Linux.

1. **Linux Shell Script (`<YourFullName>_restrictfiles.sh`)**  
   - Finds all files in `/home` that contain a given text string.
   - Modifies their permissions so only `Alice_<YourFullName>` has read access.

2. **PowerShell Script (`<YourFullName>_2a.ps1`)**  
   - Adds a new startup entry to the Windows registry (`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`).
   - The registry entry name contains the student's full name and runs a benign program (Notepad).

3. **Python Script (`<YourFullName>_2b.py`)**  
   - Lists all values in the `Run` and `RunOnce` registry keys, including subkeys.
   - Works for both `HKEY_LOCAL_MACHINE` and `HKEY_CURRENT_USER`.

4. **PowerShell Script (`<YourFullName>_2b.ps1`)**  
   - Lists all values in the `Run` and `RunOnce` registry keys recursively.
   - Works for both `HKEY_LOCAL_MACHINE` and `HKEY_CURRENT_USER`.

---

## **Prerequisites**
- **Linux Shell Script:** Needs Linux with bash and appropriate user permissions.
- **PowerShell Script:** Needs Windows 10+ and must be run as Administrator.
- **Python Script:** Needs Python 3 installed on a Windows system.

---

## **Usage Instructions**

### **(1) Linux Shell Script - `<YourFullName>_restrictfiles.sh`**
**Purpose:** Finds files containing a specific text and changes their permissions.

#### **Run the Script:**
1. Open a terminal and navigate to the script directory:
   ```sh
   cd /path/to/script/
   ```
2. Make the script executable:
   ```sh
   chmod +x <YourFullName>_restrictfiles.sh
   ```
3. Run the script with a search string:
   ```sh
   ./<YourFullName>_restrictfiles.sh "search text"
   ```
4. Verify file permissions:
   ```sh
   ls -l /home
   ```

---

### **(2) PowerShell Script - `<YourFullName>_2a.ps1`**
**Purpose:** Adds a startup registry key for a benign program.

#### **Run the Script:**
1. Open **PowerShell as Administrator**.
2. Navigate to the script’s directory:
   ```powershell
   cd "C:\path\to\script\directory"
   ```
3. Run the script:
   ```powershell
   .\YourFullName_2a.ps1
   ```
4. Verify the registry entry:
   ```powershell
   Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
   ```

---

### **(3) Python Script - `<YourFullName>_2b.py`**
**Purpose:** Lists all values in the `Run` and `RunOnce` registry keys (including subkeys).

#### **Run the Script:**
1. Open **Command Prompt as Administrator**.
2. Navigate to the script’s directory:
   ```sh
   cd C:\path\to\script\directory
   ```
3. Run the script:
   ```sh
   python YourFullName_2b.py
   ```
4. Expected Output:
   ```
   [*] Scanning Windows startup registry keys...

   [+] Listing values in: SOFTWARE\Microsoft\Windows\CurrentVersion\Run
       Alice_YourFullName_TestProgram: C:\Windows\System32\notepad.exe
       OneDrive: "C:\Program Files\Microsoft OneDrive\OneDrive.exe" /background
   ```

---

### **(4) PowerShell Script - `<YourFullName>_2b.ps1`**
**Purpose:** Lists all values in the `Run` and `RunOnce` registry keys recursively.

#### **Run the Script:**
1. Open **PowerShell as Administrator**.
2. Navigate to the script’s directory:
   ```powershell
   cd "C:\path\to\script\directory"
   ```
3. Run the script:
   ```powershell
   .\YourFullName_2b.ps1
   ```
4. Expected Output:
   ```
   [*] Scanning Windows startup registry keys...

   [+] Listing values in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
       Alice_YourFullName_TestProgram : C:\Windows\System32\notepad.exe
       OneDrive : "C:\Program Files\Microsoft OneDrive\OneDrive.exe" /background
   ```

---

## **Troubleshooting**
- **PowerShell script requires Administrator privileges** – Right-click PowerShell and select "Run as Administrator".
- **Python script requires Python 3** – Check by running:
  ```sh
  python --version
  ```
- **Linux script requires correct user permissions** – Use `sudo` if necessary.

---

## **License**
This project is for educational purposes only.
