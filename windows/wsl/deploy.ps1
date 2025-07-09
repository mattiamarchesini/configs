# admin
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

# for enterprise edition
$edition = (Get-CimInstance Win32_OperatingSystem).Caption
if ($edition -match "Enterprise") {
  dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
}

#reboot
wsl --install --no-launch -d fedora
wsl --set-default FedoraLinux-42
