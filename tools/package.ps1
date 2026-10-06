$root = Split-Path $PSScriptRoot -Parent
New-Item -ItemType Directory -Force "$root\dist" | Out-Null
$zip = "$root\dist\meu_plugin.zip"
Remove-Item $zip, "$root\dist\meu_plugin.rbz" -ErrorAction SilentlyContinue
Compress-Archive -Path "$root\src\*" -DestinationPath $zip
Rename-Item $zip "meu_plugin.rbz"
