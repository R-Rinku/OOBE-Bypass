@echo off
title Bypass NRO - Custom AutoUnattend Installer

echo ============================================================
echo   Bypass NRO - Custom Windows Installation
echo   Based on ChrisTitusTech/bypassnro with enhancements
echo ============================================================
echo.
echo This will download and apply your custom autounattend.xml
echo which includes:
echo   - Hardware bypasses (TPM, SecureBoot, RAM)
echo   - Full debloating
echo   - Auto-install Chrome, 7-Zip, VLC, Git, Notepad++
echo   - India Standard Time zone
echo   - And more tweaks
echo.
echo Press any key to continue or close this window to cancel...
pause >nul

echo.
echo Downloading custom autounattend.xml...
curl -L -o https://raw.githubusercontent.com/R-Rinku/OOBE-Bypass/refs/heads/main/autounattend.xml

if %errorlevel% neq 0 (
    echo [ERROR] Failed to download autounattend.xml
    echo Please check your URL and internet connection.
    pause
    exit /b 1
)

echo.
echo File downloaded successfully!
echo Applying custom configuration with Sysprep...
echo This will reboot your system automatically.

%WINDIR%\System32\Sysprep\Sysprep.exe /oobe /unattend:C:\Windows\Panther\unattend.xml /reboot

echo.
echo If you see this message, something went wrong.
pause
