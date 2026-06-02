Add-Type -AssemblyName System.IO.Compression.FileSystem

$srcDir    = 'c:\Users\ok790\OneDrive\Desktop\remote\latex_src'
$zipOut    = 'c:\Users\ok790\OneDrive\Desktop\remote\Research Paper\ICCCNT_LaTeX_Source_Oishik.zip'

# Files to include in submission zip
$include = @(
    'main.tex',
    'NTL vs popu.png',
    'districts_india.png',
    'ndvi correction.png',
    'nigga.png',
    'pred vs actual.png',
    'real_first.png',
    'residual latest.png',
    'residual_india.png',
    'rural and urban.png'
)

if (Test-Path $zipOut) { Remove-Item $zipOut }

$zip = [System.IO.Compression.ZipFile]::Open($zipOut, [System.IO.Compression.ZipArchiveMode]::Create)
foreach ($name in $include) {
    $full = Join-Path $srcDir $name
    if (Test-Path $full) {
        [System.IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $full, $name) | Out-Null
        Write-Output "Added: $name"
    } else {
        Write-Output "MISSING: $name"
    }
}
$zip.Dispose()
Write-Output "`nSubmission zip created at: $zipOut"
