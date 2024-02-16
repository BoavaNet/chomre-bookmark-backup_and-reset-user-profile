# Define paths
$userDataPath = "C:\Users\$env:USERNAME\AppData\Local\Google\Chrome\User Data"
$backupPath = "C:\Backup\ChromeBookmarks"

# Backup Bookmarks
$defaultProfilePath = Join-Path -Path $userDataPath -ChildPath "Default"
$bookmarksFile = Join-Path -Path $defaultProfilePath -ChildPath "Bookmarks"
$backupFile = Join-Path -Path $backupPath -ChildPath "Bookmarks.html"

if (Test-Path -Path $bookmarksFile) {
    New-Item -Path $backupPath -ItemType Directory -Force
    Copy-Item -Path $bookmarksFile -Destination $backupFile -Force
}

# Delete User Profiles
Remove-Item -Path $userDataPath -Recurse -Force