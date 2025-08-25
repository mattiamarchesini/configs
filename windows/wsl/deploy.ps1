# as admin

# for Pro/Enterprise editions, use full Hyper-V stack (Hyper-V Manager, hypervisor, VM services)
$edition = (Get-CimInstance Win32_OperatingSystem).Caption
if ($edition -match "Pro|Enterprise") {
  dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
}

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

#reboot

wsl --set-default-version 2
wsl --install --no-launch -d fedora
wsl --set-default FedoraLinux-42
