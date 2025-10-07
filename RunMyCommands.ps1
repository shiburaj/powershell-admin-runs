Clear-Host
Write-Host "=============================================" -ForegroundColor Cyan
Write-Host "     🔧 ADMINISTRATIVE TOOL MENU" -ForegroundColor Yellow
Write-Host "============================================="
Write-Host "This script requires administrative privileges."
Write-Host ""

function Show-Menu {
    Write-Host "1. Restart Print Spooler Service"
    Write-Host "2. List Running Services"
    Write-Host "3. Create Test File in C:\Temp"
    Write-Host "4. Display System Info"
    Write-Host "5. Exit"
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
            Write-Host "`nRestarting Print Spooler..." -ForegroundColor Yellow
            Stop-Service -Name "Spooler" -Force
            Start-Service -Name "Spooler"
            Write-Host "✅ Print Spooler restarted successfully!" -ForegroundColor Green
            Pause
        }
        '2' {
            Write-Host "`nRunning services:" -ForegroundColor Yellow
            Get-Service | Where-Object {$_.Status -eq "Running"} | Select-Object -First 20
            Pause
        }
        '3' {
            Write-Host "`nCreating test file..." -ForegroundColor Yellow
            New-Item -Path "C:\Temp\admin_menu_test.txt" -ItemType File -Force | Out-Null
            Write-Host "✅ File created at C:\Temp\admin_menu_test.txt" -ForegroundColor Green
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
