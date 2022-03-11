@echo off
cls

set inmenu=0

set version=1.0.0
set "header=GWE's 000.exe VIRUS REMOVAL TOOL - v%version%&echo."

net session >nul 2>&1
if %errorlevel% neq 0 (
echo No elevation found! Getting elevation.
echo Afterwards, this instance of the script will be closed
echo and run with administrator privileges.
goto elevation
) else (goto check)

:elevation
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params=%*
echo UAC.ShellExecute "cmd", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"
"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /b

:check
title GWE's 000.exe Virus Removal Tool - v%version%
cls
echo %header%
echo Diagnosing your computer...
echo.
echo Checking account...
if "%username%" == "UR NEXT" (goto username2) else (
echo Username: Intact (OK^)
set usernameurnext=0
goto next
)

:username2
if exist "%systemdrive%\users\UR NEXT" (
echo Username: Intact (OK^)
set usernameurnext=0
) else (
echo Username: Changed (NOT OK^)
set usernameurnext=1
)

:next
echo.
echo Checking the registry...

reg query HKCR\txtfile\DefaultIcon /ve | findstr "%systemdrive%\Users\%username%\AppData\Local\Temp\icon.ico" 2>nul
if %errorlevel% == 0 (
echo .TXT File Default Icon: UR NEXT Icon (NOT OK^)
set txtfile=1
) else (
echo .TXT File Default Icon: Not UR NEXT Icon (OK^)
set txtfile=0
)

reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies | findstr System >nul 2>&1
if %errorlevel% == 0 (goto taskmgr0) else (
echo Task Manager: Enabled (OK^)
set disabletaskmgr=0
goto autorestartshell1
)

:taskmgr0
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System | findstr DisableTaskMgr >nul 2>&1
if %errorlevel% == 0 (goto taskmgr1) else (
echo Task Manager: Enabled (OK^)
set disabletaskmgr=0
goto autorestartshell1
)

:taskmgr1
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr | findstr 1 >nul 2>&1
if %errorlevel% == 0 (
echo Task Manager: Disabled (NOT OK^)
set disabletaskmgr=1
) else (
echo Task Manager: Enabled (OK^)
set disabletaskmgr=0
)

:autorestartshell1
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" | findstr AutoRestartShell >nul 2>&1
if %errorlevel% == 0 (goto autorestartshell2) else (
echo Auto Restart Shell: Not Set (OK^)
set noautorestartshell=0
goto temp
)

:autorestartshell2
reg query "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoRestartShell /t REG_DWORD | findstr 0 >nul 2>&1
if %errorlevel == 0 (
echo Auto Restart Shell: Disabled (NOT OK^)
set noautorestartshell=1
) else (
echo Auto Restart Shell: Enabled
set noautorestartshell=0 (OK^)
)

:temp
echo.
echo Checking Temp folder...

if exist "%temp%\icon.ico" (
echo UR NEXT Icon File: Exists (NOT OK^)
set texticon=1
) else (
echo UR NEXT Icon File: Not Found (OK^)
set texticon=0
)

if exist "%temp%\text.txt" (
echo UR NEXT Text Document: Exists (NOT OK^)
set txt=1
) else (
echo UR NEXT Text Document: Not Found (OK^)
set txt=0
)

if exist "%temp%\windl.bat" (
echo WINDL Batch File: Exists (NOT OK^)
set windl=1
) else (
echo WINDL Batch File: Not Found (OK^)
set windl=0
)

if exist "%temp%\one.rtf" (
echo OPENME Rich Text Format: Exists (NOT OK^)
set one=1
) else (
echo OPENME Rich Text Format: Not Found (OK^)
set one=0
)

if exist "%temp%\rniw.exe" (
echo Runaway Application: Exists (NOT OK^)
set subox=1
) else (
echo Runaway Application: Not Found (OK^)
set subox=0
)

echo.
echo Checking other stuff...
wmic path Win32_OperatingSystem get Version /value | findstr "6.2 6.3 10.0" >nul 2>&1
if %errorlevel% == 1 (
echo WindowsApps Folder: Skipped Checking - Not in Windows 7 and under (OK^)
set nowindowsappsskip=1
set nowindowsapps=0
goto suboxstartup
)

if not exist "%programfiles%\windowsapps\" (
echo WindowsApps Folder: Missing/Deleted (NOT OK^)
set nowindowsappsskip=0
set nowindowsapps=1
) else (
echo WindowsApps Folder: Exists (OK^)
set nowindowsappsskip=0
set nowindowsapps=0
)

:suboxstartup
if exist "%programdata%\Microsoft\Windows\Start Menu\Programs\Startup\rniw.exe" (
echo Runaway Application at Startup: Exists (NOT OK^)
set suboxstartup=1
) else (
echo Runaway Application at Startup: Not Found (OK^)
set suboxstartup=0
)

