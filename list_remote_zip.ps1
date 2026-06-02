Add-Type -AssemblyName System.IO.Compression.FileSystem
$zipPath = 'c:\Users\ok790\OneDrive\Desktop\remote\remote.zip'
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
foreach ($entry in $zip.Entries) { Write-Output "$($entry.FullName)  [$($entry.Length)]" }
$zip.Dispose()
