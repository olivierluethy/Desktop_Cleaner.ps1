# Desktop Cleaner

A small PowerShell script that tidies your Windows desktop by sorting loose files
into category folders based on their file extension.

## Features

- Creates `Images`, `Documents`, `Music`, `Videos`, and `Other` folders on the
  desktop if they don't already exist.
- Moves every file on the desktop into the matching folder:
  - **Images**: `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`
  - **Documents**: `.doc`, `.docx`, `.txt`, `.pdf`
  - **Music**: `.mp3`, `.wav`, `.wma`
  - **Videos**: `.mp4`, `.avi`, `.wmv`, `.mov`
  - **Other**: anything else
- Prints a confirmation when done.

## Tech

- Windows PowerShell (no external modules required).

## Usage

Run from a PowerShell prompt:

```powershell
.\DesktopCleaner.ps1
```

If script execution is blocked, you may need to allow it for the current session:

```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
```

> Note: files are moved (not copied). Review the extension mapping before running.