if exist "%userprofile%\desktop\UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR N*XT.txt" (
echo UR NEXT Text Document in Desktop x 400: Exists (NOT OK^)
set fourtxt=1
) else (
echo UR NEXT Text Document in Desktop x 400: Not Found (OK^)
set fourtxt=0
)

if exist "%userprofile%\desktop\OPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENME.rtf" (
echo OPENME Rich Text Format in Desktop: Exists (NOT OK^)
set onedesktop=1
) else (
echo OPENME Rich Text Format in Desktop: Not Found (OK^)
set onedesktop=0
)

echo.
if %usernameurnext% == 0 if %txtfile% == 0 if %disabletaskmgr% == 0 if %noautorestartshell% == 0 if %texticon% == 0 if %txt% == 0 if %windl% == 0 if %one% == 0 if %subox% == 0 if %nowindowsapps% == 0 if %suboxstartup% == 0 if %fourtxt% == 0 if %onedesktop% == 0 (
echo RESULT: Your computer is free of 000.exe!
set virus=0
echo.
goto premenu
)
if %usernameurnext% == 1 if %txtfile% == 1 if %disabletaskmgr% == 1 if %noautorestartshell% == 1 if %texticon% == 1 if %txt% == 1 if %windl% == 1 if %one% == 1 if %subox% == 1 if %nowindowsapps% == 1 if %suboxstartup% == 1 if %fourtxt% == 1 if %onedesktop% == 1 (
echo RESULT: Your computer is fully infected by 000.exe! You are one (un^)lucky user.
set virus=1
echo.
goto premenu
)

echo RESULT: Your computer is partially infected by 000.exe!
set virus=1
echo.


:premenu
if %inmenu% == 0 (
echo Press any key to enter the menu.
pause >nul
if %virus% == 0 (goto menu1) else (goto menu2)
) else (
echo Press any key to return.
pause >nul
if %virus% == 0 (goto menu1) else (goto menu2)
)

:menu1
set inmenu=1
cls
echo %header%
echo You aren't infected with 000.exe yet. You should back
echo up your username and desktop in case of an infection.
echo.
echo [1] UNAVAILABLE
echo [2] Credits
echo [3] Rediagnose your computer for 000.exe (Refresh)
echo [4] Back up username for restore
echo [5] Back up WindowsApps folder for restore
echo [6] Back up desktop for restore
echo.
echo [7] Exit
echo.
choice /n /c 234567 /M "Your choice: "
if %errorlevel% == 1 (goto credits)
if %errorlevel% == 2 (goto check)
if %errorlevel% == 3 (goto backup_username)
if %errorlevel% == 4 (goto backup_windowsapps0)
if %errorlevel% == 5 (goto backup_desktop0)
if %errorlevel% == 6 (goto exit)

:menu2
cls
echo %header%
echo Now's your chance to remove that nasty virus! Select
echo option 1 to remove 000.exe!
echo.
echo [1] Remove 000.exe
echo [2] Credits
echo [3] Rediagnose your computer for 000.exe (Refresh)
echo [4] Back up username for restore
echo [5] Back up WindowsApps folder for restore
echo [6] Back up desktop for restore
echo.
echo [7] Exit
echo.
choice /n /c 1234567 /M "Your choice: "
if %errorlevel% == 1 (goto fix0)
if %errorlevel% == 2 (goto credits)
if %errorlevel% == 3 (goto check)
if %errorlevel% == 4 (goto backup_username)
if %errorlevel% == 5 (goto backup_windowsapps0)
if %errorlevel% == 6 (goto backup_desktop0)
if %errorlevel% == 7 (goto exit)
:credits
cls
echo %header%
echo (c) 2021-2022 GamingWithEvets.
echo All rights go to their respective owners.
echo.
goto premenu

:backup_username
cls
echo %header%
if %usernameurnext% == 1 (
echo Oops, you can't back up a username like that :(
echo It's infected by 000.exe!
echo If this message is incorrect, use the Refresh option in the menu.
echo.
goto premenu
) else (
echo Backing up username...
echo %username% > "%temp%\username.txt"
if "%FullName%" == "" (attrib +S +H "%temp%\username.txt") else (
echo %FullName% >> "%temp%\username.txt"
attrib +S +H "%temp%\username.txt"
)
echo Username backed up successfully!
echo.
goto premenu
)

:backup_windowsapps0
cls
echo %header%
if %nowindowsappsskip% == 1 (
echo Sorry, you're not running Windows 8 and above,
echo so you don't have a WindowsApps folder!
echo If this message is incorrect, use the Refresh option in the menu.
echo.
goto premenu
) else (goto backup_windowsapps1)

