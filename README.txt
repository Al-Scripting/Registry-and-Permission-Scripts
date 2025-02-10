# 🛠️ Registry & File Permission Scripts

> **A collection of scripts for managing Windows registry keys and file permissions in Linux.**  
> Supports **Linux (Bash), Windows (PowerShell, Python)** for registry and file operations.

---

## 🐜 **Overview**
This repository contains four scripts:

1. **Linux Shell Script (`ALShifan_restrictfiles.sh`)**  
   - Finds all files in `/home` that contain a specified text.
   - Modifies permissions so only `Alice_ALShifan` has read access.

2. **PowerShell Script (`ALShifan_2a.ps1`)**  
   - Adds a **startup entry** to the Windows registry (`HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run`).
   - Runs a **benign program (Notepad).**

3. **Python Script (`ALShifan_2b.py`)**  
   - Lists all values in the `Run` and `RunOnce` registry keys.
   - Works for both `HKEY_LOCAL_MACHINE` and `HKEY_CURRENT_USER`.

4. **PowerShell Script (`ALShifan_2b.ps1`)**  
   - Recursively lists all values in the `Run` and `RunOnce` registry keys.

---

## 🖥️ **Prerequisites**
| Script Type        | Requirements |
|--------------------|-------------|
| **Linux Shell**   | Bash, appropriate user permissions |
| **PowerShell**    | Windows 10+, must be run as **Administrator** |
| **Python**        | Python 3 installed on **Windows** |

---

## 🚀 **Usage Instructions**

### 🔹 **(1) Linux Shell Script - `ALShifan_restrictfiles.sh`**
**Purpose:** Finds files containing a **specific text** and **modifies permissions**.

#### **Run the Script:**
```sh
# Navigate to the script directory
cd /path/to/script/

# Make the script executable
chmod +x ALShifan_restrictfiles.sh

# Run the script with a search string
./ALShifan_restrictfiles.sh "search text"

# Verify file permissions
ls -l /home
```

---

### 🔹 **(2) PowerShell Script - `ALShifan_2a.ps1`**
**Purpose:** Adds a startup **registry key** for a **benign program (Notepad).**

#### **Run the Script:**
```powershell
# Open PowerShell as Administrator
# Navigate to the script directory
cd "C:\path\to\script\directory"

# Run the script
.\ALShifan_2a.ps1

# Verify the registry entry
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run"
```

---

### 🔹 **(3) Python Script - `ALShifan_2b.py`**
**Purpose:** Lists all values in the **Run** and **RunOnce** registry keys.

#### **Run the Script:**
```sh
# Open Command Prompt as Administrator
# Navigate to the script directory
cd C:\path\to\script\directory

# Run the script
python ALShifan_2b.py
```

#### **Expected Output:**
```
[*] Scanning Windows startup registry keys...

[+] Listing values in: SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    Alice_ALShifan_TestProgram: C:\Windows\System32\notepad.exe
    OneDrive: "C:\Program Files\Microsoft OneDrive\OneDrive.exe" /background
```

---

### 🔹 **(4) PowerShell Script - `ALShifan_2b.ps1`**
**Purpose:** Lists all values in the **Run** and **RunOnce** registry keys recursively.

#### **Run the Script:**
```powershell
# Open PowerShell as Administrator
# Navigate to the script directory
cd "C:\path\to\script\directory"

# Run the script
.\ALShifan_2b.ps1
```

#### **Expected Output:**
```
[*] Scanning Windows startup registry keys...

[+] Listing values in: HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    Alice_ALShifan_TestProgram : C:\Windows\System32\notepad.exe
    OneDrive : "C:\Program Files\Microsoft OneDrive\OneDrive.exe" /background
```

---

## 🔧 **Troubleshooting**
| Issue | Solution |
|-------|----------|
| ❌ **PowerShell script fails** | Run as **Administrator** |
| ❌ **Python script not recognized** | Ensure Python 3 is installed (`python --version`) |
| ❌ **Linux script permission denied** | Use `sudo` or `chmod +x` |

---

## 📚 **License**
**This project is for educational purposes only.** 🏫  
Use responsibly and ensure proper authorization before modifying registry or file permissions.

---

## ⭐ **Contribute & Star This Repository!**
If you find this useful, **give it a ⭐ on GitHub**! 💖

