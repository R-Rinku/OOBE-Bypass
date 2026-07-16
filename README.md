# CleanOps Windows setup

A small Cloudflare Worker that serves a Windows OOBE helper from a short URL.

## What it does

- Sets the time zone to **India Standard Time** (UTC+05:30).
- Sets the Windows region to **India** and culture to `en-IN`.
- Enables the Windows OOBE offline-account path and restarts the computer.
- At the first administrator sign-in, uses `winget` to install Brave, VLC, WhatsApp, and 7-Zip.

It does not create an account or suppress every Windows setup screen. It keeps the remaining OOBE choices under the user's control.

## Apps installed after first sign-in

After you create and sign in to the first **administrator** account, Windows runs the one-time installer automatically. It installs:

- Brave Browser
- VLC media player
- WhatsApp
- 7-Zip

The installation uses `winget`. If `winget` (Microsoft App Installer) is unavailable on that Windows installation, the script stops and tells you to install App Installer from Microsoft Store first.

## User command during OOBE

At the Windows setup screen, press `Shift` + `F10`, then run:

```bat
curl -fsSL bypass.dnslabs.tech -o skip.cmd
call skip.cmd
```

Before sharing the command, review every change to `scripts/setup.cmd` and `scripts/first-login.ps1`—they run with substantial permissions on a Windows PC.
"# OOBE-Bypass" 