:backup_windowsapps1
if %nowindowsapps% == 1 (
echo Uh oh! Your WindowsApps folder is deleted!
echo So no backup for you!
echo If this message is incorrect, use the Refresh option in the menu.
echo.
goto premenu
)
echo Backing up WindowsApps folder... This may take a while.
xcopy /E /Q /I "%programfiles%\windowsapps\" "%temp%\WindowsApps_temp\" >nul 2>&1
attrib /D +S +H "%temp%\WindowsApps_temp"
echo WindowsApps folder backed up successfully!
echo.
goto premenu

:backup_desktop0
cls
echo %header%
if %virus% == 1 (
echo Sorry, your desktop was deleted by the
echo virus and replaced by the UR NEXT files
echo and the OPENME file, so there's nothing
echo to back up! To back up your desktop,
echo remove the virus first.
echo If this message is incorrect, use the Refresh option in the menu.
echo.
goto premenu
) else (goto backup_desktop1)

:backup_desktop1
echo Backing up desktop...
xcopy /E /Q /I "%userprofile%\desktop\" "%temp%\Desktop_temp\" >nul 2>&1
attrib /D +S +H "%temp%\Desktop_temp"
echo Desktop backed up successfully!
echo.
goto premenu



:fix0
cls
echo 000.exe Virus Fixer by GWE
echo.
if errorlevel == 2 (goto premenu)
echo Attemping to fix your computer...
echo.
if %usernameurnext% == 0 (
echo Username: Skipped
set usernameurnextfixed=1
goto fix1
)
if exist %temp%\username.txt (
echo Username is previously backed up.
echo Restoring username...
set /p usrnamebackup= < %temp%\username.txt
set /p fullnamebackup= << %temp%\username.txt
wmic useraccount where name='%username%' rename '%usrnamebackup%' >nul 2>&1
wmic useraccount where name='%username%' set FullName='%fullnamebackup%' >nul 2>&1
if errorlevel == 0 (
echo Username: Restored
set usernameurnextfixed=1
) else (
echo Username: Cannot Restore
set usernameurnextfixed=0
)) else (
echo Username: Cannot Restore (Not Backed Up^)
set usernameurnextfixed=0
)

:fix1
echo.
echo Attemping to fix the registry...
if %txtfile% == 0 (
echo .TXT File Default Icon: Skipped
goto fix2
)
reg add HKCR\txtfile\DefaultIcon /ve /d %%SystemRoot%%\system32\imageres.dll,-102 /f >nul 2>&1
if errorlevel == 0 (echo .TXT File Default Icon: Fixed) else (echo .TXT File Default Icon: Cannot Fix)

:fix2
if %disabletaskmgr% == 0 (
echo Task Manager: Skipped
goto fix3
)
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f >nul 2>&1
if errorlevel == 0 (echo Task Manager: Re-enabled) else (echo Task Manager: Cannot Re-enable)

:fix3
if %noautorestartshell% == 0 (
echo Auto Restart Shell: Skipped
goto fix4
)
reg delete "HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" /v AutoRestartShell /f >nul 2>&1
if errorlevel == 0 (echo Auto Restart Shell: Changed to Not Set) else (echo Auto Restart Shell: Cannot Change)

:fix4
echo.
echo Attemping to delete files from Temp folder...
if %texticon% == 0 (
echo UR NEXT Icon File: Skipped
goto fix5
)
del /f /s /q "%temp%\icon.ico" >nul 2>&1
if errorlevel == 0 (echo UR NEXT Icon File: Deleted) else (echo UR NEXT Icon File: Cannot Delete)

:fix5
if %txt% == 0 (
echo UR NEXT Text Document: Skipped
goto fix6
)
del /f /s /q "%temp%\text.txt" >nul 2>&1
if errorlevel == 0 (echo UR NEXT Text Document: Deleted) else (echo UR NEXT Text Document: Cannot Delete)

:fix6
if %one% == 0 (
echo OPENME Rich Text Document: Skipped
goto fix65
)
del /f /s /q "%temp%\one.rtf" >nul 2>&1
if errorlevel == 0 (echo OPENME Rich Text Document: Deleted) else (echo OPENME Rich Text Format: Cannot Delete)

:fix65
if %windl% == 0 (
echo WINDL Batch File: Skipped
goto fix7
)
del /f /s /q "%temp%\windl.bat" >nul 2>&1
if errorlevel == 0 (echo WINDL Batch File: Deleted) else (echo WINDL Batch File: Cannot Delete)

