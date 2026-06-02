Add-Type -AssemblyName System.IO.Compression.FileSystem
$zipPath = 'c:\Users\ok790\OneDrive\Desktop\remote\remote.zip'
$extractPath = 'c:\Users\ok790\OneDrive\Desktop\remote\latex_src'
if (Test-Path $extractPath) { Remove-Item $extractPath -Recurse -Force }
[System.IO.Compression.ZipFile]::ExtractToDirectory($zipPath, $extractPath)
Write-Output "Extracted to $extractPath"
Get-ChildItem $extractPath | Select-Object Name, Length
