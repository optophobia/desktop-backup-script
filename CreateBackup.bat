@echo off
rem ============================================================
rem  Script:      CreateBackup.bat
rem  Description: Backs up the contents of the Windows Desktop
rem               to a USB thumb drive in a dated folder.
rem               Excludes shortcuts (.lnk), batch files (.bat)
rem               and Windows system files (desktop.ini).
rem  Author:      Edward Butler
rem  Site:        gitHub.com/optophobia
rem  Created:     April 2026
rem
rem  Version History:
rem  v1.0 - April 2026 - Initial release
rem ============================================================
setlocal enabledelayedexpansion

echo Searching for USB drive...

for /f "usebackq delims=" %%d in (`powershell -nologo -command "Get-WmiObject Win32_LogicalDisk | Where-Object {$_.DriveType -eq 2} | Select-Object -First 1 -ExpandProperty DeviceID"`) do (
    set "USB=%%d"
)

if not defined USB (
    echo.
    echo ERROR: No USB drive found. Please plug in your USB drive and try again.
    pause
    exit /b 1
)

echo Found USB drive: %USB%

echo Backing up Desktop to %USB%...

set "PSFILE=%TEMP%\dobackup.ps1"

echo $date = Get-Date -Format 'yyyy-MM-dd' > "%PSFILE%"
echo $dest = "%USB%\Backup-" + $date >> "%PSFILE%"
echo $source = [Environment]::GetFolderPath('Desktop') >> "%PSFILE%"
echo Write-Host "Copying to $dest" >> "%PSFILE%"
echo Copy-Item -Path $source -Destination $dest -Recurse -Exclude '*.lnk','*.bat','desktop.ini' >> "%PSFILE%"
echo Write-Host "Done!" >> "%PSFILE%"

powershell -nologo -ExecutionPolicy Bypass -File "%PSFILE%"

del "%PSFILE%"

echo.
echo ============================================
echo  BACKUP COMPLETED SUCCESSFULLY :)
echo ============================================
echo. 
echo. 
powershell -command "Write-Host 'Ann - Just Press any key to finish, and then you can eject your USB when ready...' -ForegroundColor Green"
pause > nul