:fix7
if %subox% == 0 (
echo Runaway Application: Skipped
goto fix8
)
del /f /s /q "%temp%\rniw.exe" >nul 2>&1
if errorlevel == 0 (echo Runaway Application: Deleted) else (echo Runaway Application: Cannot Delete)

:fix8
if %nowindowsapps% == 0 (
echo.
echo WindowsApps Folder: Skipped
goto fix9
)
echo.
echo Attemping to restore WindowsApps folder...
if exist "%temp%\WindowsApps_temp\" (
echo WindowsApps folder is previously backed up.
echo Restoring WindowsApps folder...
xcopy /E /Q /I /Y "%temp%\WindowsApps_temp\" "%programfiles%\windowsapps\" >nul 2>&1
attrib /D -S "%programfiles%\windowsapps"
if errorlevel == 0 (echo WindowsApps Folder: Restored) else (echo WindowsApps Folder: Cannot Restore)
) else (
echo WindowsApps Folder: Cannot Restore (Not Backed Up^)
)

:fix9
echo.
echo Attemping to fix other stuff...
if %suboxstartup% == 0 (
echo Runaway Application at Startup: Skipped
goto fix10
)
del /f /s /q "%systemdrive%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup\rniw.exe" >nul 2>&1
if errorlevel == 0 (echo Runaway Application at Startup: Deleted) else (echo Runaway Application at Startup: Cannot Delete)

:fix10
if %fourtxt% == 0 (
echo 400 UR NEXT Text Documents in Desktop: Skipped
goto fix11
)
del /f /s /q "%userprofile%\desktop\UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR NEXT UR N*XT.txt" >nul 2>&1
if errorlevel == 0 (echo UR NEXT Text Document in Desktop x 400: Deleted) else (echo UR NEXT Text Document in Desktop x 400: Cannot Delete)

:fix11
if %onedesktop% == 0 (
echo OPENME Rich Text Document in Desktop: Skipped
goto fix12
)
del /f /s /q "%userprofile%\desktop\OPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENMEOPENME.rtf" >nul 2>&1
if errorlevel == 0 (echo OPENME Rich Text Document in Desktop: Deleted) else (echo OPENME Rich Text Format in Desktop: Cannot Delete)

:fix12
if %fourtxt% == 0 if %onedesktop% == 0 (
echo.
echo Desktop: Skipped
set desktopfixed=2
goto fixend
)
echo.
echo Attemping to restore desktop...
if exist "%temp%\Desktop_temp\" (
echo Desktop is previously backed up.
echo Restoring desktop...
xcopy /E /Q /I /Y "%temp%\Desktop_temp\" "%userprofile%\desktop\" >nul 2>&1
attrib /D -S -H "%userprofile%\desktop"
if errorlevel == 0 (
echo Desktop: Restored
set desktopfixed=1
) else (
echo Desktop: Cannot Restore
set desktopfixed=0
)) else (
echo Desktop: Cannot Restore (Not Backed Up^)
set desktopfixed=0
)

:fixend
echo.
if %nowindowsappsskip% == 0 (echo Fixing complete! You should re-backup your username, WindowsApps folder (just in case^) and desktop again.) else (echo Fixing complete! You should re-backup your username and desktop again.)
if %desktopfixed% == 1 if %usernameurnextfixed% == 1 (echo But you'll have to rearrange the desktop icons and change the wallpaper yourself.)
if %desktopfixed% == 1 if %usernameurnextfixed% == 0 (echo But you'll have to rearrange the desktop icons, change the wallpaper and change the username yourself.)
if %desktopfixed% == 2 if %usernameurnextfixed% == 1 (echo But you'll have to change the wallpaper yourself.)
if %desktopfixed% == 2 if %usernameurnextfixed% == 0 (echo But you'll have to change the wallpaper and change the username yourself.)
if %desktopfixed% == 0 if %usernameurnextfixed% == 0 (echo But you'll have to restore your desktop, change the wallpaper and change the username yourself.)
if %desktopfixed% == 0 if %usernameurnextfixed% == 1 (echo But you'll have to restore your desktop and change the wallpaper yourself.)
echo You must restart your computer for the changes to take effect.
choice /n /c YN /m "Restart now? (Y/N) "
if %errorlevel% == 1 (shutdown /r /t 0) else (
cls
echo %header%
echo If you do not wish to restart your computer now,
echo the program will rediagnose your computer to
echo refresh itself.
echo.
echo Press any key to rediagnose...
pause >nul
goto check
)

:exit
cls
echo Goodbye! And remember,
echo S
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo ST
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STA
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY S
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY SA
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY SAF
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY SAFE
timeout /t 1 /nobreak >nul 2>&1
cls
echo Goodbye! And remember,
echo STAY SAFE!
timeout /t 1 /nobreak >nul 2>&1
cls
exit /b