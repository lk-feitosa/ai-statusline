$dest = Join-Path $env:USERPROFILE ".local\bin"
New-Item -ItemType Directory -Force -Path $dest | Out-Null

Copy-Item (Join-Path $PSScriptRoot "bin\ai-statusline.cjs") (Join-Path $dest "ai-statusline.cjs") -Force
Copy-Item (Join-Path $PSScriptRoot "bin\ai-quota-fetcher.cjs") (Join-Path $dest "ai-quota-fetcher.cjs") -Force

$cmdPath = (Join-Path $dest "ai-statusline.cjs") -replace "\\", "/"
Write-Host "Scripts instalados em: $dest"
Write-Host ""
Write-Host "Cole o trecho abaixo nos arquivos de configuracao:"
Write-Host ""
Write-Host "1) ~/.claude/settings.json:"
Write-Host "   `"statusLine`": { `"type`": `"command`", `"command`": `"node $cmdPath claude`" }"
Write-Host ""
Write-Host "2) ~/.gemini/antigravity-cli/settings.json:"
Write-Host "   `"statusLine`": { `"type`": `"command`", `"command`": `"node $cmdPath agy`", `"enabled`": true }"
