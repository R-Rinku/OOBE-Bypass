$ErrorActionPreference = 'Continue'

$packages = @(
    'Brave.Brave',
    'VideoLAN.VLC',
    'WhatsApp.WhatsApp',
    '7zip.7zip'
)

if (-not (Get-Command winget.exe -ErrorAction SilentlyContinue)) {
    Write-Host 'winget is not available. Open Microsoft Store and install App Installer, then run this script again.'
    exit 1
}

foreach ($package in $packages) {
    Write-Host "Installing $package..."
    winget.exe install --id $package --exact --silent --accept-source-agreements --accept-package-agreements
}

