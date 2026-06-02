Add-Type -AssemblyName System.IO.Compression.FileSystem

# Extract the rough draft to read content
$zipPath = 'c:\Users\ok790\OneDrive\Desktop\remote\REMOTE_FINAL_PROJECT_OISHIK.zip'
$extractPath = 'c:\Users\ok790\OneDrive\Desktop\remote\_extracted'

if (Test-Path $extractPath) { Remove-Item $extractPath -Recurse -Force }

# Extract just the research paper folder
$zip = [System.IO.Compression.ZipFile]::OpenRead($zipPath)
foreach ($entry in $zip.Entries) {
    if ($entry.FullName -like "Research Paper/*" -or $entry.FullName -like "Research Diary*" -or $entry.FullName -like "Readme*") {
        $destPath = Join-Path $extractPath $entry.FullName
        $destDir = [System.IO.Path]::GetDirectoryName($destPath)
        if (-not (Test-Path $destDir)) { New-Item -ItemType Directory -Path $destDir -Force | Out-Null }
        if ($entry.Length -gt 0) {
            [System.IO.Compression.ZipFileExtensions]::ExtractToFile($entry, $destPath, $true)
        }
    }
}
$zip.Dispose()
Write-Output "Extraction done"
