# PowerShell-Skript zum Erzeugen von 10GB Zufallsdaten in einer Textdatei
# Datei: generate_trash.ps1

$outfile = "random_trash.txt"
$chunkSize = 1MB
$totalChunks = 10240  # 10GB / 1MB

if (Test-Path $outfile) { Remove-Item $outfile }

for ($i = 1; $i -le $totalChunks; $i++) {
    $bytes = [System.Text.Encoding]::ASCII.GetString((1..$chunkSize | ForEach-Object { Get-Random -Minimum 33 -Maximum 127 }))
    Add-Content -Path $outfile -Value $bytes
    if ($i % 100 -eq 0) { Write-Host "$($i/1024) GB geschrieben..." }
}

Write-Host "Fertig: $outfile (10GB Zufallsdaten)"
