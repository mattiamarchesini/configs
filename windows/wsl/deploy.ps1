# admin
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
# for enterprise edition
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V-All /all /norestart

#reboot

wsl --install -d fedora  --no-launch
wsl --set-default fedora
