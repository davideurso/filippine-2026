$ErrorActionPreference = "Stop"

Write-Host "Pubblicazione mappa Filippine..." -ForegroundColor Cyan

if (-not (Test-Path ".git")) {
    Write-Host "Questa cartella non è ancora collegata a un repository GitHub." -ForegroundColor Yellow
    Write-Host "Esegui prima il comando di collegamento indicato da ChatGPT." -ForegroundColor Yellow
    exit 1
}

if (-not (Test-Path "index.html")) {
    Write-Host "Errore: index.html non trovato." -ForegroundColor Red
    exit 1
}

git add index.html

$changes = git status --porcelain
if (-not $changes) {
    Write-Host "Nessuna modifica da pubblicare." -ForegroundColor Green
    exit 0
}

$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "Aggiornamento mappa Filippine $timestamp"
git push origin main

Write-Host "Mappa pubblicata. GitHub Pages manterrà lo stesso link." -ForegroundColor Green
