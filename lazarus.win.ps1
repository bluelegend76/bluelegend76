Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
# choco search vim

# General Updating with Chocolatey
# choco upgrade all -y

# Windows-updates from PowerShell ----
# Here's a breakdown of the process:
# 
# Install the PSWindowsUpdate module:
# Install-Module -Name PSWindowsUpdate -Force 
# 
# Check for Updates:
# Import-Module PSWindowsUpdate 
# Get-WindowsUpdate 
# 
# Install Updates:
# Install-WindowsUpdate -AcceptAll 
# 
#   -AcceptAll: This parameter automatically accepts all available updates.
# 
# (Optional) Reboot (if required):
# The Install-WindowsUpdate cmdlet can optionally handle the reboot automatically. However, it's often safer to manually reboot after installing updates.
# 
# Important Notes:
# Run as Administrator: You must run PowerShell as administrator to use these cmdlets.
# Careful with -AcceptAll: This parameter will install all available updates, including optional and driver updates.
# Consider Scheduling: You can schedule the Install-WindowsUpdate command using Task Scheduler to automate the update process at a convenient time.

choco install azure-cli -y
# run with 'az'/'az.cmd' in PowerShell
# refreshenv
choco upgrade git -y
choco install vim -y
choco install neovim -y
choco install nushell -y
# choco install python -y
choco install jupyter python3-virtualenv -y
# choco install jupyterlab -y
choco install clojure -y
choco install lein -y
# pip install xonsh
choco install autohotkey -y
choco install freecommander -y
choco install vlc -y
# pdf reader (with dark mode)
choco install foxitreader -y
choco install mpv -y
# wsl --install
# choco install ImageMagick
choco install discord -y
# https://www.autohotkey.com/scite4ahk/dl/s4ahk-install.exe
choco install gimp -y
choco install inkscape -y

choco install azure-cli -y

# C# Interactive in PowerShell
# You can achieve C# interactive within PowerShell using the Add-Type cmdlet. Here's how:
# 
# 1. Define your C# code within a script block:
# PowerShell
# 
# $code = @"
# using System;
# 
# public class MyClass {
#     public static int Add(int a, int b) {
#         return a + b;
#     }
# }
# "@
# 
# Add-Type -TypeDefinition $code
# 
# # Now you can call the C# method
# [MyClass]::Add(5, 3) 
# 
# Explanation:
# 
#     $code = @" ... @": This creates a multi-line string containing your C# code.
#     Add-Type -TypeDefinition $code: This cmdlet dynamically compiles the C# code within the script block.
#     [MyClass]::Add(5, 3): This line calls the Add method of the MyClass that you defined in C#.
# 
# Key Points:
# 
#     Simple Examples: This method is well-suited for simple C# code snippets and quick testing.
#     Limitations:
#         For more complex C# code or larger projects, consider using a dedicated C# IDE or a more robust development environment.
#         This approach might not be ideal for long-term development or complex scenarios.
# 
# Alternative:
# 
#     .NET Interactive: This is a more modern approach that provides a richer interactive experience. It can be installed as a global tool using the .NET CLI:
# 
#     dotnet tool install --global Microsoft.dotnet-interactive
# 
#     After installation, you can use the dotnet-interactive command-line tool to execute C# code interactively.
# 
# I hope this helps! Let me know if you have any other questions.


# Setting up symbolic links to the Config-files in Windows
# TODO: Replace 'hard-coded' user with 'Select User' to link to
# C:\Users\SEDAALB2> New-Item -ItemType SymbolicLink -Path _vimrc -Target .\RiderProjects\bluelegend76\_vimrc
C:\Users\SEDAALB2> New-Item -ItemType SymbolicLink -Path _vimrc -Target .\RiderProjects\bluelegend76\.winvimrc
C:\Users\SEDAALB2> New-Item -ItemType SymbolicLink -Path Desktop\LangDb1.txt -Target .\RiderProjects\bluelegend76\rsc\data\db\langdb.legacy.list\langdb.txt

# WSL/Ext4
# sudo modprobe ext4

# https://cdn.insynchq.com/builds/win/Insync-3.8.7.50505.exe
# Download the Insync installer (replace with the actual download URL)
$downloadUrl = "https://download.insync.com/latest/windows/insync-setup.exe" 
$installerPath = "$env:TEMP\insync-setup.exe" 

