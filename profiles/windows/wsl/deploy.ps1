# as admin
$win_edition = (Get-CimInstance Win32_OperatingSystem).Caption

# for Pro/Enterprise editions, install the full Hyper-V stack (Hyper-V Manager, hypervisor, VM services)
if ($win_edition -match "Pro|Enterprise") {
  dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart
}
else { # Just install the VirtualMachinePlatform subset feature
  dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
}

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

#reboot

wsl --set-default-version 2
wsl --install --no-launch -d fedora
wsl --set-default FedoraLinux-42
