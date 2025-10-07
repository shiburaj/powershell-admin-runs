Clear-Host
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "     >> TexStudio Installer using Chocolatey" -ForegroundColor Yellow
Write-Host "============================================="
Write-Host "This script requires administrative privileges."
Write-Host ""

function Show-Menu {
    Write-Host "1. Install TexStudio"
    Write-Host "2. Uninstall TexStudio"
    Write-Host "3. Check TexStudio Installation"
    Write-Host "4. Exit"
    Write-Host "---------------------------------------------"
}

function Pause {
    Write-Host ""
    Write-Host "Press any key to return to menu..." -ForegroundColor DarkGray
    [void][System.Console]::ReadKey($true)
}

do {
    Show-Menu
    $choice = Read-Host "Enter your choice (1-5)"

    switch ($choice) {
        '1' {
            Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
            choco source add -n nexus-choco -s http://nexus.rcoe.co.in/repository/choco/ --priority=1
            choco install -y miktex texstudio
            Write-Host "✅ TexStudio installed successfully!" -ForegroundColor Green
            Pause
        }
        '2' {
            Write-Host "`nUninstalling TexStudio..." -ForegroundColor Yellow
            choco uninstall -y miktex texstudio
            Write-Host "✅ TexStudio uninstalled successfully!" -ForegroundColor Green
            Pause
        }
        '3' {
            Write-Host "`nChecking TexStudio installation..." -ForegroundColor Yellow
            choco list | Where-Object { $_ -match "texstudio" }
            Pause
        }
        '4' {
            Write-Host "`nSystem Information:" -ForegroundColor Yellow
            Get-ComputerInfo | Select-Object CsName, WindowsVersion, OsArchitecture, CsProcessors, CsTotalPhysicalMemory
            Pause
        }
        '5' {
            Write-Host "`nExiting..." -ForegroundColor Cyan
            break
        }
        Default {
            Write-Host "`nInvalid choice. Please try again." -ForegroundColor Red
            Start-Sleep -Seconds 1
        }
    }
} while ($choice -ne '5')

Write-Host "`nGoodbye!" -ForegroundColor Cyan
Start-Sleep -Seconds 1
