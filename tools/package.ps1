$root = Split-Path $PSScriptRoot -Parent
$src  = "$root\src"
$out  = "$root\dist\meu_plugin.rbz"
New-Item -ItemType Directory -Force "$root\dist" | Out-Null
Remove-Item $out -ErrorAction SilentlyContinue

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$zip = [IO.Compression.ZipFile]::Open($out, 'Create')

try {
    Get-ChildItem $src -Recurse -File | ForEach-Object {
        $rel = $_.FullName.Substring($src.Length + 1).Replace('\', '/')
        [void][IO.Compression.ZipFileExtensions]::CreateEntryFromFile($zip, $_.FullName, $rel)
    }
} finally {
    $zip.Dispose()
}
Write-Host "Gerado: $out"
