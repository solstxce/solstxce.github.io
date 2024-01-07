Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
try {
    Get-Command -Name "scoop" -ErrorAction Stop
}
catch {
    irm https://get.scoop.sh | iex
}
scoop install aria2
# $userInput = Read-Host "Are you using KLU-WIFI? [y/n] :"

Write-Host "We will be installing a VPN now due to KLU-WIFI blocking dl.google.com\n"
try {
    Get-Command "warp-cli" -ErrorAction Stop
}
catch {
    aria2c -x 16 -s 16 https://1111-releases.cloudflareclient.com/windows/Cloudflare_WARP_Release-x64.msi
    ./Cloudflare_WARP_Release-x64.msi
     Write-Host "Waiting for warp-cli to be installed..."
     Start-Sleep -Seconds 60
 
}

scoop install git
scoop bucket add extras
scoop install grep
# scoop install android-studio
scoop bucket add java
if ($userInput -eq "y") {
    warp-cli connect
}
scoop install java/openjdk17
scoop uninstall aria2
scoop install adb
scoop install android-clt