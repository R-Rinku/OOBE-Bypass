@echo off
setlocal EnableExtensions

rem CleanOps Windows setup helper.
rem Run from Shift+F10 during Windows setup. Requires an internet connection.

set "BASE_URL=https://bypass.dnslabs.tech"
set "SETUP_DIR=%ProgramData%\CleanOps"

echo.
echo Configuring India settings and the offline-account option...

rem India: GeoID 113, English (India) culture, and India Standard Time (UTC+05:30).
powershell.exe -NoProfile -ExecutionPolicy Bypass -Command "Set-TimeZone -Id 'India Standard Time'; Set-Culture -CultureInfo 'en-IN'; Set-WinHomeLocation -GeoId 113"

rem Enables the offline account route in OOBE after restart.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE" /v BypassNRO /t REG_DWORD /d 1 /f >nul

if not exist "%SETUP_DIR%" mkdir "%SETUP_DIR%"
curl.exe -fsSL "%BASE_URL%/first-login.ps1" -o "%SETUP_DIR%\first-login.ps1"
if errorlevel 1 (
  echo.
  echo Could not download the post-login installer. Nothing has been scheduled.
  pause
  exit /b 1
)

rem Run only once, when the first administrator signs in.
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /v CleanOpsFirstLogin /t REG_SZ /d "powershell.exe -NoProfile -ExecutionPolicy Bypass -File %SETUP_DIR%\first-login.ps1" /f >nul

echo.
echo Done. The PC will restart now.
echo In Windows setup, choose the offline/local-account option if it is shown.
shutdown.exe /r /t 5
