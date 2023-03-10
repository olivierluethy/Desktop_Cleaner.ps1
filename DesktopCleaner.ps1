# Define the desktop and the subfolders to sort files into
$desktopPath = [Environment]::GetFolderPath("Desktop")
$imageFolderPath = Join-Path $desktopPath "Images"
$docFolderPath = Join-Path $desktopPath "Documents"
$musicFolderPath = Join-Path $desktopPath "Music"
$videoFolderPath = Join-Path $desktopPath "Videos"
$otherFolderPath = Join-Path $desktopPath "Other"

# Create the subfolders if they don't exist
$foldersToCreate = @($imageFolderPath, $docFolderPath, $musicFolderPath, $videoFolderPath, $otherFolderPath)
foreach ($folderPath in $foldersToCreate) {
    if (-not (Test-Path $folderPath -PathType Container)) {
        New-Item -ItemType Directory -Path $folderPath | Out-Null
    }
}

# Get all the files on the desktop
$desktopFiles = Get-ChildItem -Path $desktopPath -File

# Sort the files into the appropriate subfolders based on their file extension
foreach ($file in $desktopFiles) {
    switch ($file.Extension.ToLower()) {
        ".jpg", ".jpeg", ".png", ".gif", ".bmp" {
            Move-Item -Path $file.FullName -Destination $imageFolderPath
        }
        ".doc", ".docx", ".txt", ".pdf" {
            Move-Item -Path $file.FullName -Destination $docFolderPath
        }
        ".mp3", ".wav", ".wma" {
            Move-Item -Path $file.FullName -Destination $musicFolderPath
        }
        ".mp4", ".avi", ".wmv", ".mov" {
            Move-Item -Path $file.FullName -Destination $videoFolderPath
        }
        default {
            Move-Item -Path $file.FullName -Destination $otherFolderPath
        }
    }
}

Write-Host "Desktop cleaning complete."
