Add-Type -AssemblyName System.IO.Compression.FileSystem
$zipPath = 'c:\Users\ok790\OneDrive\Desktop\remote\REMOTE_FINAL_PROJECT_OISHIK.zip'
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
foreach ($entry in $zip.Entries) { Write-Output $entry.FullName }
$zip.Dispose()