# Download the installer using Invoke-WebRequest
Invoke-WebRequest -Uri $downloadUrl -OutFile $installerPath

# Execute the installer (adjust the arguments as needed)
Start-Process -FilePath $installerPath -ArgumentList "/S"


# Download + Start installer for Dlang/DMD ----

# Install VeraCrypt ----
# Define the URL of the VeraCrypt installer
$veracryptInstallerUrl = "https://www.veracrypt.fr/en/Downloads"

# Download the installer
try {
    Invoke-WebRequest -Uri $veracryptInstallerUrl -OutFile "veracrypt_setup.exe"
    Write-Host "VeraCrypt installer downloaded successfully."
} catch {
    Write-Host "Error downloading VeraCrypt installer: $($_.Exception.Message)"
    exit 1
}

# Launch the installer (basic example)
Start-Process -FilePath ".\veracrypt_setup.exe"


# - Question: Is there a keyboard shortcut in Windows 10 to move the active app/window to the next desktop? I.e. grabbing and moving it with the mouse is kind of tedious
# 
# Unfortunately, there isn't a single, dedicated keyboard shortcut to directly move the active app/window to the next desktop in Windows 10.
# 
# However, here are a few workarounds to achieve this efficiently:
# 
# Using Task View:
# 
# Press Windows key + Tab to open Task View.
# Right-click on the window you want to move.
# Select "Move to" and then choose the desired desktop.
# Using AutoHotkey (third-party tool):
# You can create a custom script using AutoHotkey to assign a keyboard shortcut for this action. Here's a basic example:
# 
# AutoHotkey
# 
# ^!Right::
# WinGetActiveTitle, A_ActiveWindowTitle
# WinGetActiveProcess, A_ActiveProcess
# Run, powershell.exe -Command "((Get-WmiObject Win32_Process -Filter \"Name='%A_ActiveProcess%'\" | Get-CimInstance -ClassName Win32_Process).Handle).ToInt32() | ForEach-Object { [System.Runtime.InteropServices.Marshal]::GetObjectForIUnknown($_) } | Invoke-Command -ScriptBlock { Move-Window -Handle $using:handle -Desktop 2 }"
# Return
# This script moves the active window to the second desktop when you press Ctrl + Alt + Right Arrow.
# You'll need to install AutoHotkey and modify the script to suit your needs (e.g., change the target desktop number).
# Note: These are the most efficient methods currently available. Microsoft may introduce a dedicated shortcut in future Windows updates.
# 
# 
# - Quick follow-up on that one: Do I need to install something to be able run AutoHotkey-scripts (which I suspect)? And, can it be installed using Chocolatey?
# 
# You're right, you'll need to install AutoHotkey to run its scripts.
# 
# Installation:
# 
# Manual: Download the installer from the official AutoHotkey website (autohotkey.com) and run it.
# Chocolatey:
# Open an elevated command prompt: Search for "cmd" in the Start Menu, right-click on "Command Prompt," and select "Run as administrator."
# 
# Install Chocolatey: If you haven't already, run the following command in the elevated command prompt:
# 
# @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))" && SET "ChocolateyInstall=" & (& '$env:ChocolateyInstall')
# Install AutoHotkey: Once Chocolatey is installed, run the following command in the elevated command prompt:
# 
# choco install autohotkey
# Running Scripts:
# 
# After installation, you can create or download AutoHotkey scripts (.ahk files).
# To run a script, double-click the .ahk file.
# I hope this helps!
# 
# If I would like to collect a bunch of commands to be run after I have installed Windows (mostly 10, but maybe also some 11), what file extension would be reasonable to put on a file?
# 
# The most suitable file extension for a collection of commands to be run after installing Windows 10 or 11 is .bat or .cmd.
# 
# Here's why:
# 
# .bat and .cmd are standard extensions for batch files in Windows.
# Batch files are simple scripts that contain a series of commands to be executed by the command-line interpreter (cmd.exe).
# They are easy to create and edit using any plain text editor like Notepad.
# Windows can directly execute these files by double-clicking them.
# Example:
# 
# Code snippet
# 
# @echo off
# echo Installing necessary software...
# echo.
# # Install software using tools like Chocolatey or scoop
# choco install <software1> <software2> ...
# # Run other commands as needed
# net user Administrator /active:yes 
# shutdown /r /t 0 
# This example batch file:
# 
# Disables echoing of commands to the console.
# Displays a message indicating the start of the installation process.
# Installs software using a package manager like Chocolatey or scoop.
# Activates the Administrator account.
# Restarts the computer.
# Note:
# 
# You can customize the commands within the batch file to suit your specific needs.
# It's recommended to test your batch file thoroughly in a safe environment before running it on a freshly installed system.
# By using .bat or .cmd files, you can automate the post-installation tasks and save time and effort.
# 
# 
# 
# - And if I also would like to be able to run a line or two of PowerShell code, would it be more reasonable to put the file-extension .ps1 on the file, and (maybe crucially) would I need to pad the lines with Chocolatey commands in some PowerShell code?
# 
# You're absolutely right! For PowerShell code, the appropriate file extension is .ps1.   
# 
# Here's how you can integrate Chocolatey commands within your PowerShell script:
# 
# 1. Direct Execution:
# 
# You can directly execute Chocolatey commands within your PowerShell script using the choco command.
# 
# PowerShell
# 
# choco install <package_name> 
# choco upgrade all 
# 2. Using the Chocolatey Module:
# 
# For more advanced scenarios, you can use the official Chocolatey PowerShell module.
# 
# Install the module:
# 
# PowerShell
# 
# Install-Module Chocolatey
# Use the module's cmdlets:
# 
# PowerShell
# 
# Find-ChocolateyPackage <package_name>
# Install-ChocolateyPackage <package_name> 
# Update-ChocolateyPackage <package_name> 
# Example PowerShell Script (post_install.ps1):
# 
# PowerShell
# 
# # Install Chocolatey packages
# choco install googlechrome 
# choco install vscode 
# 
# # Update all installed packages
# choco upgrade all 
# 
# # Set-ExecutionPolicy Bypass -Scope Process 
# # This line temporarily bypasses the execution policy for the current script 
# # and is generally not recommended for production environments. 
# Important Notes:
# 
# Execution Policy: By default, PowerShell restricts the execution of scripts for security reasons. You might need to adjust the execution policy before running your script. However, be cautious when modifying the execution policy.   
# Error Handling: Implement proper error handling within your script to gracefully handle potential issues during package installation or updates.
# Testing: Thoroughly test your script in a safe environment before running it on a freshly installed system.
# By combining the power of PowerShell and Chocolatey, you can create robust and efficient post-installation scripts to automate your system setup.
# 
# 
# Sources and related content
# about_Scripts - PowerShell | Microsoft Learn
# 
# learn.microsoft.com
# 
# about_Execution_Policies - PowerShell - Microsoft Learn
# 
# learn.microsoft.com
# 
# 
# - And if I would like to include some AutoHotkey commands or scripts I would like to run from inside the PowerShell script, could that also be done?
# 
# You can indeed execute AutoHotkey scripts from within a PowerShell script. Here's how:
# 
# 1. Using the Start-Process cmdlet:
# 
# This is the most straightforward method.
# 
# PowerShell
# 
# Start-Process -FilePath "C:\Path\To\Your\AutoHotkeyScript.ahk" 
# Replace "C:\Path\To\Your\AutoHotkeyScript.ahk" with the actual path to your AutoHotkey script file.
# 2. Using the Run command within AutoHotkey:
# 
# If you need more control or want to pass arguments to the PowerShell script from within AutoHotkey, you can use the Run command within your AutoHotkey script to execute the PowerShell script.
# 
# In your AutoHotkey script:
# 
# AutoHotkey
# 
# Run, PowerShell.exe -File "C:\Path\To\Your\PowerShellScript.ps1" 
# Example PowerShell Script (post_install.ps1):
# 
# PowerShell
# 
# # Install Chocolatey packages
# choco install googlechrome 
# choco install vscode 
# 
# # Run AutoHotkey script
# Start-Process -FilePath "C:\Path\To\Your\AutoHotkeyScript.ahk" 
# Important Considerations:
# 
# Error Handling: Implement error handling within both your PowerShell and AutoHotkey scripts to gracefully handle potential issues during execution.
# Execution Policy: Ensure that the necessary execution policies are set correctly for both PowerShell and AutoHotkey scripts.
# Testing: Thoroughly test your scripts in a safe environment before running them on a freshly installed system.
# By combining PowerShell and AutoHotkey, you can create powerful and flexible automation solutions for your post-installation tasks.
# 
# I hope this comprehensive guide helps you effectively integrate AutoHotkey into your PowerShell scripts!
